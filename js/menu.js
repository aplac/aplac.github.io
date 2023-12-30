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
   myDiv.innerHTML = url;
}


document.onkeydown = function(event) {
         url=pages[pagenb];
         switch (event.keyCode) {
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
              myDiv.innerHTML = "&lt;&lt; " + url.replace(/^.*\//,'').replace('.html','').replace(/([A-Z])/g," $1").replace(/(^[a-z])/,(m,g)=>g.toUpperCase()) + "&gt;&gt;";
         }
      };

