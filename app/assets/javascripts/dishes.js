// test
$(document).ready(function(){
  function getRecipeJson() {
          var apiKey = "dvxBm9UtLmVZby8Qvc1IO3i52o9Y1Dsj";
          // var titleKeyword = "latin egg wrap";
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
                    $("#dish-dish .thumbnail").append("<h4 title="+recipe_id+">"+data.Results[i]["Title"]+"</h4><button type='button' class='btn' id='recipe-vid'>View Recipe</button>"+"<br>");
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
      var apiKey = "dvxBm9UtLmVZby8Qvc1IO3i52o9Y1Dsj";
      var recipeID = iD;
      var url = "http://api.bigoven.com/recipe/" + recipeID + "?api_key="+apiKey;
      $.ajax({
               type: "GET",
               dataType: 'json',
               cache: false,
               url: url,
               success: function (data) {
                  debugger;
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
                  // $("#dish-dish").html(data.Instructions);
                  // debugger;
                  // $("#dish-dish").html(data.Ingredients[0]["Name"])
                  }
               });
             }
  });

