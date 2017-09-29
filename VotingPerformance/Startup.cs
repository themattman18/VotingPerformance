using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VotingPerformance.Startup))]
namespace VotingPerformance
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
