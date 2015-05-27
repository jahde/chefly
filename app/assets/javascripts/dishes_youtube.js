$(document).ready(function(){


  $('.thumbnail').click(function(something) {
    var txt = $(something.target).text();
    debugger;
    

  });

  // user hits enter while on the input field
  $('#text-field').keypress(function(e){
    if(e.which == 13){
      e.preventDefault();
      e.stopPropagation();
      ajaxCall();
    }
  });

  function ajaxCall() {
    var input = $("#text-field").val()
    // your code will go here
    $.ajax({
  type: "GET",
  url: "/widget",
  data: {search_keyword: input}
})
  .done(function(messageFromController) {
    $("#search-results").html(messageFromController);
  });
  }

});