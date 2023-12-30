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
   var url=pages[pagenb];
   var newurl = window.location.href;
       newurl = newurl.replace(/github.io.*/,'github.io/'); 
       newurl = newurl + url;
   var label=url.replace('index.html','Main Page');
       label=label.replace('bibtex.html','Bibliography');

   myDiv.innerHTML ='<b><a href="' + newurl + '">' + label + ' &crarr;' + '</a></b>';

}


function checkLeftRight() {
  if ((Math.abs(touchendX - touchstartX)) 
      > (Math.abs(touchendY - touchstartY))) {
      if (touchendX+65 
          < touchstartX && typeof lurl !== 'undefined') {
              window.location.href=rurl }
      if (touchendX 
          > touchstartX+65 && typeof rurl !== 'undefined') {
              window.location.href=lurl }
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
            case 39:
              if (typeof rurl !== 'undefined') {
                  window.location.href=rurl;
              }
            break;
            case 76:
              if (typeof rurl !== 'undefined') {
                  var newurl = window.location.href;
                  newurl = newurl.replace(/github.io.*/,'github.io/'); 
                  window.location.href=rurl;
              }
            break;
            case 13:
              if (typeof url !== 'undefined') {
                  var newurl = window.location.href;
                  newurl = newurl.replace(/github.io.*/,'github.io/'); 
                  window.location.href = newurl + url;
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
             pagenb = pages.length-1;
         }
         if (pagenb === pages.length) {
             pagenb = 0;
         }
         url=pages[pagenb];
         if (typeof url !== 'undefined') {
              myDiv = document.getElementById("menudiv");
              var url=pages[pagenb];
              var prev=pagenb-1;
              var next=pagenb+1;

              if (prev < 0) { prev = pages.length -1; }
              if (next === pages.length ) { next = 0; }

              var labelprev=pages[prev];
              var labelnext=pages[next];

                  labelprev=labelprev.replace('index.html','Main Page');
                  labelprev=labelprev.replace('bibtex.html','Bibliography');
                  labelprev = labelprev.replace(/\//,': ').replace('.html','').replace(/([A-Z])/g," $1").replace(/ ([a-z])/,(m,g)=>' ' + g.toUpperCase()) ;
                  labelnext=labelnext.replace('index.html','Main Page');
                  labelnext=labelnext.replace('bibtex.html','Bibliography');
                  labelnext = labelnext.replace(/\//,': ').replace('.html','').replace(/([A-Z])/g," $1").replace(/ ([a-z])/,(m,g)=>' ' + g.toUpperCase()) ;
              var newurl = window.location.href;
                  newurl = newurl.replace(/github.io.*/,'github.io/'); 
                  newurl = newurl + url;
              var label = url;
                  label = label.replace('index.html','Main Page');
                  label = label.replace('bibtex.html','Bibliography');
                  label = label.replace(/\//,': ').replace('.html','').replace(/([A-Z])/g," $1").replace(/ ([a-z])/,(m,g)=>' ' + g.toUpperCase()) ;
              myDiv.innerHTML = labelprev + '<br/><b><a href="' + newurl + '">' + label + ' &crarr;' + '</a></b><br/>' + labelnext;
              //myDiv.innerHTML = '<br/><b><a href="' + newurl + '">' + pagenb + label + ' &crarr;' + '</a></b><br/>';
         }

      };

if (typeof lurl !== 'undefined') {
    var label  = lurl;
document.write("<div style='border: 2px dotted blue;position:fixed;left:0;bottom:0;opacity:0.4;'><b><a href='" + lurl + "'>&lt;&lt; " + label.replace(/^.*\//,'').replace('.html','').replace(/([A-Z])/g," $1").replace(/(^[a-z])/,(m,g)=>g.toUpperCase()) + "</a></b></div>");
}

if (typeof rurl !== 'undefined') {
    var label  = rurl;
document.write("<div style='border: 2px dotted blue;text-align:right;position:fixed;right:0;bottom:0;opacity:0.4;'><b><a href='" + rurl + "'>" + label.replace(/^.*\//,'').replace('.html','').replace(/([A-Z])/g," $1").replace(/(^[a-z])/,(m,g)=>g.toUpperCase()) + " &gt;&gt;</a></b></div>");
}



