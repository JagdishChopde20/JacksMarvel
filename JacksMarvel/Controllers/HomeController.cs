using JacksMarvel.Helpers;
using JacksMarvel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace JacksMarvel.Controllers
{
    public class HomeController : Controller
    {
        JacksMarvel_dbEntities db = new JacksMarvel_dbEntities();

        /// <summary>
        /// Get of Home page
        /// </summary>
        /// <returns></returns>
        [OutputCache(Duration = 10)]
        public ActionResult Index()
        {
            List<ComicCharacter> comicChars = new List<ComicCharacter>();

            foreach (var item in SuperheroAPIHandler.FavouriteCharacters.Take(4))
            {
                var character = SuperheroAPIHandler.GetCharacterById(item.ToString());
                if (character != null)
                {
                    comicChars.Add(character);
                }
            }
            return View(comicChars);

        }

        /// <summary>
        /// Get next set of favourite characters for carousel 
        /// </summary>
        /// <param name="offset"></param>
        /// <param name="size"></param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        public JsonResult LoadNextRandomCharactersToCarousel(int offset, int size)
        {
            List<ComicCharacter> comicChars = new List<ComicCharacter>();
            Random rnd = new Random();
            int[] generatedRandomCharIds = SuperheroAPIHandler.FavouriteCharacters.Skip(offset).Take(size).ToArray();
            foreach (var ComicChar in generatedRandomCharIds)
            {
                ComicCharacter comicChar = SuperheroAPIHandler.GetCharacterById(ComicChar.ToString());
                if (comicChar != null)
                {
                    comicChars.Add(comicChar);
                }
            }
            if (comicChars.Any())
            {
                string modelString = RenderRazorViewToString("_CarouselRandomChars", comicChars);
                return Json(new { ModelString = modelString, ModelCount = SuperheroAPIHandler.FavouriteCharacters.Count() });
            }
            return Json(comicChars);
        }

        /// <summary>
        /// Load more favourite characters
        /// </summary>
        /// <param name="offset"></param>
        /// <param name="size"></param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        public JsonResult LoadMoreFavouriteCharacters(int offset, int size)
        {
            List<ComicCharacter> comicChars = SuperheroAPIHandler.GetFavouriteCharacters(offset, size);
            int modelCount = SuperheroAPIHandler.FavouriteCharacters.Count();
            if (comicChars.Any())
            {
                string modelString = RenderRazorViewToString("_LoadCharactersThumbnails", comicChars);
                return Json(new { ModelString = modelString, ModelCount = modelCount });
            }
            return Json(comicChars);
        }

        /// <summary>
        /// Render razor view to string
        /// </summary>
        /// <param name="viewName"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [NonAction]
        public string RenderRazorViewToString(string viewName, object model)
        {
            ViewData.Model = model;
            using (var sw = new System.IO.StringWriter())
            {
                var viewResult = ViewEngines.Engines.FindPartialView(ControllerContext, viewName);
                var viewContext = new ViewContext(ControllerContext, viewResult.View, ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);
                viewResult.ViewEngine.ReleaseView(ControllerContext, viewResult.View);
                return sw.GetStringBuilder().ToString();
            }
        }

        /// <summary>
        /// Get About page
        /// </summary>
        /// <returns></returns>
        public ActionResult About()
        {
            return View();
        }

        /// <summary>
        /// Get Contact/Feedback page
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Contact(object id)
        {
            if (User.Identity.Name != "")
            {
                tblUser tblUser = db.tblUsers.Where(x => x.Username.Equals(User.Identity.Name)).First();
                if (tblUser != null)
                {
                    tblFeedbackEntry tblFeedbackEntry = new tblFeedbackEntry() { Username = tblUser.Username, EmailAddress = tblUser.EmailAddress };
                    return View(tblFeedbackEntry);
                }
            }
            return View();
        }

        /// <summary>
        /// POST: Contact/Feedback entry to DB
        /// </summary>
        /// <param name="tblFeedbackEntry"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Contact(tblFeedbackEntry tblFeedbackEntry)
        {
            if (ModelState.IsValid)
            {
                tblFeedbackEntry.DateTime = DateTime.Now;

                db.tblFeedbackEntries.Add(tblFeedbackEntry);
                db.SaveChanges();

                TempData["FeedbackEntrySuccessful"] = true;
                return RedirectToAction("Index");
            }

            return View(tblFeedbackEntry);
        }
    }
}