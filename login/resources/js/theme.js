/**
 * SensorsReport theme custom JavaScript
 * This file contains enhancements for the login and registration experience
 */

// Apply enhancements when page loads
document.addEventListener('DOMContentLoaded', function() {
  // Add animation to form elements
  animateFormElements();
  
  // Add password visibility toggle
  setupPasswordVisibility();
  
  // Add input field focus effects
  enhanceInputFields();
  
  // Handle registration page specific logic
  enhanceRegistrationForm();
  
  // Setup language flag selector
  setupLanguageFlagSelector();
  
  // Setup theme toggle (light/dark mode)
  setupThemeToggle();
  
  // Enhance the language dropdown
  enhanceLanguageSelector();

  // Set rotating background with transition effects
  setupRotatingBackground();
  
  // Setup development mode force refresh (remove in production)
  setupDevModeRefresh();
});

// Background configuration - images are kept for reference
const backgrounds = [
  '/resources/rwm2c/login/sensorsreport/img/pharmaceutical-warehouse.jpg', // Absolute path
  '/resources/rwm2c/login/sensorsreport/img/pharmaceutical-warehouse-02.jpg', // Absolute path
  '/resources/rwm2c/login/sensorsreport/img/pharmaceutical-warehouse-03.jpg', // Absolute path
  '/resources/rwm2c/login/sensorsreport/img/pharmaceutical-warehouse-04.jpg', // Absolute path
  '/resources/rwm2c/login/sensorsreport/img/food-wine-warehouse.jpg', // Absolute path
  '/resources/rwm2c/login/sensorsreport/img/food-wine-warehouse-02.jpg', // Absolute path
  '/resources/rwm2c/login/sensorsreport/img/food-wine-warehouse-03.jpg', // Absolute path
  '/resources/rwm2c/login/sensorsreport/img/meat-fish-warehouse.jpg', // Absolute path
  '/resources/rwm2c/login/sensorsreport/img/meat-fish-warehouse-02.jpg', // Absolute path
  '/resources/rwm2c/login/sensorsreport/img/meat-fish-warehouse-04.jpg' // Absolute path
];

/**
 * Sets up rotating background images with smooth crossfade transition effects
 */
function setupRotatingBackground() {
  const bgElement = document.getElementById('keycloak-bg');
  if (!bgElement) return;

  let currentIndex = 0;
  let nextIndex = 1;
  
  // Set initial background image
  bgElement.style.backgroundImage = `url('${backgrounds[currentIndex]}')`;
  
  // Create image preloader to ensure smooth transitions
  function preloadImages() {
    backgrounds.forEach(url => {
      const img = new Image();
      img.src = url;
    });
  }
  
  // Start preloading images
  preloadImages();
  
  // Function to perform the crossfade transition
  function rotateBackground() {
    // Set the next background image to the ::after pseudo-element
    bgElement.style.setProperty('--next-bg-image', `url('${backgrounds[nextIndex]}')`);
    
    // Add the transition class to trigger the crossfade
    bgElement.classList.add('bg-transition');
    
    // After the transition completes, set the main background to the next image
    // and reset for the next transition
    setTimeout(() => {
      bgElement.style.backgroundImage = `url('${backgrounds[nextIndex]}')`;
      bgElement.classList.remove('bg-transition');
      
      // Update indices for next rotation
      currentIndex = nextIndex;
      nextIndex = (nextIndex + 1) % backgrounds.length;
    }, 1500); // Match this duration with the CSS transition duration
  }
  
  // Add CSS transition styles for the crossfade effect
  const style = document.createElement('style');
  style.textContent = `
    #keycloak-bg {
      background-size: cover;
      background-position: center;
      transition: background-image 1.5s ease-in-out;
    }
    #keycloak-bg::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-image: var(--next-bg-image);
      background-size: cover;
      background-position: center;
      opacity: 0;
      z-index: 1;
      transition: opacity 1.5s ease-in-out;
    }
    #keycloak-bg.bg-transition::after {
      opacity: 1;
    }
  `;
  document.head.appendChild(style);
  
  // Start rotation interval (change background every 10 seconds)
  setInterval(rotateBackground, 10000);
}

/**
 * Applies subtle entrance animations to form elements
 */
function animateFormElements() {
  const formWrapper = document.querySelector('.sensors-report-form-wrapper');
  
  if (formWrapper) {
    // Add animation classes
    formWrapper.style.opacity = '0';
    formWrapper.style.transform = 'translateY(10px)';
    formWrapper.style.transition = 'opacity 0.4s ease, transform 0.4s ease';
    
    // Trigger animation after a small delay
    setTimeout(() => {
      formWrapper.style.opacity = '1';
      formWrapper.style.transform = 'translateY(0)';
    }, 100);
  }
  
  // Animate form fields with sequential timing
  const formElements = document.querySelectorAll('.pf-v5-c-form__group, .sensors-report-form-header, #kc-form-buttons');
  if (formElements.length) {
    formElements.forEach((element, index) => {
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
}

/**
 * Sets up password visibility toggle functionality for login and registration
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
 * Enhances input fields with focus effects
 */
function enhanceInputFields() {
  const inputFields = document.querySelectorAll('.pf-v5-c-form-control');
  
  if (inputFields.length) {
    inputFields.forEach(input => {
      // Add focus/blur events for enhanced styling
      input.addEventListener('focus', function() {
        this.parentNode.classList.add('input-focused');
      });
      
      input.addEventListener('blur', function() {
        this.parentNode.classList.remove('input-focused');
      });
      
      // Check if field has value on page load
      if (input.value) {
        input.parentNode.classList.add('input-has-value');
      }
      
      // Update has-value class on input
      input.addEventListener('input', function() {
        if (this.value) {
          this.parentNode.classList.add('input-has-value');
        } else {
          this.parentNode.classList.remove('input-has-value');
        }
      });
    });
  }
}

/**
 * Specific enhancements for the registration form
 */
function enhanceRegistrationForm() {
  const registerForm = document.getElementById('kc-register-form');
  
  if (registerForm) {
    // Add password matching validation
    const password = document.getElementById('password');
    const passwordConfirm = document.getElementById('password-confirm');
    
    if (password && passwordConfirm) {
      // Real-time password match validation
      passwordConfirm.addEventListener('input', function() {
        if (password.value !== passwordConfirm.value) {
          passwordConfirm.parentNode.classList.add('password-mismatch');
        } else {
          passwordConfirm.parentNode.classList.remove('password-mismatch');
        }
      });
      
      // Also validate when changing the first password
      password.addEventListener('input', function() {
        if (passwordConfirm.value && password.value !== passwordConfirm.value) {
          passwordConfirm.parentNode.classList.add('password-mismatch');
        } else if (passwordConfirm.value && password.value === passwordConfirm.value) {
          passwordConfirm.parentNode.classList.remove('password-mismatch');
        }
      });
    }
  }
}

/**
 * Sets up the language flag selector functionality
 */
function setupLanguageFlagSelector() {
  // Try to find the language selector by multiple potential IDs
  const languageSelector = document.getElementById('login-select-toggle') || 
                           document.getElementById('kc-locale-dropdown') ||
                           document.getElementById('kc-current-locale-link') ||
                           document.querySelector('select[name="locale"]');
  
  if (languageSelector) {
    // For dropdown select elements
    if (languageSelector.tagName === 'SELECT') {
      // Force the proper display of flag backgrounds by adding inline styles
      const selectedOption = languageSelector.options[languageSelector.selectedIndex];
      if (selectedOption && selectedOption.getAttribute('data-flag')) {
        const selectedLanguage = selectedOption.getAttribute('data-flag');
        // Set both class and explicit inline background for maximum compatibility
        languageSelector.className = `${languageSelector.className.replace(/flag-[a-z]{2}/g, '')} flag-${selectedLanguage}`;
        languageSelector.style.backgroundImage = `url('../img/flags/${selectedLanguage}.png')`;
        languageSelector.style.backgroundPosition = '10px center';
        languageSelector.style.backgroundRepeat = 'no-repeat';
        languageSelector.style.backgroundSize = '18px auto';
      } else {
        // If data-flag attribute is not present, try to infer from the value or text
        const langCode = (selectedOption.value || selectedOption.text || '').match(/[a-z]{2}/i)?.[0].toLowerCase();
        if (langCode) {
          languageSelector.className = `${languageSelector.className.replace(/flag-[a-z]{2}/g, '')} flag-${langCode}`;
          languageSelector.style.backgroundImage = `url('../img/flags/${langCode}.png')`;
          languageSelector.style.backgroundPosition = '10px center';
          languageSelector.style.backgroundRepeat = 'no-repeat';
          languageSelector.style.backgroundSize = '18px auto';
        }
      }
      
      // Update flag when changing language
      languageSelector.addEventListener('change', function() {
        const selectedOption = this.options[this.selectedIndex];
        let langCode = '';
        
        if (selectedOption && selectedOption.getAttribute('data-flag')) {
          langCode = selectedOption.getAttribute('data-flag');
        } else {
          // Try to extract language code from URL or text
          const urlMatch = selectedOption.value.match(/locale=([a-z]{2})/i);
          if (urlMatch && urlMatch[1]) {
            langCode = urlMatch[1].toLowerCase();
          } else {
            langCode = (selectedOption.textContent || '').match(/[a-z]{2}/i)?.[0].toLowerCase();
          }
        }
        
        if (langCode) {
          this.className = `${this.className.replace(/flag-[a-z]{2}/g, '')} flag-${langCode}`;
          this.style.backgroundImage = `url('../img/flags/${langCode}.png')`;
          this.style.backgroundPosition = '10px center';
          this.style.backgroundRepeat = 'no-repeat';
          this.style.backgroundSize = '18px auto';
        }
      });
    } 
    // For button/link elements (in case the language selector is not a dropdown)
    else if (languageSelector.tagName === 'BUTTON' || languageSelector.tagName === 'A') {
      // Extract language code from the text content
      const langCode = (languageSelector.textContent || '').substring(0, 2).toLowerCase();
      if (langCode) {
        languageSelector.className = `${languageSelector.className.replace(/flag-[a-z]{2}/g, '')} flag-${langCode}`;
        
        // Apply background image style
        languageSelector.style.backgroundImage = `url('../img/flags/${langCode}.png')`;
        languageSelector.style.backgroundPosition = 'left center';
        languageSelector.style.backgroundRepeat = 'no-repeat';
        languageSelector.style.backgroundSize = '20px';
        languageSelector.style.paddingLeft = '28px';
      }
    }
  }
  
  // Also handle the dropdown menu items if present
  const languageItems = document.querySelectorAll('#language-switch1 a, .kc-dropdown-item');
  if (languageItems.length) {
    languageItems.forEach(item => {
      // Extract language code from href or text
      let langCode = '';
      if (item.getAttribute('href')) {
        // Extract from URL (e.g., ?kc_locale=en)
        const hrefMatch = item.getAttribute('href').match(/locale=([a-z]{2})/i);
        if (hrefMatch && hrefMatch[1]) {
          langCode = hrefMatch[1].toLowerCase();
        }
      }
      
      // If no match from href, try text content
      if (!langCode) {
        langCode = (item.textContent || '').substring(0, 2).toLowerCase();
      }
      
      if (langCode) {
        // Add flag icon
        item.className = `${item.className.replace(/flag-[a-z]{2}/g, '')} flag-${langCode}`;
        item.style.backgroundImage = `url('../img/flags/${langCode}.png')`;
        item.style.backgroundPosition = '8px center';
        item.style.backgroundRepeat = 'no-repeat';
        item.style.backgroundSize = '20px';
        item.style.paddingLeft = '36px';
      }
    });
  }
}

/**
 * Enhances the language dropdown to display flags properly
 */
function enhanceLanguageSelector() {
  const selectElement = document.getElementById('login-select-toggle');
  if (!selectElement) return;
  
  // Get the parent container
  const parentContainer = selectElement.closest('.language-selector-container');
  if (!parentContainer) return;
  
  // Create custom dropdown elements
  const customSelect = document.createElement('div');
  customSelect.className = 'custom-language-select';
  
  // Create the selected option display
  const selectedOption = document.createElement('div');
  selectedOption.className = 'selected-language';
  const currentFlag = selectElement.className.split(' ').find(cls => cls.startsWith('flag-'));
  selectedOption.classList.add(currentFlag || 'flag-en');
  
  // Find the selected option's text
  const selectedOptionText = Array.from(selectElement.options)
    .find(option => option.selected)?.textContent || '';
  
  selectedOption.innerHTML = `<span>${selectedOptionText}</span>`;
  customSelect.appendChild(selectedOption);
  
  // Create dropdown container for options
  const dropdownOptions = document.createElement('div');
  dropdownOptions.className = 'language-dropdown-options';
  
  // Populate with options
  Array.from(selectElement.options).forEach(option => {
    const flagClass = option.getAttribute('data-flag');
    const customOption = document.createElement('a');
    customOption.className = `language-option flag-${flagClass}`;
    customOption.href = option.value;
    customOption.innerHTML = `<span>${option.textContent}</span>`;
    dropdownOptions.appendChild(customOption);
  });
  
  customSelect.appendChild(dropdownOptions);
  
  // Add toggle functionality
  selectedOption.addEventListener('click', function(e) {
    e.preventDefault();
    customSelect.classList.toggle('open');
  });
  
  // Close dropdown when clicking outside
  document.addEventListener('click', function(e) {
    if (!customSelect.contains(e.target)) {
      customSelect.classList.remove('open');
    }
  });
  
  // Hide the original select element
  selectElement.style.display = 'none';
  
  // Insert the custom dropdown
  parentContainer.appendChild(customSelect);
}

/**
 * Sets up theme toggle functionality (light/dark mode)
 */
function setupThemeToggle() {
  // Create the theme toggle button if it doesn't exist
  let themeToggle = document.querySelector('.sr-theme-toggle');
  
  if (!themeToggle) {
    themeToggle = document.createElement('button');
    themeToggle.className = 'sr-theme-toggle';
    themeToggle.setAttribute('aria-label', 'Toggle light/dark theme');
    themeToggle.innerHTML = '<i class="fa fa-moon"></i>';
    
    // Find the header controls container to insert the toggle
    const headerControls = document.querySelector('.sr-header-controls');
    if (headerControls) {
      // Add the theme toggle as the first child of the header controls
      if (headerControls.firstChild) {
        headerControls.insertBefore(themeToggle, headerControls.firstChild);
      } else {
        headerControls.appendChild(themeToggle);
      }
    } else {
      // Fallback to the header if controls container not found
      const header = document.querySelector('.sr-login-header');
      if (header) {
        header.appendChild(themeToggle);
      } else {
        // Last resort fallback
        document.body.appendChild(themeToggle);
      }
    }
  }
  
  // Check for stored theme preference
  const currentTheme = localStorage.getItem('sr-theme') || 'light';
  
  // Apply the saved theme
  if (currentTheme === 'dark') {
    document.body.classList.add('pf-v5-theme-dark');
    themeToggle.innerHTML = '<i class="fa fa-sun"></i>';
  } else {
    document.body.classList.remove('pf-v5-theme-dark');
    themeToggle.innerHTML = '<i class="fa fa-moon"></i>';
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
    const pageContent = document.querySelector('.pf-v5-c-login__main');
    if (pageContent) {
      pageContent.style.opacity = '0.8';
      setTimeout(() => {
        pageContent.style.opacity = '1';
      }, 200);
    }
  });
}

/**
 * Development helper function to force page refresh during theme development
 * This should be removed in production environments
 */
function setupDevModeRefresh() {
  // Only enable in development environments
  const isDevelopment = true; // Set to false for production
  
  if (isDevelopment) {
    // Store a timestamp in localStorage
    const lastLoadTime = Date.now();
    localStorage.setItem('kc_theme_last_load', lastLoadTime);
    
    // Check every 10 seconds if we need to reload
    setInterval(() => {
      const currentVersion = localStorage.getItem('kc_theme_version') || '1.0';
      const newVersion = '1.1'; // Increment this when you want to force a refresh
      
      if (currentVersion !== newVersion) {
        localStorage.setItem('kc_theme_version', newVersion);
        window.location.reload();
      }
    }, 10000);
  }
}