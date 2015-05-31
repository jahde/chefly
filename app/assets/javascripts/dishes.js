// test
$(document).ready(function(){
  function getRecipeJson() {
          var apiKey = "dvx8W4XdSOxw9en1G8benXRZ8n3rGrMH";
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
                    $($('.award-dishes')[i]).append("<button class='test-recipe-ingredient'><h4 title="+recipe_id+">"+data.Results[i]["Title"]+"</button><br>");
                    $($('.award-dishes')[i]).append("<br><button type='button' data-toggle='modal' data-target='#myModal' class='btn' id='recipe-fav-" + recipe_id + "'>Add Recipe</button>");
                    $($('.award-dishes')[i]).append("<p>Cuisine: "+data.Results[i]["Cuisine"]+"</p>");
                    $($('.award-dishes')[i]).append("<p>Category: "+data.Results[i]["Category"]+"</p>");
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
      var apiKey = "dvx8W4XdSOxw9en1G8benXRZ8n3rGrMH";
      var recipeID = iD;
      var url = "http://api.bigoven.com/recipe/" + recipeID + "?api_key="+apiKey;
      $.ajax({
               type: "GET",
               dataType: 'json',
               cache: false,
               url: url,
               success: function (data) {
                $('.award-dishes').on('click', "#recipe-fav-" + recipeID, function(something) {

                  // $('#recipe-fav').click(function(something){
                    var ingredientsArray = [];
                    var name = data["Title"];
                    var directions = data["Instructions"];
                    var category = data["Category"];
                    var photo = data["HeroPhotoUrl"];
                    var ingredients = data["Ingredients"];
                    ingredients.forEach(function(ingredient){
                      ingredientsArray.push(ingredient["Name"]);
                    });
                    var stringIngredients = ingredientsArray.join(", ");
                    $.post('/favorites', { name: name, directions: directions, category: category, ingredients: stringIngredients, photo: photo})
                    .done(function(){
                      // debugger;
                    // $("#myModal").toggle(100000);
                  })
                  })
                  }
               });
             }
  });

