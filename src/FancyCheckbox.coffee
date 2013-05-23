## Fancy checkboxes 
define ['mootools'], () ->
	class FancyBox 
		constructor: (@input, @options = {}) ->
			defaultOptions = 
				checkedContent: '&#10003;'
				uncheckedContent: ''

			for key, value of defaultOptions
				@options[key] = value if !@options[key]?

			@input.FancyBox = this
			@div = new Element 'div',
				class : @input.className

			@div.inject @input, 'after'

			inputPosition = @input.getStyles 'margin','padding','position','top','left','bottom','right'
			
			@div.setStyles inputPosition
			@input.setStyle 'position', 'absolute'

			@updateCheckbox()
			@input.addEvent 'change', @updateCheckbox

			##If the input si not in a label add onclick for the DIV
			if !@input.getParent 'label'
				@div.addEvent 'click', (event) =>
					@input.checked = !@input.checked
					@updateCheckbox()

		updateCheckbox: () =>
			content = if @input.checked then @options.checkedContent else @options.uncheckedContent
			@div.set 'html', content

			if @input.checked
				@div.addClass 'checked'
			else
				@div.removeClass 'checked'
