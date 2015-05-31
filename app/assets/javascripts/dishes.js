// test
$(document).ready(function(){
  function getRecipeJson() {
          var apiKey = "dvxW73xq8iT64kItLgiQfPb2Fo356753";
          var titleKeyword = $('h2 span').text().toLowerCase();
          var url = "http://api.bigoven.com/recipes?pg=1&rpp=25&any_kw="
                    + titleKeyword
                    + "&api_key="+apiKey;
          $.ajax({
              type: "GET",
              dataType: 'json',
              cache: false,
              url: url,
              success: function (data) {
                  var recipe_list = [];
                  for(var i = 0; i < 5; i++){
                    // add hidden recipe id attribute
                    var recipe_id = data.Results[i]["RecipeID"];
                    recipe_list.push(data.Results[i]["RecipeID"]);

                    $($('.award')[i]).append("<button class='test-recipe-ingredient' data-type='modal-trigger' id='"+recipe_id+"'><h4 title="+recipe_id+">"+data.Results[i]["Title"]+"</button><br>");
                    $($('.award')[i]).append("<br><button type='button' class='btn' id='recipe-fav-" + recipe_id + "'>Add Recipe</button>");
                    $($('.award')[i]).append("<p>Cuisine: "+data.Results[i]["Cuisine"]+"</p>");
                    $($('.award')[i]).append("<p>Category: "+data.Results[i]["Category"]+"</p>");
                    var source = data.Results[i]["HeroPhotoUrl"];
                    // $("#dish-dish .thumbnail").append("<br><img src="+source+" /><br>");
                    $($('.dish-image')[i]).append("<img src="+source+" class='img-responsive' alt='Image'>");
                  }
                  recipe_list.forEach(function(entry){
                     fetchRecipeJson(entry);
                  })
              }
          });
      };
      getRecipeJson();

      function fetchRecipeJson(iD) {
      var apiKey = "dvxW73xq8iT64kItLgiQfPb2Fo356753";
      var recipeID = iD;
      var url = "http://api.bigoven.com/recipe/" + recipeID + "?api_key="+apiKey;
      $.ajax({
               type: "GET",
               dataType: 'json',
               cache: false,
               url: url,
               success: function (data) {
                $('#dish-dish .thumbnail').on('click', "#recipe-fav-" + recipeID, function(something) {
                  // $('#recipe-fav').click(function(something){
                    var ingredientsArray = [];
                    var name = data["Title"];
                    var directions = data["Instructions"];
                    var category = data["Category"];
                    var ingredients = data["Ingredients"];
                    ingredients.forEach(function(ingredient){
                      ingredientsArray.push(ingredient["Name"])
                    });
                    var stringIngredients = ingredientsArray.join(", ");
                    $.post('/favorites', { name: name, directions: directions, category: category, ingredients: stringIngredients });
                  })
                  }
               });
             }
  });

