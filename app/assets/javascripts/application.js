// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
window.fbAsyncInit = function() {
   FB.init({
     appId  : '[#insert_app_id_here]',
     status : true, // check login status
     cookie : true, // enable cookies to allow the server to access the session
     xfbml  : true  // parse XFBML
   });
 };

 (function(d) {
   var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
   js = d.createElement('script'); js.id = id; js.async = true;
   js.src = "//connect.facebook.net/en_US/all.js";
   d.getElementsByTagName('head')[0].appendChild(js);
 }(document));

 $(function() {
   $('#connect .signin').click(function(e) {
     e.preventDefault();

     FB.login(function(response) {
       if (response.authResponse) {
         $('#results').html('Connected! Hitting OmniAuth callback (GET users/auth/facebook/callback)...');

         // since we have cookies enabled, this request will allow omniauth to parse
         // out the auth code from the signed request in the fbsr_XXX cookie
         $.getJSON('users/auth/facebook/callback', function(json) {
           $('#results').html(JSON.stringify(json));
           // Do some other stuff here (call more json, load in more elements, etc)
         });
       }
     }, { scope: 'email,read_stream' }); // These are the permissions you are requesting
   });

   $('#connect .signout').click(function(e) {
     e.preventDefault();
     $.getJSON('/auth/facebook/signout', function(json) {
       $('#results').html(JSON.stringify(json));
     });
   });

 });
