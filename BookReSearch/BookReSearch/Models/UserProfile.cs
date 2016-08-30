using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.Security;

namespace BookReSearch.Models
{
    public class UserProfile : ProfileBase
    {
        public static UserProfile GetUserProfile(string username)
        {
            return Create(username) as UserProfile;
        }

        public static UserProfile GetUserProfile()
        {           
            return Create(Membership.GetUser().UserName) as UserProfile;
        }

        public static List<UserProfile> GetAllProfiles()
        {
            var users = Membership.GetAllUsers().OfType<MembershipUser>().ToList();
            return users.Select(x => Create(x.UserName) as UserProfile).ToList();
        }

        [SettingsAllowAnonymous(false)]
        public string FirstName
        {
            get { return base["FirstName"] as string; }
            set { base["FirstName"] = value; }
        }

        [SettingsAllowAnonymous(false)]
        public string LastName
        {
            get { return base["LastName"] as string; }
            set { base["LastName"] = value; }
        }

        [SettingsAllowAnonymous(false)]
        public string Phone
        {
            get { return base["Phone"] as string; }
            set { base["Phone"] = value; }
        }

        [SettingsAllowAnonymous(false)]
        public string FavoriteTopic
        {
            get { return base["FavoriteTopic"] as string; }
            set { base["FavoriteTopic"] = value; }
        }
    }
}