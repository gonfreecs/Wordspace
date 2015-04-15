// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require twitter/bootstrap
//= require turbolinks
//= require redactor-rails
//= require redactor-rails/plugins
//= require_tree .
<<<<<<< HEAD
//= require awesome-share-buttons
=======
function sbarp() {
    if($(document).width() > 990) {
      $('#search-container').css({top: 97});
      $('#search-container div').width("72.5%");
      $('#search').removeClass('hidden');
    } else if($(document).width() > 767) {
      $('#search-container').css({top: 150});
      $('#search-container div').width("72.5%");
      $('#search').removeClass('hidden');
    } else {
      $('#search-container').css({top: 50});
      $('#search-container div').width("90%");
      makevisible();
      $('#search').addClass('hidden');
    }
}
function makehidden() {
  $('#search-container').css({opacity: 1}).animate({opacity: 0}, 20);
  $('#search-container').toggle(200);
}
function makevisible() {
  $('#search-container').css({display: 'block'});
  $('#search-container').css({opacity: 0}).animate({opacity: 1}, 20);
  $('#searchbox').focus();
}
$( document ).ready(function() {
  sbarp();
  $(window).resize(function(){sbarp();});
});
$( document ).ready(function() {
  $('#search').on('click', function() {
    makevisible();
  });
});
$( document ).ready(function() {
  $('#searchbox').focusout(function() {
    if($(document).width() > 767) {
      makehidden();
    }
  });
});
>>>>>>> 7e82538ecad07b868cf6a42bca170df9527169a3
