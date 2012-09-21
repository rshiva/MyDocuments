
<!--
document.ns = navigator.appName == "Netscape"
window.screen.width>800 ? imgheight=200:imgheight=200
window.screen.width>800 ? imgleft1=1009:imgleft1=720
function carshopload()
{
if (navigator.appName == "Netscape")
{document.carshop.pageY=pageYOffset+window.innerHeight-imgheight;
document.carshop.pageX=pageXOffset+window.innerWidth-imgleft1;
carshopmove();
}
else
{
carshop.style.top=document.body.scrollTop+document.body.offsetHeight-imgheight;
carshop.style.left=document.body.offsetWidth-imgleft1;
carshop2.style.top=document.body.scrollTop+document.body.offsetHeight-imgheight-200;
carshop2.style.left=document.body.offsetWidth-imgleft1;
carshopmove();
}
}
function carshopmove()
{
if(document.ns)
{
document.carshop.top=pageYOffset+window.innerHeight-imgheight
document.carshop.left=pageXOffset+window.innerWidth-imgleft1;
setTimeout("carshopmove();",80)
}
else
{
carshop.style.top=document.body.scrollTop+document.body.offsetHeight-imgheight;
carshop.style.left=document.body.offsetWidth-imgleft1;
carshop2.style.top=document.body.scrollTop+document.body.offsetHeight-imgheight-200;
carshop2.style.left=document.body.offsetWidth-imgleft1;
setTimeout("carshopmove();",80)
}
}

function MM_reloadPage(init) { //reloads the window if Nav4 resized
if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true)

if (navigator.appName == "Netscape")
{document.write("<layer id=carshop top=200 width=90 height=90><a href=http://www.southidc.net target=_blank><img src=Img/0791idcad.gif  border=0></a></layer>")
carshopload()}
else
{
document.write("<div id=carshop style='position: absolute;width:90;height:90;top:200;hidden: visible;z-index: 1'><a href=http://www.southidc.net target=_blank><img src=Img/0791idcad.gif border=0></a></div>"
+"<div id=carshop2 style='position: absolute;visibility: hidden;z-index: 10'><img src=Img/0791idcad.gif ></div>");
carshopload()
}
// -->