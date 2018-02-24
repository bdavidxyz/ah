$(document).on('ready turbolinks:load', function() {
  if ($('body').hasAllClasses('c-body final index')) {

var $loadEmailButton = $($('.load-email-button')[0]);
var $contactForm = $('#contact-form');

$contactForm.submit(function(e) {
  e.preventDefault();
  $.ajax({
    url: '//formspree.io/bdavidxyz@gmail.com',
    method: 'POST',
    data: $(this).serialize(),
    dataType: 'json',
    beforeSend: function() {
      $loadEmailButton.attr('disabled','disabled'); 
      $loadEmailButton.attr('value','Envoi en cours...'); 
    },
    success: function(data) {
      $loadEmailButton.attr('value','Inscription confirmée'); 
      $loadEmailButton.replaceClass('btn-primary','btn-success'); 
      $contactForm.find('.alert--loading').hide();
    },
    error: function(err) {
      $loadEmailButton.attr('value','Erreur inattendue'); 
      $loadEmailButton.replaceClass('btn-primary','btn-danger'); 
      $contactForm.find('.alert--loading').hide();
    }
  });
});



  }
});
