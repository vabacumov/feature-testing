$(document).on("page:change" ,function() {

 var htmlTags = {
  greeter : $('.greeter'),
  body : $('body')
 }

  var hello = function(){
    htmlTags.greeter.html("Hello! Welcome to Asset Pipeline");
  }

  hello();
})
