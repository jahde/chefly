$(document).ready(function(){


  $('.award').on('click', ".test-recipe-ingredient", function(something) {
    var txt = $(something.target).text();
    var recipe_id;
    var youtube_recipe;

    if($(something.target).is("h4")){
      recipe_id = something.target.title;
      youtube_recipe = "youtube-"+recipe_id;
      $(something.target.parentNode.parentNode.parentNode.parentNode.parentNode.firstElementChild.children[1].children[0]).addClass(youtube_recipe)
    } else if($(something.target).is("button")) {
      recipe_id = something.target.id;
      youtube_recipe = "youtube-"+recipe_id;
      $(something.target.parentNode.parentNode.parentNode.parentNode.firstElementChild.children[1].firstElementChild).addClass(youtube_recipe)
    }

    ajaxCall(txt, youtube_recipe);
  });

  // user hits enter while on the input field
  $('#text-field').keypress(function(e){
    if(e.which == 13){
      e.preventDefault();
      e.stopPropagation();
      ajaxCall();
    }
  });

  function ajaxCall(recipe_name, recipe_num) {
    var input = recipe_name
    var num = recipe_num
    $.ajax({
      type: "GET",
      url: "/recipes",
      data: {search_keyword: input, recipe_num: num}
    })
  }

});
