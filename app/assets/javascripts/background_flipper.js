$( document ).ready(function(){

  var background_images = ["https://s3-us-west-1.amazonaws.com/liveitupsocial/uploads/production/home/main-bk.png"]

  if (document.getElementById("homepage_body")){

    $("#homepage_body").css("background", "url("+background_images[[Math.floor(Math.random()*background_images.length)]]+") no-repeat").addClass("parallax");


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
          elBackgrounPos = "0% " + (windowYOffset * speed) + "px";

      el.style.backgroundPosition = elBackgrounPos;

    });
  };

})();

}); //End Doc Ready

