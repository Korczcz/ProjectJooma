var accordion = document.querySelector('.accordion');
var parent_id = accordion.id;

var accordions = document.querySelectorAll('[data-bs-toggle=collapse]');

accordions.forEach(function(item) {
    item.addEventListener('click', function() {
        // Remove show class from accordion panels
        var panels = document.querySelectorAll('[data-bs-parent]');
        var i;
        for (i = 0; i < panels.length; i++)
        {
            if ((panels[i].getAttribute('data-bs-parent') == '#'+parent_id) && panels[i].classList.contains('show'))
            {
                panels[i].classList.remove('show');
            }
        }
        
        // Add show class to current panel
        var target_id = item.getAttribute('data-bs-target');
        var panel = document.querySelector(target_id);
        panel.classList.add('show');
        
        // Add collapsed class to accordion buttons
        var j;
        for (j = 0; j < accordions.length; j++)
        {
            accordions[j].classList.add('collapsed');
        }
        
        // Remove collapsed class from current accordion button
        item.classList.remove('collapsed');
    });
});