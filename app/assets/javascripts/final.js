$(document).on('ready turbolinks:load', function() {
  if ($('body').hasAllClasses('c-body final index')) {

    console.log('loaded finaljs')

    ajaxMailChimpForm($("#subscribe-form"), $("#subscribe-result"));



    // Turn the given MailChimp form into an ajax version of it.
    // If resultElement is given, the subscribe result is set as html to
    // that element.
    function ajaxMailChimpForm($form, $resultElement){

      // Hijack the submission. We'll submit the form manually.
      $form.submit(function(e) {
        e.preventDefault();

        if (!isValidEmail($form)) {
          var error =  "A valid email address must be provided.";
          fillFeedback(error, "red")
        } else {
          fillFeedback("Subscribing...", "black")
          submitSubscribeForm($form, $resultElement);
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
        $resultElement.css("color", color);
        $resultElement.html(message);
      }

      // Submit the form with an ajax/jsonp request.
      // Based on http://stackoverflow.com/a/15120409/215821
      function submitSubscribeForm($form, $resultElement) {
        $.ajax({
          type: "GET",
          url: $form.attr("action"),
          data: $form.serialize(),
          cache: false,
          dataType: "jsonp",
          jsonp: "c",
          contentType: "application/json; charset=utf-8",
          error: function(error){
            console.error('error called from mailchimp callback')
            fillFeedback("Error occured", "red")
          },
          success: function(data){
            if (data.result != "success") {
              var message = data.msg || "Sorry. Unable to subscribe. Please try again later.";
              $resultElement.css("color", "red");

              if (data.msg && data.msg.indexOf("already subscribed") >= 0) {
                message = "You're already subscribed. Thank you.";
                $resultElement.css("color", "black");
              }

              $resultElement.html(message);

            } else {
              $resultElement.css("color", "black");
              $resultElement.html("Thank you!<br>You must confirm the subscription in your inbox.");
            }
          }
        });
      }

    } // ajaxMailChimpForm
  } // hasAllClasses
}); // $(document).on('ready...
