
let touchstartX = 0
let touchendX = 0
let touchstartY = 0
let touchendY = 0

const pages = [];
pages.push(
"index.html",
"thakbong.html",
"confs/drgt2011.html",
"confs/drgt2015.html",
"confs/drgt2017.html",
"confs/drgpa2019.html",
"confs/drgpa2021.html",
"confs/drgpa2023.html",
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
"people/yoannGoudin.html",
"bibtex.html");

document.write("<div id='menudiv' style='text-align:left; border: 2px dotted blue; position:fixed; left:42%; bottom:0; opacity:0.4;'></div>");

let thispage = window.location.href;
    thispage = thispage.replace(/.*github.io./,'');
let thispagenb = pages.indexOf(thispage);
    menucenter(thispagenb);
if (typeof pagenb === 'undefined') { pagenb=thispagenb }

var prevpg=thispagenb-1;
var nextpg=thispagenb+1;
if (prevpg < 0) { prevpg = pages.length -1; }
if (nextpg === pages.length ) { nextpg = 0; }

var leftlabel  = nicelabel2(pages[prevpg]);
var lurl  = pages[prevpg];
rightlabel  = nicelabel2(pages[nextpg]);
var rurl   = pages[nextpg];


function checkLeftRight() {
  if ((Math.abs(touchendX - touchstartX)) 
      > (Math.abs(touchendY - touchstartY))) {
      if (touchendX+65 
          < touchstartX && typeof lurl !== 'undefined') {
              openurl(lurl) }
      if (touchendX 
          > touchstartX+65 && typeof rurl !== 'undefined') {
              openurl(rurl) }
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
  pagenb=pagenb+1;
  if (pagenb === pages.length) { pagenb = 0 }
})

  //menucenter(pagenb);

document.onkeydown = function(event) {
         url=pages[pagenb];
         switch (event.keyCode) {
            case 37:
              if (typeof lurl !== 'undefined') { openurl(lurl) }
            break;
            case 72:
              if (typeof lurl !== 'undefined') { openurl(lurl) }
            break;
            case 39:
              if (typeof rurl !== 'undefined') { openurl(rurl) }
            break;
            case 76:
              if (typeof rurl !== 'undefined') { openurl(rurl) }
            break;
            case 13:
              if (typeof url !== 'undefined') { openurl(url) }
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
         menucenter(pagenb);
      };


document.write("<br/><br/><br/><br/><br/><br/><br/><div style='border: 2px dotted blue;position:fixed;left:0;bottom:0;opacity:0.4;'><b><a href='" + fullurl(lurl) + "'>&larr; " + leftlabel + "</a></b></div>");

document.write("<div style='border: 2px dotted blue;text-align:right;position:fixed;right:0;bottom:0;opacity:0.4;'><b><a href='" + fullurl(rurl) + "'>" + rightlabel + " &rarr;</a></b></div>");


function menucenter(pagenb) {
              myDiv = document.getElementById("menudiv");
              var url=pages[pagenb];
              var prev=pagenb-1;
              var next=pagenb+1;
              if (prev < 0) { prev = pages.length -1; }
              if (next === pages.length ) { next = 0; }

              var labelprev=nicelabel(pages[prev]);
              var labelnext=nicelabel(pages[next]);

              var newurl = window.location.href;
                  newurl = newurl.replace(/github.io.*/,'github.io/'); 
                  newurl = newurl + url;
              var label = nicelabel(url);
              myDiv.innerHTML = '&uarr; ' +
                                labelprev + 
                                '<br/><a class="inv" href="' + 
                                newurl + 
                                '">&crarr; ' + 
                                label + 
                                '</a><br/>&darr; ' + 
                                labelnext;
         }


function nicelabel2(mylabel) {
    mylabel=mylabel.replace('index.html','Main Page');
    mylabel=mylabel.replace('thakbong.html','Thakbong Project');
    mylabel=mylabel.replace('bibtex.html','Bibliography');
    mylabel=mylabel.replace(/.*\//,'').replace('.html','').replace(/([A-Z])/g," $1").replace(/^([a-z])/,(m,g)=>' ' + g.toUpperCase()) ;
    return mylabel;
}

function nicelabel(mylabel) {
    mylabel=mylabel.replace('index.html','Main Page');
    mylabel=mylabel.replace('thakbong.html','research: Thakbong Project');
    mylabel=mylabel.replace('bibtex.html','Bibliography');
    mylabel=mylabel.replace(/\//,': ').replace('.html','').replace(/([A-Z])/g," $1").replace(/ ([a-z])/,(m,g)=>' ' + g.toUpperCase()) ;
    return mylabel;
}

function openurl(myurl) {
     window.location.href = fullurl(myurl);
}

function fullurl(myurl) {
     var base = window.location.href;
         base = base.replace(/github.io.*/,'github.io/'); 
         return base + myurl;
}

