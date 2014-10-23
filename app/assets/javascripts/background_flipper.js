$( document ).ready(function(){

  var background_images = ["https://s3-us-west-1.amazonaws.com/liveitupsocial/uploads/production/home/cable_car.jpg", "https://s3-us-west-1.amazonaws.com/liveitupsocial/uploads/production/home/main_background.jpg"]

  if (document.getElementById("homepage_body")){

    $("#homepage_body").css("background", "url("+background_images[[Math.floor(Math.random()*background_images.length)]]+") no-repeat").addClass("parallax");

//Trying to fix navbar to show on mouseover

    // $(window).scroll(function() {
    //     if ($(window).scrollTop() > 300) {
    //         $('.navbar').fadeIn();
    //     }
    //     else {
    //         $('.navbar').fadeOut();
    //     }
    // });

    //   (function(){
    //     $('.navbar').mouseover( function () {
    //       $(this).fadeIn();
    //       });

    //     $('.navbar').mouseleave( function () {
    //         if($(window).scrollTop() > 300) {
    //             $(this).fadeOut();
    //         }
    //     });

    // })
//End of attempt (FAIL)

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

