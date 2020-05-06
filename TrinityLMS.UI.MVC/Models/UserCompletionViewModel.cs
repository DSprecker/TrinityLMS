using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TrinityLMS.DATA.EF;
using System.ComponentModel.DataAnnotations;

namespace TrinityLMS.UI.MVC.Models
{
    public class UserCompletionViewModel
    {


        public UserDetail userDetail { get; set; }
        public CourseCompletion coursecompletion { get; set; }




    }
}