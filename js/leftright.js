
let touchstartX = 0
let touchendX = 0
let touchstartY = 0
let touchendY = 0

const pages = [];
pages.push(
"index.html",
"bibtex.html",
"thakbong.html",
"archives.html",
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
"people/Ya-QingZhan.html",
"people/yoannGoudin.html");

document.write("<div id='menudiv' style='text-align:left;border:2px dotted blue; position:fixed;left:33%;bottom:0;opacity:0.4;font-size:1.5em;padding:2px'></div>");

let thispage = window.location.href;
    thispage = thispage.replace(/.*github.io./,'');
let thispagenb = pages.indexOf(thispage);
      if ((typeof thispagenb < 0) || (thispage == '')) {
          thispagenb=0;
          thispage='index.html'
      }
      menucenter(thispagenb);
let pagenb=thispagenb;

var prevpg=pageminus(thispagenb);
var nextpg=pageplus(thispagenb);

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

function checkTopDown() {
   if ((Math.abs(touchendX - touchstartX)) 
      < (Math.abs(touchendY - touchstartY))) {
      if (touchendY+10 < touchstartY && typeof pagenb !== 'undefined') {
              pagenb=pageplus(pagenb);
              menucenter(pagenb) }
      if (touchendY > touchstartY+10 && typeof pagenb !== 'undefined') {
              pagenb=pageminus(pagenb);
              menucenter(pagenb) }
      if ((Math.abs(touchendY - touchstartY) < 10)  &&
          (Math.abs(touchendX - touchstartX) < 10)) {
              openurl(pages[pagenb]) }
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
  checkTopDown();
})


document.onkeydown = function(event) {
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
              if (typeof pagenb !== 'undefined') { openurl(pages[pagenb]) }
            break;
            case 38:
              pagenb = pageminus(pagenb);
              menucenter(pagenb);
            break;
            case 40:
              pagenb = pageplus(pagenb);
              menucenter(pagenb);
            break;
         }
      };


document.write("<br/><br/><br/><br/><br/><br/><br/><div style='border:2px dotted blue;position:fixed;left:0;bottom:0;opacity:0.4;font-size:1.5em;padding:2px'><b><a href='" + fullurl(lurl) + "'>&larr; " + leftlabel + "</a></b></div>");

document.write("<div style='border:2px dotted blue;text-align:right;position:fixed;right:0;bottom:0;opacity:0.4;font-size:1.5em;padding:2px'><b><a href='" + fullurl(rurl) + "'>" + rightlabel + " &rarr;</a></b></div>");


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
    mylabel=mylabel.replace('thakbong.html','Thakbong');
    mylabel=mylabel.replace(/.*\//,'').replace('.html','').replace(/([A-Z])/g," $1").replace(/^([a-z])/,(m,g)=>' ' + g.toUpperCase()) ;
    mylabel=mylabel.replace('arachives','Thakbong: Archives');
    mylabel=mylabel.replace('Index','Main Page');
    mylabel=mylabel.replace('bibtex','Bibliography');
    mylabel=mylabel.replace('- ','-');
    return mylabel;
}

function nicelabel(mylabel) {
    mylabel=mylabel.replace('thakbong.html','Thakbong: The Project');
    mylabel=mylabel.replace(/\//,': ').replace('.html','').replace(/([A-Z])/g," $1").replace(/ ([a-z])/,(m,g)=>' ' + g.toUpperCase()) ;
    mylabel=mylabel.replace('index','APLAC: Main Page');
    mylabel=mylabel.replace('bibtex','APLAC: Bibliography');
    mylabel=mylabel.replace('archives','Thakbong: Archives');
    mylabel=mylabel.replace('- ','-');
    return mylabel;
}

function openurl(myurl) {
     window.location.href = fullurl(myurl);
}

function pageplus(mypage) {
   mypage=mypage+1;
   if (mypage === pages.length) { mypage = 0 }
   return mypage;
}
function pageminus(mypage) {
   mypage=mypage-1;
   if (mypage < 0) { mypage = pages.length-1 }
   return mypage;
}

function fullurl(myurl) {
     var base = window.location.href;
         base = base.replace(/github.io.*/,'github.io/'); 
         return base + myurl;
}

