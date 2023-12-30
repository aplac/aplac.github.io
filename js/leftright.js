let touchstartX = 0
let touchendX = 0
let touchstartY = 0
let touchendY = 0


const pages = [];
pages.push(
"bibtex.html",
"index.html",
"confs/drgpa2021.html",
"people/davidBlundell.html",
"people/FuYuwen.html",
"people/jamesMorris.html",
"people/leoChen.html",
"people/lindaGArrigo.html",
"people/mandyTo.html",
"people/oliverStreiter.html",
"people/rogerLi.html",
"people/sunnyChuang.html",
"people/WangChingdong.html",
"people/yaqingZhan.html",
"people/yoannGoudin.html");


if (typeof pagenb === 'undefined') {
   pagenb=1;
   var myDiv = document.getElementById("menudiv");
   url=pages[pagenb];
   url=url.replace('index.html','Main Page');
   myDiv.innerHTML = url + ' &crarr;' ;
}


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
         url=pages[pagenb];
         switch (event.keyCode) {
            case 37:
              if (typeof lurl !== 'undefined') {
                  window.location.href=lurl;
              }
            break;
            case 72:
              if (typeof lurl !== 'undefined') {
                  window.location.href=lurl;
              }
            break;
            case 75:
              if (typeof uurl !== 'undefined') {
                  window.location.href=uurl;
              }
            break;
            case 74:
              if (typeof durl !== 'undefined') {
                  window.location.href=durl;
              }
            break;
            case 39:
              if (typeof rurl !== 'undefined') {
                  window.location.href=rurl;
              }
            break;
            case 76:
              if (typeof rurl !== 'undefined') {
                  window.location.href=rurl;
              }
            break;
            case 13:
              if (typeof url !== 'undefined') {
                  var newurl = window.location.href;
                      newurl = newurl.replace(/github.io.*/,'github.io/'); 
                      newurl = newurl + url;
                  window.location.href = newurl;
              }
            break;
            case 38:
              if (typeof pagenb !== 'undefined') {
                  pagenb = pagenb-1;
              }
            break;
            case 40:
              if (typeof pagenb !== 'undefined') {
                  pagenb = pagenb+1;
              }
            break;

         }
         if (pagenb < 0) {
             pagenb = pages.length;
         }
         if (pagenb > pages.length) {
             pagenb = 0;
         }
         url=pages[pagenb];
         if (typeof url !== 'undefined') {
              myDiv = document.getElementById("menudiv");
              url=url.replace('index.html','Main Page');
              url=url.replace('bibtex.html','Bibliography');
              myDiv.innerHTML = url.replace(/\//,': ').replace('.html','').replace(/([A-Z])/g," $1").replace(/ ([a-z])/,(m,g)=>' ' + g.toUpperCase()) + " &crarr;";
         }

      };

if (typeof lurl !== 'undefined') {
document.write("<div style='border: 2px dotted blue;position:fixed;left:0;bottom:0;opacity:0.4;'>&lt;&lt; " + lurl.replace(/^.*\//,'').replace('.html','').replace(/([A-Z])/g," $1").replace(/(^[a-z])/,(m,g)=>g.toUpperCase()) + "</div>");
}
if (typeof rurl !== 'undefined') {
document.write("<div style='border: 2px dotted blue;text-align:right;position:fixed;right:0;bottom:0;opacity:0.4;'>" + rurl.replace(/^.*\//,'').replace('.html','').replace(/([A-Z])/g," $1").replace(/(^[a-z])/,(m,g)=>g.toUpperCase()) + " &gt;&gt;</div>");
}



