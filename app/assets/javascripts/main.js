// to create blurred background

const bgBlur = function () {
  const bg = document.getElementsByClassName('container')[0];
  bg.className += ' blur';
  const h = document.getElementsByClassName('main-heading')[0];
  h.className += ' blur';
};
