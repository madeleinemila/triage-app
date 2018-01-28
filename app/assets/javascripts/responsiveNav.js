// let navCount;
// let navItems, hamburger;
//

document.addEventListener('turbolinks:load', function() {
  const hamburger = document.getElementById('hamburger');
  let navCount = 0;
  const navItems = document.getElementsByClassName('nav-item');
  hamburger.addEventListener('click', function() {
    if (navCount % 2 === 0) {
      for (let i = 0; i < navItems.length; i++) {
        navItems[i].style.display = 'block';
      }
      hamburger.textContent = '×';
      navCount++;
    } else {
      for (let i = 0; i < navItems.length; i++) {
        navItems[i].style.display = 'none';
      }
      hamburger.textContent = '☰';
      navCount++;
    }
  });
});
