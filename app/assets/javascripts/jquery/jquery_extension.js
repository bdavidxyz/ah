$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    return results[1] || 0;
}

$.fn.hasAllClasses = function() {
  var result = undefined;
  for (var i = 0; i < arguments.length; i++) {
    if (!this.hasClass(arguments[i])) {
      return false;
    } else {
      result = true
    }
  }
  return result;
}
