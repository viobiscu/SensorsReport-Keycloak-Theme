/**
 * SensorsReport Account theme custom JavaScript
 * This file contains enhancements for the account management experience
 * Consistent with the login theme animations and interactions
 */

// Apply enhancements when page loads
document.addEventListener('DOMContentLoaded', function() {
  // Add animation to account elements
  animateAccountElements();
  
  // Enhance input fields with focus effects
  enhanceInputFields();
  
  // Setup interactive cards for account sections
  setupInteractiveCards();
  
  // Add password visibility toggle to password fields
  setupPasswordVisibility();
  
  // Setup theme toggle functionality
  setupThemeToggle();
});

/**
 * Applies subtle entrance animations to account elements
 */
function animateAccountElements() {
  // Animate header elements
  const header = document.querySelector('.sr-account-header');
  if (header) {
    header.style.opacity = '0';
    header.style.transform = 'translateY(10px)';
    header.style.transition = 'opacity 0.4s ease, transform 0.4s ease';
    
    // Trigger animation after a small delay
    setTimeout(() => {
      header.style.opacity = '1';
      header.style.transform = 'translateY(0)';
    }, 100);
  }
  
  // Animate card elements with sequential timing
  const accountSections = document.querySelectorAll('.sr-account-section, .sr-account-card, .sr-account-welcome');
  if (accountSections.length) {
    accountSections.forEach((element, index) => {
      element.style.opacity = '0';
      element.style.transform = 'translateY(10px)';
      element.style.transition = 'opacity 0.4s ease, transform 0.4s ease';
      
      // Stagger the animations
      setTimeout(() => {
        element.style.opacity = '1';
        element.style.transform = 'translateY(0)';
      }, 150 + (index * 75));
    });
  }
  
  // Animate form elements if present
  const formElements = document.querySelectorAll('.pf-v5-c-form__group, .pf-v5-c-button');
  if (formElements.length) {
    formElements.forEach((element, index) => {
      element.style.opacity = '0';
      element.style.transform = 'translateY(10px)';
      element.style.transition = 'opacity 0.4s ease, transform 0.4s ease';
      
      // Stagger the animations
      setTimeout(() => {
        element.style.opacity = '1';
        element.style.transform = 'translateY(0)';
      }, 200 + (index * 50));
    });
  }
}

/**
 * Enhances input fields with focus effects
 */
function enhanceInputFields() {
  const inputFields = document.querySelectorAll('.pf-v5-c-form-control, input, textarea, select');
  
  if (inputFields.length) {
    inputFields.forEach(input => {
      // Add focus/blur events for enhanced styling
      input.addEventListener('focus', function() {
        this.closest('.pf-v5-c-form__group-control') && 
          this.closest('.pf-v5-c-form__group-control').classList.add('input-focused');
        this.parentNode.classList.add('input-focused');
      });
      
      input.addEventListener('blur', function() {
        this.closest('.pf-v5-c-form__group-control') && 
          this.closest('.pf-v5-c-form__group-control').classList.remove('input-focused');
        this.parentNode.classList.remove('input-focused');
      });
      
      // Check if field has value on page load
      if (input.value) {
        this.closest('.pf-v5-c-form__group-control') && 
          this.closest('.pf-v5-c-form__group-control').classList.add('input-has-value');
        input.parentNode.classList.add('input-has-value');
      }
      
      // Update has-value class on input
      input.addEventListener('input', function() {
        if (this.value) {
          this.closest('.pf-v5-c-form__group-control') && 
            this.closest('.pf-v5-c-form__group-control').classList.add('input-has-value');
          this.parentNode.classList.add('input-has-value');
        } else {
          this.closest('.pf-v5-c-form__group-control') && 
            this.closest('.pf-v5-c-form__group-control').classList.remove('input-has-value');
          this.parentNode.classList.remove('input-has-value');
        }
      });
    });
  }
}

/**
 * Sets up interactive hover effects for account section cards
 */
function setupInteractiveCards() {
  const cards = document.querySelectorAll('.sr-account-section');
  
  if (cards.length) {
    cards.forEach(card => {
      // Add hover effects with subtle animation
      card.addEventListener('mouseenter', function() {
        this.style.transform = 'translateY(-4px)';
        this.style.boxShadow = '0 8px 16px rgba(0, 0, 0, 0.12)';
      });
      
      card.addEventListener('mouseleave', function() {
        this.style.transform = 'translateY(0)';
        this.style.boxShadow = '0 4px 8px rgba(0, 0, 0, 0.08)';
      });
      
      // Add click ripple effect
      card.addEventListener('click', function(e) {
        // Only apply effect if clicking on the card itself, not on buttons or links
        if (e.target === this || e.target.closest('.sr-account-section-content')) {
          const ripple = document.createElement('div');
          ripple.className = 'ripple-effect';
          
          // Position the ripple at click coordinates
          const rect = this.getBoundingClientRect();
          const x = e.clientX - rect.left;
          const y = e.clientY - rect.top;
          
          ripple.style.left = x + 'px';
          ripple.style.top = y + 'px';
          
          this.appendChild(ripple);
          
          // Remove ripple after animation completes
          setTimeout(() => {
            ripple.remove();
          }, 800);
        }
      });
    });
  }
}

/**
 * Sets up password visibility toggle functionality for password fields
 */
function setupPasswordVisibility() {
  // Handle all password fields
  const passwordFields = document.querySelectorAll('input[type="password"]');
  
  if (passwordFields.length) {
    passwordFields.forEach(field => {
      // Create password toggle button
      const toggleButton = document.createElement('button');
      toggleButton.type = 'button';
      toggleButton.className = 'password-toggle-btn';
      toggleButton.setAttribute('aria-label', 'Toggle password visibility');
      toggleButton.innerHTML = '<i class="fa fa-eye"></i>';
      
      // Insert toggle button after password field
      field.parentNode.style.position = 'relative';
      field.parentNode.appendChild(toggleButton);
      
      // Toggle password visibility
      toggleButton.addEventListener('click', function() {
        const type = field.getAttribute('type') === 'password' ? 'text' : 'password';
        field.setAttribute('type', type);
        
        // Toggle icon
        this.innerHTML = type === 'password' ? '<i class="fa fa-eye"></i>' : '<i class="fa fa-eye-slash"></i>';
      });
    });
  }
}

/**
 * Sets up theme toggle functionality (light/dark mode)
 */
function setupThemeToggle() {
  // Check for existing theme toggle button
  let themeToggle = document.querySelector('.sr-theme-toggle');
  
  // If no toggle exists, create one
  if (!themeToggle) {
    themeToggle = document.createElement('button');
    themeToggle.className = 'sr-theme-toggle';
    themeToggle.setAttribute('aria-label', 'Toggle light/dark theme');
    themeToggle.innerHTML = '<i class="fa fa-moon"></i>';
    
    // Append to header or another appropriate location
    const header = document.querySelector('.sr-account-header');
    if (header) {
      header.appendChild(themeToggle);
    } else {
      // Fallback to appending to body with fixed positioning
      document.body.appendChild(themeToggle);
      themeToggle.style.position = 'fixed';
      themeToggle.style.top = '1rem';
      themeToggle.style.right = '1rem';
      themeToggle.style.zIndex = '1000';
    }
  }
  
  // Check for stored theme preference
  const currentTheme = localStorage.getItem('sr-theme') || 'light';
  if (currentTheme === 'dark') {
    document.body.classList.add('pf-v5-theme-dark');
    themeToggle.innerHTML = '<i class="fa fa-sun"></i>';
  }
  
  // Toggle theme on click
  themeToggle.addEventListener('click', function() {
    const isDark = document.body.classList.contains('pf-v5-theme-dark');
    
    if (isDark) {
      document.body.classList.remove('pf-v5-theme-dark');
      localStorage.setItem('sr-theme', 'light');
      this.innerHTML = '<i class="fa fa-moon"></i>';
    } else {
      document.body.classList.add('pf-v5-theme-dark');
      localStorage.setItem('sr-theme', 'dark');
      this.innerHTML = '<i class="fa fa-sun"></i>';
    }
    
    // Add subtle page transition
    const pageContent = document.querySelector('#sr-account-container');
    if (pageContent) {
      pageContent.style.opacity = '0.8';
      setTimeout(() => {
        pageContent.style.opacity = '1';
      }, 200);
    }
  });
}