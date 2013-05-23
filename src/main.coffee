require ['FancyCheckbox', 'domReady!'], (FancyCheckbox) ->
	console.log 'FancyCheckbox demo load'

	for input in document.getElementsByClassName('fancyCheckbox')
		new FancyCheckbox input