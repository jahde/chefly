$(document).ready(function(){

  $('.award#favorites-page').on('click', ".delete-favorite", function(something){
    var recipeID = $('.delete-favorite').attr('id')
    $.ajax({
    url: '/recipes/' + recipeID,
    type: 'PATCH',
    success: function(result) {
        // Do something with the result
    }
});
  })

});
