$(document).on('ready turbolinks:load', function() {
  if ($('body').hasAllClasses('c-body final index')) {


var $loadEmailButton = $('.load-email-button')[0];
var $contactForm = $('#contact-form');
var DEFAULT_TEXT_CONTENT = "Je m'inscris";

$contactForm.submit(
  function (e) {
    e.preventDefault();
    $loadEmailButton.textContent = 'Veuillez patienter...';
    var emailValue = $('.load-email-enter').val();
    var honeyPotValue = $('.load-email-enter-fake').val();
    $loadEmailButton.classList.add('load-email-button-is-active');
    $('.load-email-enter').attr('disabled', 'disabled');
    $('.load-email-button').attr('disabled', 'disabled');
    if (honeyPotValue === '') {
      $.ajax({
        url: 'https://formspree.io/bdavidxyz@gmail.com',
        method: 'POST',
        data: { email: emailValue },
        dataType: 'json',
        success: function () {
          $loadEmailButton.textContent = 'Inscription réussie';
        },
        error: function () {
          $loadEmailButton.classList.add('load-email-button-is-error');
          setTimeout(function () {
            $('.first-page-email-enter').val('');
            $loadEmailButton.classList.remove('load-email-button-is-error');
            $loadEmailButton.textContent = 'Erreur inconnue';
          }, 5000);
        }
      });
    }
  }
);



  }
});
