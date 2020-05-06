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
    public class CoursesController : Controller
    {
        private TrinityLMSEntities db = new TrinityLMSEntities();

        // GET: Courses
        public ActionResult Index()
        {
            if (User.IsInRole("Employee"))
            {
                var employeeIndex = db.Courses1
                                   .Where(c => c.IsActive);
                return View(employeeIndex.ToList());
            }

            else
            {
                return View(db.Courses1.ToList());
            }
        }

        // GET: Courses/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses1.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }
        [Authorize(Roles = "Admin,HR Administrator")]
        // GET: Courses/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Courses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseId,CourseName,CourseDescription,IsActive")] Course course)
        {
            if (ModelState.IsValid)
            {
                db.Courses1.Add(course);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(course);
        }
        [Authorize(Roles = "Admin,HR Administrator")]
        // GET: Courses/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses1.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }
        [Authorize(Roles = "Admin,HR Administrator")]
        // POST: Courses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseId,CourseName,CourseDescription,IsActive")] Course course)
        {
            if (ModelState.IsValid)
            {
                db.Entry(course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(course);
        }
        [Authorize(Roles = "Admin,HR Administrator")]
        // GET: Courses/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses1.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }
        [Authorize(Roles = "Admin,HR Administrator")]
        // POST: Courses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Course course = db.Courses1.Find(id);
            db.Courses1.Remove(course);
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
