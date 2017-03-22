// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$('form').submit(function(e) {
  var getData = $(this).serialize(); //grabs data from form input
  var formURL = $(this).attr('action');
  $.ajax({
    url: formURL,
    type: 'GET',
    data: getData,
    success: function(data, textStatus, jqXHR){
      $('SearchForm').append(data); //this is the JS that gets triggered in response to a successful return. Data is what was returned.
    },
    error: function(jqXHR, textStatus, errorThrown){}
  });
  e.preventDefault();
  });
});

$(document).submit();
