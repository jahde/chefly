$(document).ready(function(){

  $('#dish-dish .thumbnail').on('click', ".test-recipe-ingredient", function(something) {
    var recipe_id = something.target["title"];
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
    var apiKey = "dvx8W4XdSOxw9en1G8benXRZ8n3rGrMH";
    var recipeID = iD;
    var url = "http://api.bigoven.com/recipe/" + recipeID + "?api_key="+apiKey;
    $.ajax({
     type: "GET",
     dataType: 'json',
     cache: false,
     url: url,
     success: function(data) {
      var instructions = data["Instructions"];
      var ingredients = data["Ingredients"];
              $('#test-instructions').html("<p>"+instructions+"</p>");
              var list = [];
              ingredients.forEach(function(object){
                list.push(object["Name"]);
              })
              $('#test-ingredients').html("<p>"+list.join(", ")+"</p>");
            }
          });
  }

});
