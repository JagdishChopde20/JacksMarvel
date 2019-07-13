// Initialize Facebook Javascript SDK
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
              if (d.getElementById(id)) return;
              js = d.createElement(s); js.id = id;
              js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.2&appId=524693381355236&autoLogAppEvents=1';
              fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.
function checkLoginState() {
    FB.getLoginStatus(function (response) {
        LoginCallback(response);
    });
}

function LoginCallback(response) {
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
        // Logged into your app and Facebook.
        // Here we run a very simple test of the Graph API after login is successful.  See statusChangeCallback() for when this call is made.
        FB.api('/me', 'GET', { fields: 'name,first_name,email,last_name,gender,locale,link,id,picture.width(100).height(100)' }, function (response) {
            console.log('Facebook loggedin user data: ' + response.name + ' || ' + response.first_name + ' ' + response.last_name + ' | ' + response.email + ' | ' + response.picture.data.url + '');
            // Redirect to success page
            LoginRedirection(response.name, response.email);
        });

        FB.logout(function (response) {
            // user is now logged out
        });
    } else {
        // The person is not logged into your app or we are unable to tell.
        console.log("Login with Facebook failed.");
    }
}
