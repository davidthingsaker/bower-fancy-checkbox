require ['FancyCheckbox', 'domReady!'], (FancyCheckbox) ->
	console.log 'FancyCheckbox demo load'

	inputs = document.getElements 'input.fancyCheckbox'

	for input in inputs
		console.log inputs
		new FancyCheckbox input