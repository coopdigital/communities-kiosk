// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require_tree .

$(document).ready(function(){
  $('.response').hide();
  $('#card_number').focus();

  function resetScreen(){
    setTimeout(function(){
      $('#card_number').val('');
      $('#ad').show();
      $('.response').hide();
      $('#card_number').focus();
    }, 5000);
  }

  $('#card-form').submit(function(event){
    event.preventDefault();

    $.ajax({
      url: $(this).attr('action'),
      method: 'POST',
      data: $(this).serialize(),
      success: function(data, textStatus, jqXHR){
        $('#ad').hide();
        $('#thanks').show();
        resetScreen();
      },
      error: function(jqXHR, textStatus, errorThrown){
        $('#ad').hide();
        $('#error').show();
        resetScreen();
      }
    })
  });

  if($('table#numbers').length > 0){
    var numbers = JSON.parse(window.localStorage.getItem('card-numbers') || '[]');
    $.each(numbers, function(index, object){
      $('table#numbers').append('<tr><td>'+object.number+'</td><td>'+object.time+'</td></tr>')
    });
  }

});

