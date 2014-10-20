$( document ).ready(function() {

  $('.new_vote').click(function(e){
    e.preventDefault();
    var vote_button = $(this);

    console.log("click");
    $.ajax({
      url: '/votes',
      type: 'POST',
      data: $(this).serialize()

    }).done(function(data){
      console.log(data);
      vote_button.html('<button class="activities-voteUpButton" name="button" type="submit"><div class="activities-BackersWrapper text-center"><span id="vote_value">'+data+'</span><br></div></button>')

    }).fail(function(error){
      console.log("error" + error)

    });
  });







});
