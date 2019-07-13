using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace JacksMarvel.Models
{
    #region Validations For tblUser
    [MetadataType(typeof(TblUserMetadata))]
    public partial class tblUser
    {
        public bool IsRememberMe { get; set; }
        public string ConfirmPassword { get; set; }
    }

    public class TblUserMetadata
    {
        [Required]
        [StringLength(15)]
        [System.Web.Mvc.Remote("IsUserNameAvailable", "Users", ErrorMessage = "Username is not available", AdditionalFields = "UseRemoteAttribute")]
        public string Username { get; set; }

        [Display(Name = "Email Address")]
        [Required]
        [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$", ErrorMessage = "Invalid Email Address")]
        public string EmailAddress { get; set; }

        [Required]
        public string Password { get; set; }

        [Display(Name = "Account Creation Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public DateTime? AccountCreationDate { get; set; }

        [Display(Name = "Remember me")]
        public bool IsRememberMe { get; set; }

        [Display(Name = "Confirm Password")]
        [Compare("Password")]
        public string ConfirmPassword { get; set; }

        [Display(Name = "Last Login Date & Time")]
        public Nullable<System.DateTime> LastLoginDateTime { get; set; }

        [Display(Name = "Total Logins")]
        public Nullable<int> LoginCount { get; set; }
    }
    #endregion

    #region Validations for tblAllComicCharacter
    [MetadataType(typeof(TblAllComicCharacterMetadata))]
    public partial class tblAllComicCharacter
    {
    }

    public class TblAllComicCharacterMetadata
    {
        [Display(Name = "#ID")]
        public int Id { get; set; }

        [Display(Name = "Character Name")]
        public string CharacterName { get; set; }
    }
    #endregion

    #region Validations for tblFeedbackEntry
    [MetadataType(typeof(TblFeedbackEntryMetadata))]
    public partial class tblFeedbackEntry
    {
    }

    public class TblFeedbackEntryMetadata
    {
        [Required]
        [StringLength(25)]
        public string Username { get; set; }

        [Display(Name = "Email Address")]
        [Required]
        [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$", ErrorMessage = "Invalid Email Address")]
        public string EmailAddress { get; set; }

        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Not a valid phone number")]
        public string Mobile { get; set; }

        [Required]
        public string Reason { get; set; }

        [Required]
        [MinLength(20)]
        [MaxLength(50)]
        public string Title { get; set; }

        [Required]
        [MinLength(50)]
        [MaxLength(500)]
        public string Detail { get; set; }
    } 
    #endregion
}