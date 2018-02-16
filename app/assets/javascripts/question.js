
$(document).on('ready turbolinks:load', function() {
  if ($('body').hasClass('question')) {

    setTimeout(check_wisely, 1000);

    $('.CodeMirror').remove()
    var editor = CodeMirror.fromTextArea(document.getElementById("editor"), {
      lineNumbers: true,
      mode: "javascript",
      theme: "xq-light",
      gutters: ["CodeMirror-lint-markers"],
      tabSize: 2,
      autoCloseBrackets:true,
      lint: true,
      nonEmpty: true
    })
    var editor_initial_value = $('#coleditor').attr('data-initial').replace(/\\n/g, '\n');
    editor.setValue(editor_initial_value)
    editor.focus()
    editor.setCursor({line: 4, ch: 3})


    _.times($('.td-oracle').length, function(counter) {
      $('#badging' + (counter + 1)).flip({trigger: 'manual'});
      $('#badging' + (counter + 1)).flip(true);
    });

    editor.on('change',function(cMirror){
      check_wisely();
      editor.refresh();
      setTimeout(check_wisely, 400);
      setTimeout(check_wisely, 800);
    });

    function check_wisely(){
      var no_compilation_error = true;
      try {
        delete window.f;
        // console.log("editor.getValue()");
        // console.log(editor.getValue());
        if (editor.getValue() !== "") {
          window.eval(editor.getValue());
        }
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
              evaluation = "**exception**"
            } finally {
              r_target = $("#badging" + local_index)
              r_line = $("#tr" + local_index)
              var stringified = _.isUndefined(evaluation) ? "undefined" : _.isEqual(evaluation, "**error**") ? "**error**" : JSON.stringify(evaluation)
              $("#resulting" + local_index).text(stringified);
              if (evaluation === expectation) {
                r_line.addClass("green");
                r_line.removeClass("red");
                r_target.flip(false);
              } else {
                r_target.flip(true);
                r_line.addClass("red");
                r_line.removeClass("green");
              }
            }
          });

        } else if (no_compilation_error) {
          console.log('no compilation, sorry')
          _.times($('.trtest').length, function(index){
              var local_index  = index + 1
              r_target = $("#badging" + local_index)
              r_line = $("#tr" + local_index)
              r_target.flip(true);
              r_line.addClass("red");
              r_line.removeClass("green");
              $("#resulting" + local_index).text("**error**");
          });
        } else if (!(typeof window.f === 'function')) {
          console.log('no window.f, sorry')
          _.times($('.trtest').length, function(index){
              var local_index  = index + 1
              r_target = $("#badging" + local_index)
              r_line = $("#tr" + local_index)
              r_target.flip(true);
              r_line.addClass("red");
              r_line.removeClass("green");
              $("#resulting" + local_index).text("**no f function**");
          });
        }
     } 

     fill_form();

   };


   function fill_test_table(color, text) {

   }

   function fill_form() {

     var nb_of_lint_warning = $('.CodeMirror-lint-marker-warning').length
     $("input[name='nb_of_lint_warning']").attr('value', nb_of_lint_warning)
          
     var nb_of_lint_error = $('.CodeMirror-lint-marker-error').length
     $("input[name='nb_of_lint_error']").attr('value', nb_of_lint_error)
     
     var nb_of_green_test = $('.trtest.green').length
     $("input[name='nb_of_green_test']").attr('value', nb_of_green_test)
     
     var nb_of_red_test = $('.trtest.red').length
     $("input[name='nb_of_red_test']").attr('value', nb_of_red_test)
          
   }


  }
});
