$(document).ready(function ($) {
  $('#scroll-myActivities').perfectScrollbar();
  $('#scroll-myVotes').perfectScrollbar();
  $('#scroll-eventDeclines').perfectScrollbar();
  $('#scroll-eventInvited').perfectScrollbar();
  $('#scroll-eventAccepted').perfectScrollbar();

  $('.activities-listItem').bind({
  mouseenter: function(e) {
    console.log(e);
  // Hover event handler
   $(e.delegateTarget.children[0].children[1]).addClass('enter-arrowUp');
   $(e.delegateTarget.children[0].children[2]).addClass('zero-opacity');
  },
  mouseleave: function(e) {
  // Hover event handler
  $(e.delegateTarget.children[0].children[1]).removeClass('enter-arrowUp');
  $(e.delegateTarget.children[0].children[2]).removeClass('zero-opacity');
  },
  mousedown: function(e) {
  // Click event handler
   console.log(e.delegateTarget)
   $(e.delegateTarget).addClass('highlight-green');
   $(e.delegateTarget.children[0].children[1]).removeClass('enter-arrowUp');
   $(e.delegateTarget.children[0].children[2]).removeClass('zero-opacity');

  },
  mouseup: function(e) {
  // Click event handler
   console.log(e.delegateTarget)
   $(e.delegateTarget).removeClass('highlight-green');
  }
  
 });

// $('#votes-tabs a:last').tab('show')

});
