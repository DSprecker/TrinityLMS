using System.Web.Mvc;
using TrinityLMS.UI.MVC.Models;
using System.Net.Mail;
using System.Net;
using System;

namespace TrinityLMS.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

       
        [HttpGet]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
           
            return View();
        }  
        
        [HttpPost]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (ModelState.IsValid)
            {
                string body = $"{cvm.Name} has sent you the following message from TrinityLMS: <br />" +
                    $"{cvm.Message} <strong>from the email address:</strong> {cvm.Email}";

                MailMessage m = new MailMessage("postmaster@devinsprecker.com", "DSprecker@outlook.com", cvm.Subject, body);

                m.IsBodyHtml = true;

                m.Priority = MailPriority.High;

                m.ReplyToList.Add(cvm.Email);

                SmtpClient client = new SmtpClient("mail.devinsprecker.com");

                client.Credentials = new NetworkCredential("d2001dsprecker-001", "Jesusroseday#3");

                try
                {
                    client.Send(m);
                }
                catch (Exception e)
                {
                    ViewBag.Message = e.StackTrace;
                }
                return View("EmailConfirmation");
            }
            return View(cvm);
        }
        
    }
}
