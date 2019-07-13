using JacksMarvel.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;


namespace JacksMarvel.Helpers
{
    public class MarvelFacade
    {
        private const string PrivateKey = "dbc45e6cd835ab628d6e1f59be09803631c56fdc";
        private const string PublicKey = "ee0d40a46231d094842f812da8558c91";
        private const int MaxCharacters = 1500;

        public static async Task<CharacterDataWrapper> GetCharacterList()
        {
            // Assemble the URL
            Random random = new Random();
            var offset = random.Next(MaxCharacters);

            // Get the MD5 Hash
            var timeStamp = DateTime.Now.Ticks.ToString();
            var hash = CreateHash(timeStamp);

            string url = String.Format("http://gateway.marvel.com:80/v1/public/characters?limit=10&offset={0}&apikey={1}&ts={2}&hash={3}", offset, PublicKey, timeStamp, hash);

            // Call out to Marvel
            HttpClient http = new HttpClient();
            var response = await http.GetAsync(url);
            var jsonMessage = response.Content.ReadAsStringAsync().Result;

            // Response -> string / json -> deserialize
            //Deserializing the response recieved from web api and storing into the Comic list  
            var comicCharacter = Newtonsoft.Json.JsonConvert.DeserializeObject<CharacterDataWrapper>(jsonMessage);
            
            return comicCharacter;
        }
        
        private static string CreateHash(string timeStamp)
        {

            var toBeHashed = timeStamp + PrivateKey + PublicKey;
            var hashedMessage = ComputeMD5(toBeHashed);
            return hashedMessage;
        }

        // From:
        // https://stackoverflow.com/questions/11454004/calculate-a-md5-hash-from-a-string
        private static string ComputeMD5(string str)
        {
            string sSourceData;
            byte[] tmpSource;
            byte[] tmpHash;
            sSourceData = str;

            //Create a byte array from source data.
            tmpSource = ASCIIEncoding.ASCII.GetBytes(sSourceData);
            tmpHash = new MD5CryptoServiceProvider().ComputeHash(tmpSource);

            string result = Convert.ToBase64String(tmpHash);

            return result;
        }

    }
}