using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TrinityLMS.UI.MVC.Startup))]
namespace TrinityLMS.UI.MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
