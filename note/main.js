
(function() {
    // Init
     const toggleButton = document.querySelector(' #module > button');
     const currentTheme = localstorage.getItem('theme');
     if (currentTheme) {
       document.documentElement.setAttribute('data-theme', currentTheme);
       if (currentTheme === 'dark') {
           toggleButton.setAttribute('class', 'moon');
       }
     }
    function switchTheme() {
       const theme = localstorage.getItem('theme') === 'dark' ? 'light' : 'dark';
       const icon = theme === 'dark' ? 'moon' : 'sun';
       document.documentElement.setAttribute('data-theme', theme);
       localStorage.setItem('theme', theme);
     }
    toggleButton.addEventListener('click', switchTheme, false);
   })();