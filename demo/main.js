(function() {
  require(['FancyCheckbox', 'domReady!'], function(FancyCheckbox) {
    var input, inputs, _i, _len, _results;

    console.log('FancyCheckbox demo load');
    inputs = document.getElements('input.fancyCheckbox');
    _results = [];
    for (_i = 0, _len = inputs.length; _i < _len; _i++) {
      input = inputs[_i];
      console.log(inputs);
      _results.push(new FancyCheckbox(input));
    }
    return _results;
  });

}).call(this);
