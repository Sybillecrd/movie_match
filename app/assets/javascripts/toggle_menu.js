$(document).on('click', '.toggle-menu', function(){
  $(this).toggleClass('on');
  $('.hidden-menu').slideToggle();
  return false; // non important
});
