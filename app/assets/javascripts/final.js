$(document).on('ready turbolinks:load', function() {
  if ($('body').hasAllClasses('c-body final index')) {

    ajaxMailChimpForm($("#subscribe-form"), $("#subscribe-result"));

    // Turn the given MailChimp form into an ajax version of it.
    // If resultElement is given, the subscribe result is set as html to
    // that element.
    function ajaxMailChimpForm($form, $resultElement){

      // Hijack the submission. We'll submit the form manually.
      $form.submit(function(e) {
        e.preventDefault();

        if (!isValidEmail($form)) {
          fillFeedback("Adresse e-mail invalide", "red")
        } else {
          fillFeedback("Inscription en cours...", "black")
          submitSubscribeForm();
        }
      });

      // Validate the email address in the form
      function isValidEmail($form) {
        // If email is empty, show error message.
        // contains just one @
        var email = $form.find("input#form-email").val();
        if (!email || !email.length) {
          return false;
        } else if (email.indexOf("@") == -1) {
          return false;
        }

        return true;
      }

      function fillFeedback(message, color) {
        $resultElement.css("background-color", color);
        $resultElement.css("border-color", color);
        $resultElement.attr("disabled", "disabled");
        $resultElement.val(message);
        if (color === "red") {
          setTimeout(function() {
            $resultElement.css("background-color", "#007bff");
            $resultElement.css("border-color", "#007bff");
            $resultElement.removeAttr("disabled");
            $resultElement.val("Je m'inscris");
            $("#form-email").focus();
          }, 3000);
        }
      }

      // Submit the form with an ajax/jsonp request.
      // Based on http://stackoverflow.com/a/15120409/215821
      function submitSubscribeForm() {
        $.ajax({
          type: "GET",
          url: $form.attr("action"),
          data: $form.serialize(),
          cache: false,
          dataType: "jsonp",
          jsonp: "c",
          contentType: "application/json; charset=utf-8",
          error: function(error){
            setTimeout(function() {
              fillFeedback("Une erreur est survenue", "red")
            }, 900);
          },
          success: function(data){
            if (data.result != "success") {
              if (data.msg && data.msg.indexOf("already subscribed") >= 0) {
                fillFeedback("Vous êtes déjà inscrit.", "black");
              } else {
                var message = data.msg || "Désolé. Essayez plus tard.";
                fillFeedback(message, "red");              
              }
            } else {
              fillFeedback("Merci. Vous devez confirmer votre inscription dans votre boîte mail.", "black");              
            }
          }
        });
      }

    }    // ajaxMailChimpForm
  }    // hasAllClasses
});  // $(document).on('ready...
