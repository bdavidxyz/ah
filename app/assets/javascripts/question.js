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
    var editor_initial_value = $('#coleditor').attr('data-initial').replace(/\\n/g, '\n').replace(/\\t/g, '\t');
    editor.setValue(editor_initial_value)
    editor.focus()
    editor.setCursor({line: 2, ch: 1})

    editor.on('change',function(cMirror){
      check_wisely();
      editor.refresh();
      setTimeout(check_wisely, 400);
      setTimeout(check_wisely, 800);
    });

    function check_wisely(){
      var no_error = true;
      try {
        window.eval(editor.getValue());
      } catch(e) {
        no_error = false
      } finally {
        var no_warning = $('.CodeMirror-lint-marker-error').length === 0
        if (no_warning && no_error && (typeof window.f === 'function')) {

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
              if (evaluation === expectation) {
                if ($("#tr" + local_index).hasClass('red')) {
                  $("#tr" + local_index).pulse({times: 2, duration: 100});
                }
                $("#tr" + local_index).addClass("green");
                $("#tr" + local_index).removeClass("red");
                $("#resulting" + local_index).text("✓");
              } else {
                if ($("#tr" + local_index).hasClass('green')) {
                  $("#tr" + local_index).pulse({times: 2, duration: 100});
                }
                $("#tr" + local_index).addClass("red");
                $("#tr" + local_index).removeClass("green");
                var stringified = _.isUndefined(evaluation) ? "undefined" : JSON.stringify(evaluation)
                $("#resulting" + local_index).text(stringified);
              }
            }
          });

        } else {
          _.times($('.trtest').length, function(index){
          var local_index  = index + 1
          $("#tr" + local_index).removeClass("green")
          $("#tr" + local_index).removeClass("red")
          $("#resulting" + local_index).text("");
        });
       }
     } 

   };




  }
});