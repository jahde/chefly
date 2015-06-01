$(document).ready(function(){

  $('.fav-page').on('click', '.test-recipe-ingredient-fav', function(something) {
    debugger;
    var recipe_id = $(something.target.children[0]).text();

    if($(something.target).is("h4")){
      $(something.target.parentNode.parentNode.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild).click();
    } else if($(something.target).is("button")) {
      $(something.target.parentNode.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild).click();
    }

    // clicking button
  });

  // user hits enter while on the input field
  $('#text-field').keypress(function(e){
    if(e.which == 13){
      e.preventDefault();
      e.stopPropagation();
      ajaxCall();
    }
  });

  // function fetchRecipeJson(iD) {
  //   var apiKey = "dvxW73xq8iT64kItLgiQfPb2Fo356753";
  //   var url = "http://api.bigoven.com/recipe/" + iD + "?api_key="+apiKey;
  //   debugger;
  //   $.ajax({
  //    type: "GET",
  //    dataType: 'json',
  //    cache: false,
  //    url: url,
  //    success: function(data) {
  //     debugger;
  //     var recipe_class = data["RecipeID"]
  //     var instructions = data["Instructions"];
  //     var ingredients = data["Ingredients"];
  //             // $(recipe_class).html("<p>"+instructions+"</p>");
  //             var list = [];
  //             ingredients.forEach(function(object){
  //               list.push(object["Name"]);
  //             })

  //             $("div."+recipe_class).html("<p>"+instructions+"\n\n"+list.join(", ")+"</p>");
  //             $("a."+recipe_class).click();
  //           }
  //         });
  // }

});
