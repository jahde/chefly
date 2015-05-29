// test
$(document).ready(function(){
  function getRecipeJson() {
          var apiKey = "dvx8W4XdSOxw9en1G8benXRZ8n3rGrMH";
          var titleKeyword = $('h1').text().toLowerCase();
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
                    $("#dish-dish .thumbnail").append("<button class='test-recipe-ingredient'><h4 title="+recipe_id+">"+data.Results[i]["Title"]+"<br>"+"</button>"+"<br>");
                    $("#dish-dish .thumbnail").append("<h4 title="+recipe_id+">"+data.Results[i]["Title"]+"<br>"+"</h4><button type='button' class='btn' id='recipe-fav'>Add Recipe</button>"+"<br>");
                    var source = data.Results[i]["HeroPhotoUrl"];
                    $("#dish-dish .thumbnail").append("<img src="+source+" />");
                  }
                  recipe_list.forEach(function(entry){
                     fetchRecipeJson(entry);
                  })
              }
          });
      };
      getRecipeJson();

      function fetchRecipeJson(iD) {
      var apiKey = "dvx8W4XdSOxw9en1G8benXRZ8n3rGrMH";
      var recipeID = iD;
      var url = "http://api.bigoven.com/recipe/" + recipeID + "?api_key="+apiKey;
      $.ajax({
               type: "GET",
               dataType: 'json',
               cache: false,
               url: url,
               success: function (data) {
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
                    $.post('/recipes', { name: name, directions: directions, category: category, ingredients: stringIngredients });
                  // })
                  }
               });
             }
  });

