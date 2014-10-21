$( document ).ready(function() {

$(function() {
    var availableTags = [
      "Biking",
      "Climbing",
      "Drinking",
      "Hiking",
      "Kayaking",
      "Paddleboarding",
      "Sailing",
      "Surfing",
      "Other"
    ];
    $( "#activities-search-input" ).autocomplete({
      source: availableTags
    });
  });

  // $(function() {
  //   $( "#tabs" ).tabs();
  // });
//   $('#myTab a').click(function (e) {
//   e.preventDefault()
//   $(this).tab('show')
// })
//   $('#myTab a:last').tab('show')
});
