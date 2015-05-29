$(document).ready(function(){


  // $('.thumbnail').click(function(something) {
  //   debugger;
  //   var txt = $(something.target).text();
  //   ajaxCall(txt);
  // });

  // user hits enter while on the input field
  $('#text-field').keypress(function(e){
    if(e.which == 13){
      e.preventDefault();
      e.stopPropagation();
      ajaxCall();
    }
  });

  function ajaxCall(recipe_name) {
    var input = recipe_name
    $.ajax({
      type: "GET",
      url: "/recipes",
      data: {search_keyword: input}
    })
  }

});
