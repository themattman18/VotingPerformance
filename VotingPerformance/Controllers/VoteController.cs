using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReviewableVoting.Controllers
{
    public class VoteController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}