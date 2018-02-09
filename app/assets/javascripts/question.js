$(document).on('ready turbolinks:load', function() {
  if ($('body').hasClass('question')) {

    var editor = CodeMirror.fromTextArea(document.getElementById("editor"), {
      lineNumbers: true,
      mode: "javascript",
      theme: "xq-light",
      gutters: ["CodeMirror-lint-markers"],
      tabSize: 2,
      autoCloseBrackets:true,
      lint: {
        options: {
          asi:true,
          indent: 2,
          esversion: 6,
          undef: true,
          eqeqeq: true,
          node: true
        }
      }
    })
    var editor_initial_value = $('#coleditor').attr('data-initial').replace(/\\n/g, '\n');
    editor.setValue(editor_initial_value)
    editor.focus()
    editor.setCursor({line: 4, ch: 3})

    editor.on('change',function(cMirror){
      check_wisely();
      editor.refresh();
      setTimeout(check_wisely, 400);
      setTimeout(check_wisely, 800);
    });

    function check_wisely(){
      var no_compilation_error = true;
      try {
        window.eval(editor.getValue());
      } catch(e) {
        no_compilation_error = false
      } finally {
        var no_lint_error = $('.CodeMirror-lint-marker-error').length === 0
        if (no_compilation_error && (typeof window.f === 'function')) {

          _.times($('.trtest').length, function(index){
            var local_index  = index + 1
            var expectation = null;
            var evaluation = null;
            try {
              evaluation = eval($("#testing" + local_index).text());
              expectation = eval($("#expecting" + local_index).text());
            } catch(e) {
              evaluation = "**error**"
            } finally {
              r_target = $("#badging" + local_index + " .badge")
              var stringified = _.isUndefined(evaluation) ? "undefined" : _.isEqual(evaluation, "**error**") ? "**error**" : JSON.stringify(evaluation)
              $("#resulting" + local_index).text(stringified);
              if (evaluation === expectation) {
                r_target.addClass("badge-success");
                r_target.removeClass("badge-danger");
                r_target.text("✓ Pass");
              } else {
                r_target.removeClass("badge-success");
                r_target.addClass("badge-danger");
                r_target.text("✕ Fail");
              }
            }
          });

        } else if (no_compilation_error) {
          console.log('no compilation, sorry')
        } else if (!(typeof window.f === 'function')) {
          console.log('no window.f, sorry')
        }
     } 

   };




  }
});
