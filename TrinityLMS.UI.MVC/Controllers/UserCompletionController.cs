using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TrinityLMS.DATA.EF;
using TrinityLMS.UI.MVC.Models;
using System.Data;
using System.Data.Entity;

namespace TrinityLMS.UI.MVC.Controllers
{
    public class UserCompletionController : Controller
    {
        private readonly TrinityLMSEntities db = new TrinityLMSEntities();
        
        // GET: UserCompletion
        public ActionResult Index()
        {
            List<UserDetail> users = db.UserDetails.ToList();
            List<CourseCompletion> courseCompletes = db.CourseCompletions.ToList();

          

            var userCompletions = from user in users
                                  join courseComplete in courseCompletes on user.UserId equals courseComplete.UserId
                                  select new UserCompletionViewModel { userDetail = user, coursecompletion = courseComplete };

            return View(userCompletions);
        }
    }
}