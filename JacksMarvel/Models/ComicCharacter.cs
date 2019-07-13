using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JacksMarvel.Models
{
    // Type created for JSON at <<root>>
    [Newtonsoft.Json.JsonObjectAttribute(MemberSerialization = Newtonsoft.Json.MemberSerialization.OptIn)]
    public partial class ComicSearchResult
    {
        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string response;

        [Newtonsoft.Json.JsonPropertyAttribute(PropertyName = "results-for")]
        public string results_for;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public ComicCharacter[] results;
    }

    // Type created for JSON at <<root>>
    [Newtonsoft.Json.JsonObjectAttribute(MemberSerialization = Newtonsoft.Json.MemberSerialization.OptIn)]
    public partial class ComicCharacter
    {

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string response;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string id;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string name;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public Powerstats powerstats;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public Biography biography;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public Appearance appearance;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public Work work;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public Connections connections;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public Image image;
    }

    // Type created for JSON at <<root>> --> powerstats
    [Newtonsoft.Json.JsonObjectAttribute(MemberSerialization = Newtonsoft.Json.MemberSerialization.OptIn)]
    public partial class Powerstats
    {

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string intelligence;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string strength;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string speed;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string durability;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string power;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string combat;
    }

    // Type created for JSON at <<root>> --> biography
    [Newtonsoft.Json.JsonObjectAttribute(MemberSerialization = Newtonsoft.Json.MemberSerialization.OptIn)]
    public partial class Biography
    {

        [Newtonsoft.Json.JsonPropertyAttribute(PropertyName = "full-name")]
        public string full_name;

        [Newtonsoft.Json.JsonPropertyAttribute(PropertyName = "alter-egos")]
        public string alter_egos;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string[] aliases;

        [Newtonsoft.Json.JsonPropertyAttribute(PropertyName = "place-of-birth")]
        public string place_of_birth;

        [Newtonsoft.Json.JsonPropertyAttribute(PropertyName = "first-appearance")]
        public string first_appearance;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string publisher;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string alignment;
    }

    // Type created for JSON at <<root>> --> appearance
    [Newtonsoft.Json.JsonObjectAttribute(MemberSerialization = Newtonsoft.Json.MemberSerialization.OptIn)]
    public partial class Appearance
    {

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string gender;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string race;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string[] height;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string[] weight;

        [Newtonsoft.Json.JsonPropertyAttribute(PropertyName = "eye-color")]
        public string eye_color;

        [Newtonsoft.Json.JsonPropertyAttribute(PropertyName = "hair-color")]
        public string hair_color;
    }

    // Type created for JSON at <<root>> --> work
    [Newtonsoft.Json.JsonObjectAttribute(MemberSerialization = Newtonsoft.Json.MemberSerialization.OptIn)]
    public partial class Work
    {

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string occupation;

        [Newtonsoft.Json.JsonPropertyAttribute(PropertyName = "base")]
        public string _base;
    }

    // Type created for JSON at <<root>> --> connections
    [Newtonsoft.Json.JsonObjectAttribute(MemberSerialization = Newtonsoft.Json.MemberSerialization.OptIn)]
    public partial class Connections
    {

        [Newtonsoft.Json.JsonPropertyAttribute(PropertyName = "group-affiliation")]
        public string group_affiliation;

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string relatives;
    }

    // Type created for JSON at <<root>> --> image
    [Newtonsoft.Json.JsonObjectAttribute(MemberSerialization = Newtonsoft.Json.MemberSerialization.OptIn)]
    public partial class Image
    {

        [Newtonsoft.Json.JsonPropertyAttribute()]
        public string url;
    }

}