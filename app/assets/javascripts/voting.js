$( document ).ready(function() {

  $('.new_vote').click(function(e){
    e.preventDefault();
    var vote_button = $(this);
    var vote_count = vote_button[0].button.children[0].children[2].children[0]

    console.log("click");
    $.ajax({
      url: '/votes',
      type: 'POST',
      data: $(this).serialize()

    }).done(function(data){
      
      $(vote_count).text(data)

      remaining_votes = parseInt($('#remaining-votes').text()) -1
        $('#remaining-votes').html('<h4 id="remaining-votes">'+ remaining_votes + '</h4>')

    }).fail(function(error){
      console.log("error" + error)
    });
  });
});
