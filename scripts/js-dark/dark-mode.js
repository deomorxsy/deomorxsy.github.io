document.addEventListener('turbolinks:load', themeChange);
// Adding turbolinks, the code will run with the Event Handler 'turbolinks:load', instead of 'DOMContentLoaded'.

function themeChange(){ // Make sure to transcript correctly the variable from the ".addEventListener"!
	// Select our toggle button
	let button = document.querySelector('.theme-toggle');

	// Add an event listener for a click
	button.addEventListener('click', function(e){
		// Check the current data-theme value
		let currentTheme = document.documentElement.getAttribute('data-theme');
		if(currentTheme === 'light') {
			transition();
			document.documentElement.setAttribute('data-theme', 'dark');			
		} else {
			transition();
			document.documentElement.setAttribute('data-theme', 'light');
		}
	});

	// Adds the 'transition' class to <html> for CSS fun
	let transition = () =>{
		document.documentElement.classList.add('transition');
		window.setTimeout(()=>{
			document.documentElement.classList.remove('transition');
		}, 1000);
	} 
}