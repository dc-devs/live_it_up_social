$( document ).ready(function(){

var background_images = [
"http://www.fullhdwpp.com/wp-content/uploads/San-Francisco-Tramline_www.FullHDWpp.com_.jpg",

"http://hdwallpaper.freehdw.com/0007/animals_hdwallpaper_san-francisco-pier_61190.jpg",

"http://wallhud.com/download?filename=2013/04/San-Francisco-Bridge-Wallpaper-HD.jpg",

"http://4.bp.blogspot.com/-2jX-A7hI0L8/UQWah2wrf0I/AAAAAAAABoo/EC6sjOW_ziU/s1600/pat1456664812.jpg",

"http://upload.wikimedia.org/wikipedia/commons/1/1f/Ocean_Beach_in_San_Francisco_at_sunrise.jpg"]

  if (document.getElementById("homepage_body")){
    $("#homepage_body").css("background-image", "url("+background_images[[Math.floor(Math.random()*background_images.length)]]+")")
  }

})