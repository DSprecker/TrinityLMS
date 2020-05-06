using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TrinityLMS.DATA.EF;
using Microsoft.AspNet.Identity;

namespace TrinityLMS.UI.MVC.Controllers
{
    public class UserDetailsController : Controller
    {
        private TrinityLMSEntities db = new TrinityLMSEntities();

        // GET: UserDetails

        [Authorize(Roles = "Admin")]
        [Authorize(Roles = "Manager")]
        public ActionResult Index()
        {
            var userDetails = db.UserDetails.Include(u => u.AspNetUser);
            return View(userDetails.ToList());
        }

        // GET: UserDetails/Details/5
      
        [Authorize(Roles = "Manager, Admin")]
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }

            if (User.IsInRole("Manager") || (User.IsInRole("Admin")))
            {
                //get course progress for viewbag
                
                ViewBag.UserCompletedCourseCount = db.CourseCompletions.
                 Where(cc => cc.UserId == userDetail.UserId).Count();
                ViewBag.TotalCourseCount = db.Courses1.Where(c => c.IsActive == true).Count();

                if (ViewBag.UserCompletedCourseCount == null)
                {
                    ViewBag.UserCompletedCourseCount = 0;
                }

                //custom: also get custom progress for lessons
                ViewBag.UserCompletedLessonCount = db.LessonViews.
                    Where(lv => lv.UserId == userDetail.UserId).Count();
                ViewBag.TotalLessonCount = db.Lessons.Where(l => l.IsActive == true).Count();

            }
            return View(userDetail);
        }

        // GET: UserDetails/Create
        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();
        }

        // POST: UserDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserId,FirstName,LastName,Company")] UserDetail userDetail)
        {
            if (ModelState.IsValid)
            {
                db.UserDetails.Add(userDetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserId = new SelectList(db.AspNetUsers, "Id", "Email", userDetail.UserId);
            return View(userDetail);
        }

        // GET: UserDetails/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserId = new SelectList(db.AspNetUsers, "Id", "Email", userDetail.UserId);
            return View(userDetail);
        }

        // POST: UserDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserId,FirstName,LastName,Company")] UserDetail userDetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(userDetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserId = new SelectList(db.AspNetUsers, "Id", "Email", userDetail.UserId);
            return View(userDetail);
        }

        // GET: UserDetails/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            return View(userDetail);
        }

        // POST: UserDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            UserDetail userDetail = db.UserDetails.Find(id);
            db.UserDetails.Remove(userDetail);
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
