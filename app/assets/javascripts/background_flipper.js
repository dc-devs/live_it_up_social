$( document ).ready(function(){

  var background_images = ["cable_car.jpg", "pier.jpg", "main_background.jpg", "fort_mason.jpg","ocean_beach.jpg"]

  if (document.getElementById("homepage_body")){

    $("#homepage_body").css("background", "url(assets/"+background_images[[Math.floor(Math.random()*background_images.length)]]+") no-repeat").addClass("parallax");

//Trying to fix navbar

(function(){
    $(".navbar").mouseover(function() {
    $(".navbar-header").show();
  });
  });
//End of attempt

    $(document).scroll(function () {
      var y = $(this).scrollTop();
        if (y > 300) {
            $('.navbar').fadeIn();
        } else {
            $('.navbar').fadeOut();
        }
    });


  };

(function(){

  var parallax = document.querySelectorAll(".parallax"),
      speed = 0.5;

  window.onscroll = function(){
    [].slice.call(parallax).forEach(function(el,i){

      var windowYOffset = window.pageYOffset,
          elBackgrounPos = "50% " + (windowYOffset * speed) + "px";

      el.style.backgroundPosition = elBackgrounPos;

    });
  };

})();

}); //End Doc Ready

