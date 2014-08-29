$(document).on("page:change", function() {
  // console.log('AJAX!');

    // var ajaxCall = function() {
    //   $.ajax({
    //     url: '/users/new',
    //     type: 'GET'
    //   }).success(function(data) {
    //     // debugger

    //   })
    // }

    // $('form').on('submit', appendStuff())

    // function appendStuff(){
    //   // debugger
    //   var username = $('#user_name').val()
    //   var userage = $('#user_name').val()
    //   $('.users').append("<li>"+ username +"</li>")
    // }

  $('.new_user').on('ajax:success', function(e, data, status, xhr) {
    // console.log(user[name]);
    $('.users').append(data.name);
    console.log(data);
    // console.log(xhr);
    // console.log(status);
    // console.log(e);
  })
})
