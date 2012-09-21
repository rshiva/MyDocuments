document.ns = navigator.appName == "Netscape"
window.screen.width>800 ? imgheight=300:imgheight=250
window.screen.width>800 ? imgright=15:imgright=20
function threenineload()
{
if (navigator.appName == "Netscape")
{document.threenine.pageY=pageYOffset+window.innerHeight-imgheight;
document.threenine.pageX=imgright;
threeninemove();
}
else
{
threenine.style.top=document.body.scrollTop+document.body.offsetHeight-imgheight;
threenine.style.right=imgright;
threeninemove();
}
}
function threeninemove()
{
if(document.ns)
{
document.threenine.top=pageYOffset+window.innerHeight-imgheight
document.threenine.right=imgright;
setTimeout("threeninemove();",80)
}
else
{
threenine.style.top=document.body.scrollTop+document.body.offsetHeight-imgheight;
threenine.style.right=imgright;
setTimeout("threeninemove();",80)
}
}

function MM_reloadPage(init) { //reloads the window if Nav4 resized
if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true)


if (navigator.appName == "Netscape")
{document.write("<layer id=threenine top=100 width=90 height=90><a href=http://www.southidc.net target=_blank><img src=Img/0791idcad.gif  border=0 WIDTH=90 HEIGHT=90></a></layer>");
threenineload()}
else
{
document.write("<div id=threenine style='position: absolute;width:80;top:4000;;right:2;visibility: visible;z-index:1'><a href=http://www.southidc.net target=_blank><img src=Img/0791idcad.gif border=0 WIDTH=90 HEIGHT=90></a></div>");
threenineload()
}