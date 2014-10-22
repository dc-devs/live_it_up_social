$(document).ready(function ($) {
  $('#scroll-myActivities').perfectScrollbar();
  $('#scroll-myVotes').perfectScrollbar();
  $('#scroll-eventDeclines').perfectScrollbar();
  $('#scroll-eventInvited').perfectScrollbar();
  $('#scroll-eventAccepted').perfectScrollbar();
  
  $('.activities-listItem').bind({
  mouseenter: function(e) {
    console.log(e.delegateTarget.childNodes[3]);
  // Hover event handler
   $(e.delegateTarget.childNodes[3]).addClass('move-arrow-up');
  },
  mouseleave: function(e) {
  // Hover event handler
  $(e.delegateTarget.childNodes[3]).removeClass('move-arrow-up');
  },
  click: function(e) {
  // Click event handler
   console.log(e.delegateTarget)
   $(e.delegateTarget).addClass('highlight-green');
  },
  blur: function(e) {
  // Blur event handler
   $(e.delegateTarget).addClass('highlight-green');
  }
 });
 

  //$('.activities-listItem').hover( handlerIn, handlerOut )
  
  function handlerIn(){
     console.log("Handle IN!");
    
  }

  function handlerOut(){
    console.log("Handle Out!");

    
  }

});
