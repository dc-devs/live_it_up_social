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
});
