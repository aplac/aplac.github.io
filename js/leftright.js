let touchstartX = 0
let touchendX = 0
let touchstartY = 0
let touchendY = 0

function checkLeftRight() {
  if ((Math.abs(touchendX - touchstartX)) 
      > (Math.abs(touchendY - touchstartY))) {
      if (touchendX+65 
          < touchstartX && typeof lurl !== 'undefined') {
              window.location.href=lurl }
      if (touchendX 
          > touchstartX+65 && typeof rurl !== 'undefined') {
              window.location.href=rurl }
  }
}

document.addEventListener('touchstart', e => {
  touchstartX = e.changedTouches[0].screenX;
  touchstartY = e.changedTouches[0].screenY;
})

document.addEventListener('touchend', e => {
  touchendX = e.changedTouches[0].screenX;
  touchendY = e.changedTouches[0].screenY;
  checkLeftRight();
})

document.onkeydown = function(event) {
         switch (event.keyCode) {
            case 37:
              if (typeof lurl !== 'undefined') {
                  window.location.href=lurl;
              }
            break;
            case 38:
              if (typeof uurl !== 'undefined') {
                  window.location.href=uurl;
              }
            break;
            case 39:
              if (typeof rurl !== 'undefined') {
                  window.location.href=rurl;
              }
            break;
         }
      };
