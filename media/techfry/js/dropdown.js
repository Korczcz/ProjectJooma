var elements = document.querySelectorAll('[data-bs-toggle=dropdown]');
            
elements.forEach(function(item) {
    item.addEventListener('click', function() {
        // Dropdown ul is next element
        var ul = item.nextElementSibling;

        // Toggle show class
        ul.classList.toggle('show');
    });
});