(function() {
  require(['FancyCheckbox', 'domReady!'], function(FancyCheckbox) {
    var input, _i, _len, _ref, _results;

    console.log('FancyCheckbox demo load');
    _ref = document.getElementsByClassName('fancyCheckbox');
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      input = _ref[_i];
      _results.push(new FancyCheckbox(input));
    }
    return _results;
  });

}).call(this);
