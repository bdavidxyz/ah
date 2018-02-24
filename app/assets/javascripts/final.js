$(document).on('ready turbolinks:load', function() {
  if ($('body').hasAllClasses('c-body final index')) {
    console.log('this is final blabla');
  }
});
