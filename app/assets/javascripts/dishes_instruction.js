$(document).ready(function(){

  $('.award').on('click', '.test-recipe-ingredient', function(something) {
    var recipe_id = something.target["title"];
    // add for recipe button
    $(something.target.parentNode.parentNode.parentNode.parentNode.parentNode.firstElementChild.children[1].children[1]).addClass(recipe_id)

    // add for modal button
    $(something.target.parentNode.parentNode.parentNode.parentNode.parentNode.firstElementChild.children[0].children[0]).addClass(recipe_id)
    fetchRecipeJson(recipe_id);
  });

  // user hits enter while on the input field
  $('#text-field').keypress(function(e){
    if(e.which == 13){
      e.preventDefault();
      e.stopPropagation();
      ajaxCall();
    }
  });

  function fetchRecipeJson(iD) {
    var apiKey = "dvxW73xq8iT64kItLgiQfPb2Fo356753";
    var url = "http://api.bigoven.com/recipe/" + iD + "?api_key="+apiKey;
    $.ajax({
     type: "GET",
     dataType: 'json',
     cache: false,
     url: url,
     success: function(data) {
      var recipe_class = data["RecipeID"]
      var instructions = data["Instructions"];
      var ingredients = data["Ingredients"];
              // $(recipe_class).html("<p>"+instructions+"</p>");
              var list = [];
              ingredients.forEach(function(object){
                list.push(object["Name"]);
              })

              $("div."+recipe_class).html("<p>"+instructions+"\n\n"+list.join(", ")+"</p>");
              $("a."+recipe_class).click();
            }
          });
  }

});
