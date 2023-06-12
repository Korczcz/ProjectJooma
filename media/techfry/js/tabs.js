var tabs = document.querySelectorAll('[data-bs-toggle=tab]');

tabs.forEach(function(item) {
    item.addEventListener('click', function() {
        // Remove show active class from tab panels
        var panels = document.querySelectorAll('[role=tabpanel]');
        var i;
        for (i = 0; i < panels.length; i++)
        {
            if (panels[i].classList.contains('show'))
            {
                panels[i].classList.toggle('show');
                panels[i].classList.toggle('active');
            }
        }
        
        // Remove active from tab buttons
        var j;
        for (j = 0; j < tabs.length; j++)
        {
            if (tabs[j].classList.contains('active'))
            {
                tabs[j].classList.toggle('active');
            }
        }
        
        // Add active class to current tab button
        item.classList.add('active');
        
        // Target id is data-bs-target
        var target_id = item.getAttribute('data-bs-target');
        
        var panel = document.querySelector(target_id);

        // Toggle show active class on panel
        panel.classList.toggle('show');
        panel.classList.toggle('active');
    });
});