using JacksMarvel.Helpers;
using JacksMarvel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JacksMarvel.Controllers
{
    //[Authorize]
    public class ComicHerosController : Controller
    {
        JacksMarvel_dbEntities db = new JacksMarvel_dbEntities();

        /// <summary>
        /// Navigates on AllCharacters page in which there will be option to load more characters
        /// </summary>
        /// <returns></returns>
        public ActionResult AllCharacters()
        {
            List<ComicCharacter> comicChars = SuperheroAPIHandler.GetCharacters(0, 12);

            return View("AllCharacters", comicChars);
        }

        /// <summary>
        /// Display character details on page
        /// </summary>
        /// <param name="charId"></param>
        /// <returns></returns>
        public ActionResult CharacterDetails(string charId)
        {
            return View(SuperheroAPIHandler.GetCharacterById(charId));
        }

        /// <summary>
        /// Get method which navigates on search page
        /// </summary>
        /// <returns></returns>
        public ActionResult SearchCharacters()
        {
            return View();
        }

        /// <summary>
        /// Calls the search api and bring the search results as display on page
        /// </summary>
        /// <param name="searchTerm"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SearchCharacters(string searchTerm)
        {
            ComicSearchResult searchResult = SuperheroAPIHandler.SearchCharactersByName(searchTerm);

            return View(searchResult);
        }

        /// <summary>
        /// Get method to display characters names on page in tabular format
        /// </summary>
        /// <returns></returns>
        public ActionResult CharacterNameList()
        {
            return View(db.tblAllComicCharacters);
        }

        /// <summary>
        /// Post method which gets called through jQuery ajax method to provide suggestion list for jQuery autocomplete widget
        /// </summary>
        /// <param name="queryTerm"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult GetCharacterNameList(string queryTerm)
        {
            var charNameList = (from character in db.tblAllComicCharacters
                                where character.CharacterName.Contains(queryTerm)
                                select new { character.Id, character.CharacterName });
            return Json(charNameList, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// Method which loads next set of characters on "AllCharacters" page on request
        /// </summary>
        /// <param name="offset"></param>
        /// <param name="size"></param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        public JsonResult LoadMoreCharacters(int offset, int size)
        {
            List<ComicCharacter> comicChars = SuperheroAPIHandler.GetCharacters(offset, size);
            int modelCount = SuperheroAPIHandler.TotalCharactersAvailable;
            if (comicChars.Any())
            {
                string modelString = RenderRazorViewToString("_LoadCharactersThumbnails", comicChars);
                return Json(new { ModelString = modelString, ModelCount = modelCount });
            }
            return Json(comicChars);
        }

        /// <summary>
        /// Renders Razor View To String
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

        #region Favourites Functionlity
        /// <summary>
        /// Post method which adds the passed charId into UserFavourite table thorugh jQuery ajax call
        /// </summary>
        /// <param name="charId"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult AddCharToFavourite(int charId)
        {
            try
            {
                string userName = User.Identity.Name;

                if (!db.tblUserFavouriteCharacters.Any(x => x.UserName.Equals(userName) && x.FavCharId == charId))
                {
                    db.tblUserFavouriteCharacters.Add(new tblUserFavouriteCharacter()
                    {
                        UserName = userName,
                        FavCharId = charId
                    });
                    db.SaveChanges();
                }

                return Json(new { Result = true });
            }
            catch (Exception)
            {
                return Json(new { Result = false });
            }
        }

        /// <summary>
        /// Post method which removes the passed charId from UserFavourite table thorugh jQuery ajax call
        /// </summary>
        /// <param name="charId"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult RemoveCharFromFavourite(int charId)
        {
            try
            {
                string userName = User.Identity.Name;

                if (db.tblUserFavouriteCharacters.Any(x => x.UserName.Equals(userName) && x.FavCharId == charId))
                {
                    db.tblUserFavouriteCharacters.Remove(db.tblUserFavouriteCharacters.Where(x => x.UserName.Equals(userName) && x.FavCharId == charId).First());
                    db.SaveChanges();
                }
                return Json(new { Result = true });
            }
            catch (Exception)
            {
                return Json(new { Result = false });
            }
        }

        /// <summary>
        /// Post method which returns true if passed charId entry exists in UserFavourite table for current user thorugh jQuery ajax call
        /// </summary>
        /// <param name="charId"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult IsCharFavourite(int charId)
        {
            try
            {
                string userName = User.Identity.Name;

                if (db.tblUserFavouriteCharacters.Any(x => x.UserName.Equals(userName) && x.FavCharId == charId))
                {
                    return Json(new { Result = true });

                }
                return Json(new { Result = false });
            }
            catch (Exception)
            {
                return Json(new { Result = false });
            }
        }

        /// <summary>
        /// Get User Favourite Characters
        /// </summary>
        /// <returns></returns>
        public ActionResult UserFavouriteCharacters()
        {
            List<ComicCharacter> myFavChars = new List<ComicCharacter>();

            List<int> myFavCharDBEntries = db.tblUserFavouriteCharacters.Where(x => x.UserName.Equals(User.Identity.Name)).Select(x => x.FavCharId).ToList();

            foreach (var charId in myFavCharDBEntries)
            {
                ComicCharacter comicChar = SuperheroAPIHandler.GetCharacterById(charId.ToString());
                if (comicChar != null)
                {
                    myFavChars.Add(comicChar);
                }
            }
            ViewData["FromUserFavouriteCharacters"] = true;
            return View(myFavChars);
        }

        /// <summary>
        /// Remove From Favourite
        /// </summary>
        /// <param name="charId"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult RemoveFromFavourite(string charId)
        {
            try
            {
                string userName = User.Identity.Name;

                if (db.tblUserFavouriteCharacters.Any(x => x.UserName.Equals(userName) && x.FavCharId.ToString() == charId))
                {
                    db.tblUserFavouriteCharacters.Remove(db.tblUserFavouriteCharacters.Where(x => x.UserName.Equals(userName) && x.FavCharId.ToString() == charId).First());
                    db.SaveChanges();
                }
                List<ComicCharacter> myFavChars = new List<ComicCharacter>();

                List<int> myFavCharDBEntries = db.tblUserFavouriteCharacters.Where(x => x.UserName.Equals(User.Identity.Name)).Select(x => x.FavCharId).ToList();

                foreach (var item in myFavCharDBEntries)
                {
                    ComicCharacter comicChar = SuperheroAPIHandler.GetCharacterById(item.ToString());
                    if (comicChar != null)
                    {
                        myFavChars.Add(comicChar);
                    }
                }
                ViewData["FromUserFavouriteCharacters"] = true;
                return View("UserFavouriteCharacters", myFavChars);
            }
            catch (Exception)
            {
                return Json(new { Result = false });
            }
        } 
        #endregion
    }
}