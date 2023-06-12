// Get trigger button
var toggle = document.querySelector('[data-bs-toggle=offcanvas]');
if (toggle.nodeName == 'A')
{
    var offcanvas_id = toggle.getAttribute('href');
}
if (toggle.nodeName == 'BUTTON')
{
    var offcanvas_id = toggle.getAttribute('data-bs-target');
}

// Get offcanvas
var offcanvas = document.querySelector(offcanvas_id);

// When user clicks on button, open the offcanvas
toggle.onclick = function() {
    offcanvas.classList.add('show');
    
    // Create offcanvas backdrop div element
    var div = document.createElement('div');
    div.className = 'offcanvas-backdrop fade show';
    offcanvas.parentNode.appendChild(div);
}

// When user clicks on close, close the offcanvas
var close_btn = document.querySelector('[data-bs-dismiss=offcanvas]');
close_btn.onclick = function() {
    offcanvas.classList.remove('show');
    
    // Remove backdrop div element
    offcanvas.nextElementSibling.remove();
}