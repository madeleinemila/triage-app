// to create blurred background

const bgBlur = function () {
  const bg = document.getElementsByClassName('container')[0];
  bg.className += ' blur';
  const h = document.getElementsByClassName('main-heading')[0];
  h.className += ' blur';
};



// to shorten placeholder search text on smaller screens
window.onload = function() {
  smallScreenSearchPrompt();
};

window.onresize = function() {
  smallScreenSearchPrompt();
  changeMenuOnResize();
};


const changeMenuOnResize = function() {
  const navItems = document.getElementsByClassName('nav-item');
  for (let i = 0; i < navItems.length; i++) {
    if ( window.innerWidth > 1300 ) {
      navItems[i].style.display = "inline";
    }
    else {
      navItems[i].style.display = "none";
    }
  }
};



const smallScreenSearchPrompt = function() {
  const elem = document.getElementsByClassName('home-field')[0];
  if (elem) {
    if (window.innerWidth < 955) {
      elem.placeholder = "Need help? Search here.";
    }
    else {
      elem.placeholder = "Need help?  You can ask me about an issue or a procedure you need to know.";
    }
  }
  const elemIssue = document.getElementsByClassName('issue-field')[0];
  if (elemIssue) {
    if (window.innerWidth < 955) {
      elemIssue.placeholder = "Search by issue here.";
    }
    else {
      elemIssue.placeholder = "Search by issue. Get links to all possible fixes.";
    }
  }
  const elemFix = document.getElementsByClassName('fix-field')[0];
  if (elemFix) {
    if (window.innerWidth < 955) {
      elemFix.placeholder = "Search by fix here.";
    }
    else {
      elemFix.placeholder = "Search by fix. Get links to step-by-step guides.";
    }
  }
  const elemTech = document.getElementsByClassName('tech-field')[0];
  if (elemTech) {
    if (window.innerWidth < 955) {
      elemTech.placeholder = "Search by tech here.";
    }
    else {
      elemTech.placeholder = "Search by technology. Get links to all related fixes and manuals.";
    }
  }
};
