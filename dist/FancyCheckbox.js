
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define('FancyCheckbox',['mootools'], function(FormValidator) {
    var FancyBox;

    return FancyBox = (function() {
      function FancyBox(input, options) {
        var defaultOptions, inputPosition, key, value;

        this.input = input;
        this.options = options != null ? options : {};
        this.updateCheckbox = __bind(this.updateCheckbox, this);
        defaultOptions = {
          checkedContent: '&#10003;',
          uncheckedContent: ''
        };
        for (key in defaultOptions) {
          value = defaultOptions[key];
          if (this.options[key] == null) {
            this.options[key] = value;
          }
        }
        this.input.FancyBox = this;
        this.div = new Element('div', {
          "class": input.className
        });
        this.div.inject(input, 'after');
        inputPosition = this.input.getStyles('margin', 'padding', 'position', 'top', 'left', 'bottom', 'right');
        this.div.setStyles(inputPosition);
        this.updateCheckbox();
        this.input.addEvent('change', this.updateCheckbox);
      }

      FancyBox.prototype.updateCheckbox = function() {
        var content;

        content = this.input.checked ? this.options.checkedContent : this.options.uncheckedContent;
        this.div.set('html', content);
        if (this.input.checked) {
          return this.div.addClass('checked');
        } else {
          return this.div.removeClass('checked');
        }
      };

      return FancyBox;

    })();
  });

}).call(this);
