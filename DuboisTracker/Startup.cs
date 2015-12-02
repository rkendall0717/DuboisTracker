using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DuboisTracker.Startup))]
namespace DuboisTracker
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
