using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using JacksMarvel.Models;

namespace JacksMarvel.Controllers
{
    [Authorize]
    public class UsersController : Controller
    {
        private JacksMarvel_dbEntities db = new JacksMarvel_dbEntities();

        /// <summary>
        /// GET: Login
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            if (User.Identity.Name != "")
            {
                return RedirectToAction("AllCharacters", "ComicHeros");
            }
            else
            {
                ViewBag.ReturnUrl = returnUrl;
                TempData["ReturnUrl"] = returnUrl;
                return View();
            }
        }

        /// <summary>
        /// Login user
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login([Bind(Include = nameof(tblUser.Username) + "," + nameof(tblUser.Password) + "," + nameof(tblUser.IsRememberMe))]tblUser user, string returnUrl)
        {
            ModelState.Remove(nameof(tblUser.ConfirmPassword));
            ModelState.Remove(nameof(tblUser.EmailAddress));

            if (ModelState.IsValid)
            {
                bool isValidUser = db.tblUsers.Any(x => x.Username.Equals(user.Username) && x.Password.Equals(user.Password));
                if (isValidUser)
                {
                    // Log user in
                    FormsAuthentication.SetAuthCookie(user.Username, user.IsRememberMe);

                    // Updates Users Last Login Date to current date And Count by 1
                    UpdateUsersLastLoginDateAndCount(user.Username);

                    // Navigates user to the next page or the previously requested page
                    if (!string.IsNullOrEmpty(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("AllCharacters", "ComicHeros");
                    }
                }
                else
                {
                    ModelState.AddModelError("InvalidUser", "Username or Password is incorrect.");
                }
            }
            return View();
        }

        /// <summary>
        /// Action method for Login with Facebook
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        [AllowAnonymous]
        public ActionResult LoginWithFacebook(string userName, string emailAddress)
        {
            if (!string.IsNullOrEmpty(userName))
            {
                // If user loggin in first time using facebook
                if (!db.tblUsers.Any(x => x.Username.Equals(userName)))
                {
                    string dummyFBPassword = "_FacebookUser_@" + DateTime.Now.ToShortTimeString();
                    // Add his entry in user table
                    db.tblUsers.Add(new tblUser() { Username = userName, EmailAddress = emailAddress, AccountCreationDate = DateTime.Today, Password = dummyFBPassword, ConfirmPassword = dummyFBPassword });
                    db.SaveChanges();
                }
                // Updates Users Last Login Date to current date And Count by 1
                UpdateUsersLastLoginDateAndCount(userName);

                // Log user in
                FormsAuthentication.SetAuthCookie(userName, true);

                // Navigates user to the next page or the previously requested page
                if (TempData["ReturnUrl"] != null)
                {
                    var returnUrl = TempData["ReturnUrl"].ToString();
                    if (!string.IsNullOrEmpty(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    return RedirectToAction("AllCharacters", "ComicHeros");
                }
                else
                {
                    return RedirectToAction("AllCharacters", "ComicHeros");
                }
            }
            return RedirectToAction("Login");
        }

        /// <summary>
        /// Updates Users Last Login Date to current date And Count by 1
        /// </summary>
        /// <param name="userName"></param>
        private void UpdateUsersLastLoginDateAndCount(string userName)
        {
            try
            {
                tblUser user = db.tblUsers.Where(x => x.Username.Equals(userName)).First();
                if (user != null)
                {
                    user.LastLoginDateTime = DateTime.Now;
                    user.LoginCount = (user.LoginCount == null) ? 1 : user.LoginCount + 1;
                    user.ConfirmPassword = user.Password;

                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }

        /// <summary>
        /// Logs user out
        /// </summary>
        /// <returns></returns>
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }

        /// <summary>
        /// GET: All Users List (Only for Admin)
        /// </summary>
        /// <returns></returns>
        public ActionResult Index(string userName)
        {
            if (User.Identity.Name == "Jack")
            {
                return View(db.tblUsers.OrderByDescending(x => x.LastLoginDateTime).ToList());
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        /// <summary>
        /// // GET: Users/Details/userName
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public ActionResult Details(string userName)
        {
            if (userName == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUser tblUser = db.tblUsers.Where(x => x.Username.Equals(userName)).First();
            if (tblUser == null)
            {
                return HttpNotFound();
            }

            ViewData["MyFavCharCount"] = db.tblUserFavouriteCharacters.Where(x => x.UserName.Equals(User.Identity.Name)).Count().ToString();

            return View(tblUser);
        }

        /// <summary>
        /// GET: Users/Create
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        public ActionResult Create()
        {
            if (User.Identity.Name != "")
            {
                return RedirectToAction("AllCharacters", "ComicHeros");
            }
            else
            {
                return View();
            }
        }

        // POST: Users/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public ActionResult Create(tblUser tblUser)/*[Bind(Include = "Id,Username,Password,AccountCreationDate")] */
        {
            ModelState.Remove(nameof(tblUser.ConfirmPassword));

            if (ModelState.IsValid)
            {
                tblUser.AccountCreationDate = DateTime.Now.Date;

                db.tblUsers.Add(tblUser);
                db.SaveChanges();

                TempData["RegistrationSuccessful"] = true;
                return RedirectToAction("Login");
            }

            return View(tblUser);
        }

        /// <summary>
        /// Method to check username is available in db or not. To be used in Remote attribute on Registration page
        /// </summary>
        /// <param name="Username"></param>
        /// <returns></returns>
        [AllowAnonymous]
        public JsonResult IsUserNameAvailable(string Username, string UseRemoteAttribute)
        {
            if (!string.IsNullOrEmpty(Username) && string.IsNullOrWhiteSpace(UseRemoteAttribute))
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(!db.tblUsers.Any(x => x.Username.Equals(Username)), JsonRequestBehavior.AllowGet);
            }
        }

        // GET: Users/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUser tblUser = db.tblUsers.Find(id);
            if (tblUser == null)
            {
                return HttpNotFound();
            }
            return View(tblUser);
        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Username,Password,ConfirmPassword,EmailAddress,AccountCreationDate")] tblUser tblUser)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblUser).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Details", new { userName = User.Identity.Name });
            }
            return View(tblUser);
        }

        // GET: Users/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUser tblUser = db.tblUsers.Find(id);
            if (tblUser == null)
            {
                return HttpNotFound();
            }
            return View(tblUser);
        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id, string userPassword)
        {
            tblUser tblUser = db.tblUsers.Find(id);
            if (tblUser.Password.Equals(userPassword))
            {
                db.tblUsers.Remove(tblUser);
                db.SaveChanges();

                // Sign out user
                FormsAuthentication.SignOut();

                // Set tempdata var to show confirm dialog on next screen
                TempData["AccountDeletionSuccessful"] = true;

                // Also delete user's favourite list
                db.tblUserFavouriteCharacters.RemoveRange(db.tblUserFavouriteCharacters.Where(x => x.UserName.Equals(tblUser.Username)));
                db.SaveChanges();

                return RedirectToAction("Login");
            }
            // Set tempdata var to show passowrd wrong alert dialog back on screen
            TempData["InvalidPasswordForDeleteConfirm"] = true;
            ViewData["MyFavCharCount"] = db.tblUserFavouriteCharacters.Where(x => x.UserName.Equals(User.Identity.Name)).Count().ToString();

            return View("Details", tblUser);
        }

        // POST: Users/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteUser_AdminAction(int id)
        {
            tblUser tblUser = db.tblUsers.Find(id);
            if (tblUser != null)
            {
                db.tblUsers.Remove(tblUser);
                db.SaveChanges();

                // Also delete user's favourite list
                db.tblUserFavouriteCharacters.RemoveRange(db.tblUserFavouriteCharacters.Where(x => x.UserName.Equals(tblUser.Username)));
                db.SaveChanges();

            }
            return RedirectToAction("Index");
        }

        /// <summary>
        /// Get all the feedback entries to view - Admin
        /// </summary>
        /// <returns></returns>
        public ActionResult FeedbackEntries()
        {
            if (User.Identity.Name == "Jack")
            {
                return View(db.tblFeedbackEntries.OrderByDescending(x => x.DateTime).ToList());
            }
            else
            {
                return RedirectToAction("Login");
            }
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
