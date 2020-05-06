using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TrinityLMS.DATA.EF;
using TrinityLMS.UI.MVC.Models;
using System.Net.Mail;

namespace TrinityLMS.UI.MVC.Controllers
{
    public class LessonsController : Controller
    {
        private TrinityLMSEntities db = new TrinityLMSEntities();

        // GET: Lessons
        public ActionResult Index()
        {
            var lessons = User.IsInRole("Admin") ?
                 db.Lessons.Include(l => l.Cours).OrderBy(l => l.CourseId)//admin sees all lessons
                : db.Lessons.Where(l => l.IsActive == true).Include(l => l.Cours);//others just see active courses

            if (User.IsInRole("Employee"))
            {
                //get course progress for viewbag
                string userID = User.Identity.GetUserId();
                ViewBag.UserCompletedCourseCount = db.CourseCompletions.
                    Where(cc => cc.UserId == userID).Where(cc => cc.Cours.IsActive == true).Count();
                ViewBag.TotalCourseCount = db.Courses1.Where(c => c.IsActive == true).Count();

                if (ViewBag.UserCompletedCourseCount == null)
                {
                    ViewBag.UserCompletedCourseCount = 0;
                }

                //custom: also get custom progress for lessons
                ViewBag.UserCompletedLessonCount = db.LessonViews.
                    Where(lv => lv.UserId == userID).Where(lv => lv.Lesson.IsActive == true).Count();
                ViewBag.TotalLessonCount = db.Lessons.Where(l => l.IsActive == true).Count();

            }
            return View(lessons.ToList());
        }

        // GET: Lessons/Details/5
        public ActionResult Details(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }

            #region Lesson Views
            UserDetail currentUserId = db.UserDetails.Find(User.Identity.GetUserId());
            List<LessonView> thisUserViews = db.LessonViews.Where(lv => lv.UserId == currentUserId.UserId).ToList();
            int viewsForLesson = thisUserViews.Where(lv => lv.LessonId == lesson.LessonId).Count();

            if (viewsForLesson < 1)
            { 

            LessonView lessonView = new LessonView();//Create a new lesson object when user lands on Details view
            lessonView.LessonId = id;
            lessonView.UserId = currentUserId.UserId;
            lessonView.DateViewed = DateTime.Now;

                db.LessonViews.Add(lessonView);//Save the new "Lesson View" object into database 
                db.SaveChanges();


             int lessonPerCourse = db.Lessons.Where(l => l.CourseId == lesson.CourseId).Count();
             int lessonViewCount = db.LessonViews.Where(l => l.UserId == currentUserId.UserId && l.Lesson.CourseId == lesson.CourseId).Count();
            
                

                if (lessonPerCourse == lessonViewCount)
                {
                    CourseCompletion courseComplete = new CourseCompletion();
                    courseComplete.CourseId = lesson.CourseId;
                    courseComplete.UserId = currentUserId.UserId;
                    courseComplete.DateCompleted = DateTime.Now;
                    db.CourseCompletions.Add(courseComplete);
                    db.SaveChanges();

                    string body = string.Format($"A course has been completed by an employee.<br/> Employee I.D.: {courseComplete.UserId} </br> Course I.D.: {courseComplete.CourseId} </br> Completion Date: {courseComplete.DateCompleted} ");

                    MailMessage msg = new MailMessage("admin@devinsprecker.com", "spreckerd@gmail.com", "Course Completion", body);
                    msg.IsBodyHtml = true;
                    msg.Priority = MailPriority.High;

                    SmtpClient client = new SmtpClient("mail.devinsprecker.com");
                    client.Credentials = new NetworkCredential("admin@devinsprecker.com", "Jesusroseday3");

                    client.Send(msg);


                }
            };


                 

               
            



            #endregion



            

            return View(lesson);
        }



        // GET: Lessons/Create
        [Authorize(Roles = "Admin,HR Administrator")]
        public ActionResult Create()
        {
            ViewBag.CourseId = new SelectList(db.Courses1, "CourseId", "CourseName");
            return View();
        }

        // POST: Lessons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonId,LessonTitle,CourseId,Introduction,VideoURL,PdfFilename,IsActive")] Lesson lesson, HttpPostedFileBase uploadPdf)
        {
            if (ModelState.IsValid)
            {


                #region PdfUpload
                string imageName = "dummy.pdf";

                try
                {
                    if (uploadPdf != null)
                    {
                        imageName = uploadPdf.FileName;

                        string ext = imageName.Substring(imageName.LastIndexOf("."));

                        string goodExt = ".pdf";

                        if (goodExt.Contains(ext.ToLower()))
                        {

                            imageName = Guid.NewGuid() + ext;


                            uploadPdf.SaveAs(
                                 Server.MapPath("~/Content/images/LessonPdf" + imageName));

                        }

                        else
                        {
                            imageName = "dummy.pdf";
                        }
                    }
                }
                catch (Exception)
                {
                    ViewBag.Message = "Unable to load selected file.";
                }
                #endregion

                lesson.PdfFilename = imageName;

                db.Lessons.Add(lesson);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseId = new SelectList(db.Courses1, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // GET: Lessons/Edit/5
        [Authorize(Roles = "Admin,HR Administrator")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseId = new SelectList(db.Courses1, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // POST: Lessons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin,HR Administrator")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonId,LessonTitle,CourseId,Introduction,VideoURL,PdfFilename,IsActive")] Lesson lesson, HttpPostedFileBase uploadPdf)
        {
            if (ModelState.IsValid)
            {


                try
                {
                    if (uploadPdf != null)
                    {
                        string imageName = uploadPdf.FileName;

                        string ext = imageName.Substring(imageName.LastIndexOf("."));

                        string goodExt = ".pdf";

                        if (goodExt.Contains(ext.ToLower()) && (uploadPdf.ContentLength <= 4194304))
                        {

                            imageName = Guid.NewGuid() + ext;


                            uploadPdf.SaveAs(
                                 Server.MapPath("~/Content/images/LessonPdf/" + imageName));

                            if (lesson.PdfFilename != null && lesson.PdfFilename != "dummy.pdf")
                            {
                                System.IO.File.Delete(Server.MapPath("~/Content/images/LessonPdf" + lesson.PdfFilename));
                            }

                            lesson.PdfFilename = imageName;

                        }


                    }
                }
                catch (Exception)
                {
                    ViewBag.Message = "Unable to load selected file";
                }




                db.Entry(lesson).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseId = new SelectList(db.Courses1, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // GET: Lessons/Delete/5
        [Authorize(Roles = "Admin,HR Administrator")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }

        // POST: Lessons/Delete/5

        [Authorize(Roles = "Admin,HR Administrator")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Lesson lesson = db.Lessons.Find(id);
            db.Lessons.Remove(lesson);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
