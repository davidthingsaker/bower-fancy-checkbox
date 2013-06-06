(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define(['mootools'], function() {
    var FancyBox;
    return FancyBox = (function() {
      function FancyBox(input, options) {
        var defaultOptions, inputPosition, key, value,
          _this = this;
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
          "class": this.input.className
        });
        this.div.inject(this.input, 'after');
        inputPosition = this.input.getStyles('margin', 'padding', 'position', 'top', 'left', 'bottom', 'right');
        this.div.setStyles(inputPosition);
        this.input.setStyle('position', 'absolute');
        this.updateCheckbox();
        this.input.addEvent('change', this.updateCheckbox);
        if (!this.input.getParent('label')) {
          this.div.addEvent('click', function(event) {
            _this.input.checked = !_this.input.checked;
            return _this.updateCheckbox();
          });
        }
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
