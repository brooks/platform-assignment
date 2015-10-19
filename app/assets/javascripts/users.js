$(document).ready(function(){
  delegateUserClickEvents()
  initiateAjaxSearch()
});

var delegateUserClickEvents = function() {
  $('table').on('click', 'tr.clickable', function(e){
    e.preventDefault()
    var userID = $(this).attr('user-id')
    $.ajax({
      method: 'GET',
      url: 'users/'+ userID
    }).success(function(data) {
      $.each(data, function(key, value){
        $('#' + key).html(value)
      })
    });     
  })  
};

var initiateAjaxSearch = function() {
  $("input").bind("change paste keyup", function() { 
    var query = $(this).val()
    $.ajax({
      method: "POST",
      url: 'users/search',
      data: { query: query }
    }).success(function(data) {
      $('table').html(
        $.map(data, function( val, i ) { 
          return '<tr class=clickable user-id=' + val.id + '><td><a>' + val.name + '</a></td></tr>' 
        }).join('')
      )
    });
  });  
};