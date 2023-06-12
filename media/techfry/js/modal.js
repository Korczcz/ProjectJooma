// Get trigger button
var btn = document.querySelector('[data-bs-toggle=modal]');
var modal_id = btn.getAttribute('data-bs-target');

// Get modal
var modal = document.querySelector(modal_id);

// Set style to display:none
modal.style.display = 'none';

// When user clicks on button, open the modal
btn.onclick = function() {modal.style.display = 'block';}

// When user clicks on close, close the modal
var close_btn = document.querySelector('[data-bs-dismiss=modal]');
close_btn.onclick = function() {modal.style.display = 'none';}

// Modal on page load after delay
if (btn.hasAttribute('data-bs-delay')) {
    var delay = btn.getAttribute('data-bs-delay');
    window.onload = (event) => {
        setTimeout(function() {modal.style.display = 'block';}, delay);
    };
}