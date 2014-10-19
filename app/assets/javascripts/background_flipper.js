$( document ).ready(function(){

var background_images = ["cable_car.jpg", "pier.jpg", "main_background.jpg", "fort_mason.jpg","ocean_beach.jpg"]

if (document.getElementById("homepage_body")){
  $("#homepage_body").css("background", "url(assets/"+background_images[[Math.floor(Math.random()*background_images.length)]]+") no-repeat fixed")
}

})

