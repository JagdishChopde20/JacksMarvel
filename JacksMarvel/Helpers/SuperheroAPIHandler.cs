using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using JacksMarvel.Models;

namespace JacksMarvel.Helpers
{
    public class SuperheroAPIHandler
    {
        //Hosted web API REST Service base url  
        static readonly string Baseurl = "https://superheroapi.com/api.php/2136183849776272/";
        static readonly string DefaultThumbnailUrl = "https://www.superherodb.com/pictures2/portraits/10/100/10431.jpg";
        public static readonly int TotalCharactersAvailable = 731;
        public static readonly int[] FavouriteCharacters = new int[] { 644, 70, 720, 414, 659, 620, 717, 99, 322, 63, 655, 107, 687, 97, 95, 265, 310, 309, 345, 381, 524, 505, 630, 346, 213 };

        private static List<ComicCharacter> DownloadedComicCharacters = new List<ComicCharacter>();

        /// <summary>
        /// Get Comic Character by Id
        /// </summary>
        /// <param name="charId"></param>
        /// <returns></returns>
        public static ComicCharacter GetCharacterById(string charId)
        {
            ComicCharacter comicCharacter = new ComicCharacter();
            try
            {
                // Check if the requested character is already downloaded
                if (DownloadedComicCharacters != null && DownloadedComicCharacters.Any(x => x.id.Equals(charId)))
                {
                    comicCharacter = DownloadedComicCharacters.Where(x => x.id.Equals(charId)).First();
                    return comicCharacter;
                }

                // If not already downloaded then download and return a copy
                using (var client = new System.Net.Http.HttpClient())
                {
                    //Passing service base url  
                    client.BaseAddress = new Uri(Baseurl);

                    client.DefaultRequestHeaders.Clear();
                    //Define request data format  
                    client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

                    //Sending request to find web api REST service resource GetAllEmployees using HttpClient  
                    System.Net.Http.HttpResponseMessage Res = client.GetAsync(charId).Result;

                    //Checking the response is successful or not which is sent using HttpClient  
                    if (Res.IsSuccessStatusCode)
                    {
                        //Storing the response details recieved from web api   
                        var ComicCharacterResponse = Res.Content.ReadAsStringAsync().Result;

                        //Deserializing the response recieved from web api and storing into the Employee list  
                        comicCharacter = Newtonsoft.Json.JsonConvert.DeserializeObject<ComicCharacter>(ComicCharacterResponse);

                        // Check if the character images is available, if not then replace it with default image
                        if (comicCharacter != null && comicCharacter.image != null && !IsFileExistOnRemoteServer(comicCharacter.image.url))
                        {
                            comicCharacter.image.url = DefaultThumbnailUrl;
                        }

                        // Add the downloaded character in downloaded list
                        if (comicCharacter.id != null)
                        {
                            DownloadedComicCharacters.Add(comicCharacter);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error calling API: " + ex.Message);
            }
            //returning the result
            return comicCharacter;
        }


        public static ComicSearchResult SearchCharactersByName(string charName)
        {
            ComicSearchResult searchResult = new ComicSearchResult();

            // If not already downloaded then download and return a copy
            using (var client = new System.Net.Http.HttpClient())
            {
                //Passing service base url  
                client.BaseAddress = new Uri(Baseurl);

                client.DefaultRequestHeaders.Clear();
                //Define request data format  
                client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

                //Sending request to find web api REST service resource GetAllEmployees using HttpClient  
                System.Net.Http.HttpResponseMessage Res = client.GetAsync("search/" + charName).Result;

                //Checking the response is successful or not which is sent using HttpClient  
                if (Res.IsSuccessStatusCode)
                {
                    //Storing the response details recieved from web api   
                    var ComicCharacterSearchResponse = Res.Content.ReadAsStringAsync().Result;

                    //Deserializing the response recieved from web api and storing into the Employee list  
                    searchResult = Newtonsoft.Json.JsonConvert.DeserializeObject<ComicSearchResult>(ComicCharacterSearchResponse);

                    if (searchResult.results != null && searchResult.results.Count() > 0)
                    {
                        foreach (var comicCharacter in searchResult.results)
                        {
                            // Check if the character image is available, if not then replace it with default image
                            if (comicCharacter != null && comicCharacter.image != null && !IsFileExistOnRemoteServer(comicCharacter.image.url))
                            {
                                comicCharacter.image.url = DefaultThumbnailUrl;
                            }

                            // Check if the requested character is already downloaded
                            if (!DownloadedComicCharacters.Any(x => x.id.Equals(comicCharacter.id)))
                            {
                                // Add the downloaded character in downloaded list
                                DownloadedComicCharacters.Add(comicCharacter);
                            }
                        }
                    }
                }
                //returning the result
                return searchResult;
            }
        }

        /// <summary>
        /// Get Comic Characters 
        /// </summary>
        /// <param name="offset"></param>
        /// <param name="size"></param>
        /// <returns></returns>
        public static List<ComicCharacter> GetCharacters(int offset, int size)
        {
            List<ComicCharacter> comicChars = new List<ComicCharacter>();
            int charsFetchLimit = (offset + size) > TotalCharactersAvailable ? (TotalCharactersAvailable) : (offset + size);

            for (int i = (offset + 1); i <= charsFetchLimit; i++)
            {
                var character = GetCharacterById(i.ToString());
                if (character != null)
                {
                    comicChars.Add(character);
                }
            }
            return comicChars;
        }

        /// <summary>
        /// Get Favourite Comic Characters 
        /// </summary>
        /// <param name="offset"></param>
        /// <param name="size"></param>
        /// <returns></returns>
        public static List<ComicCharacter> GetFavouriteCharacters(int offset, int size)
        {
            int TotalFavouriteCharactersAvailable = FavouriteCharacters.Count() - 1;
            List<ComicCharacter> comicChars = new List<ComicCharacter>();
            int charsFetchLimit = (offset + size) > TotalFavouriteCharactersAvailable ? (TotalFavouriteCharactersAvailable) : (offset + size);

            for (int i = (offset + 1); i <= charsFetchLimit; i++)
            {
                var character = GetCharacterById(FavouriteCharacters[i].ToString());
                if (character != null)
                {
                    comicChars.Add(character);
                }
            }
            return comicChars;
        }

        public static bool IsFileExistOnRemoteServer(string imgUrl)
        {
            HttpWebRequest httpReq = (HttpWebRequest)WebRequest.Create(imgUrl);
            HttpWebResponse httpRes = null;
            try
            {
                httpRes = (HttpWebResponse)httpReq.GetResponse();
                if (httpRes.StatusCode == HttpStatusCode.OK)
                {
                    return true;
                }
                else if (httpRes.StatusCode == HttpStatusCode.NotFound) // Error 404 right here,
                {
                    return false;
                }
            }
            catch (WebException wec)
            {
                if (wec.Status == WebExceptionStatus.ProtocolError) // Error 404 right here,
                {
                    return false;
                    //Console.WriteLine(string.Format("Status Code : {0}", ((HttpWebResponse)wec.Response).StatusCode));
                    //Console.WriteLine(string.Format("Status Description : {0}", ((HttpWebResponse)wec.Response).StatusDescription));
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
            return false;
        }
    }
}