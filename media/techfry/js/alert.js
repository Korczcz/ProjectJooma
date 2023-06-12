var alerts = document.querySelectorAll('[data-bs-dismiss=alert]');
            
alerts.forEach(function(item) {
    item.addEventListener('click', function() {
        item.parentNode.remove();
    });
});