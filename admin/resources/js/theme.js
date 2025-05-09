/**
 * SensorsReport Admin Theme JavaScript
 */

document.addEventListener('DOMContentLoaded', function() {
    // Setup theme preferences
    setupThemePreferences();
    
    // Enhance navigation
    enhanceNavigation();
    
    // Add responsive sidebar toggle
    setupResponsiveSidebar();
});

function setupThemePreferences() {
    // Check for stored theme preference
    const theme = localStorage.getItem('sr-admin-theme') || 'light';
    document.body.classList.toggle('sr-theme-dark', theme === 'dark');
    
    // Add theme toggle button
    const header = document.querySelector('.navbar-utility');
    if (header) {
        const themeToggle = document.createElement('li');
        themeToggle.innerHTML = `
            <a href="#" id="theme-toggle" aria-label="Toggle dark mode">
                <i class="fa ${theme === 'dark' ? 'fa-sun' : 'fa-moon'}"></i>
            </a>
        `;
        header.insertBefore(themeToggle, header.firstChild);
        
        // Handle theme toggle
        document.getElementById('theme-toggle').addEventListener('click', function(e) {
            e.preventDefault();
            const isDark = document.body.classList.toggle('sr-theme-dark');
            localStorage.setItem('sr-admin-theme', isDark ? 'dark' : 'light');
            this.querySelector('i').className = `fa ${isDark ? 'fa-sun' : 'fa-moon'}`;
            
            // Add transition effect
            const content = document.querySelector('.content-area');
            if (content) {
                content.style.opacity = '0.8';
                setTimeout(() => {
                    content.style.opacity = '1';
                }, 200);
            }
        });
    }
}

function enhanceNavigation() {
    // Add active state and icon to navigation items
    const navItems = document.querySelectorAll('.bs-sidebar li a');
    const icons = {
        'realms': 'fa-globe',
        'users': 'fa-users',
        'groups': 'fa-user-group',
        'roles': 'fa-user-shield',
        'clients': 'fa-desktop',
        'identity-providers': 'fa-key'
    };
    
    navItems.forEach(link => {
        // Add icons to nav items
        for (const [key, icon] of Object.entries(icons)) {
            if (link.getAttribute('href').includes(key)) {
                link.innerHTML = `<i class="fa ${icon}"></i> ${link.textContent}`;
                break;
            }
        }
        
        // Add active state based on current path
        if (window.location.pathname.includes(link.getAttribute('href'))) {
            link.parentElement.classList.add('active');
        }
        
        // Add hover animation
        link.addEventListener('mouseenter', function() {
            this.style.transform = 'translateX(3px)';
        });
        
        link.addEventListener('mouseleave', function() {
            this.style.transform = 'translateX(0)';
        });
    });
}

function setupResponsiveSidebar() {
    // Create mobile toggle button
    const navbar = document.querySelector('.navbar-header');
    const sidebar = document.querySelector('.bs-sidebar');
    
    if (navbar && sidebar) {
        const toggleBtn = document.createElement('button');
        toggleBtn.className = 'sr-sidebar-toggle';
        toggleBtn.setAttribute('aria-label', 'Toggle navigation sidebar');
        toggleBtn.innerHTML = '<i class="fa fa-bars"></i>';
        
        navbar.appendChild(toggleBtn);
        
        // Toggle sidebar on mobile
        toggleBtn.addEventListener('click', function() {
            sidebar.classList.toggle('show');
            this.classList.toggle('active');
        });
        
        // Close sidebar when clicking outside
        document.addEventListener('click', function(e) {
            if (!sidebar.contains(e.target) && !toggleBtn.contains(e.target)) {
                sidebar.classList.remove('show');
                toggleBtn.classList.remove('active');
            }
        });
        
        // Add slide animation class
        sidebar.classList.add('sr-sidebar-animated');
    }
}