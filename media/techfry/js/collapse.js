var elements = document.querySelectorAll('[data-bs-toggle=collapse]');
            
elements.forEach(function(item) {
    item.addEventListener('click', function() {
        // For links, target is href
        if (item.nodeName == 'A')
        {
            var target_id = item.getAttribute('href');
        }
        // For buttons, target is data-bs-target
        if (item.nodeName == 'BUTTON')
        {
            var target_id = item.getAttribute('data-bs-target');
        }
        
        // Toggle show class
        var div = document.querySelector(target_id);
        div.classList.toggle('show');
    });
});