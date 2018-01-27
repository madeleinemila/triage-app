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
};



const smallScreenSearchPrompt = function() {
  const elem = document.getElementById('term');
  if (window.innerWidth < 955) {
    elem.placeholder = "Need help? Search here.";
  } else {
    elem.placeholder = "Need help?  You can ask me about an issue or a procedure you need to know.";
  }
};
