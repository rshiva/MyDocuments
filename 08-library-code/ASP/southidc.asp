<%
dim adm_qq,qq,N,myqq

adm_qq="635495"


QQ=split(adm_qq,",")
for N=0 to UBound(QQ)
MyQQ=MyQQ+QQ(N)+":"
next
%>



<script>
var online= new Array();
if (!document.layers)
document.write('<div id="divStayTopLeft" style="position:absolute">')
</script>
<layer id="divStayTopLeft">

<table border="0" width="110" cellspacing="0" cellpadding="0">
<tr><td width="110"><img border=0 src=images/kefu_up.gif></td></tr>
<script src="http://webpresence.qq.com/getonline?Type=1&<%=Myqq%>"></script>

<% for N=0 to UBound(QQ) %>

<tr><td valign=middle  background=images/kefu_middle.gif>
<script>
if (online[<%=n%>]==0)
document.write("&nbsp;&nbsp;<img src=images/QQoffline.gif border=0 align=middle><a class='qqb' target=blank href='http://wpa.qq.com/msgrd?V=1&Uin=<%=QQ(n)%>&Site=在线咨询&Menu=no' title='客服不在线，请留言'><%=QQ(n)%></a>");
else
document.write("&nbsp;&nbsp;<img src=images/QQonline.gif border=0 align=middle><a class='qqa' target=blank href='http://wpa.qq.com/msgrd?V=1&Uin=<%=QQ(n)%>&Site=在线咨询&Menu=no' title='在线即时交谈'><%=QQ(n)%></a>");
</script >
</td></tr>
<%next%>
<tr><td width="110"><img border=0 src=images/kefu_down.gif></td></tr>
</table>
</layer>
<script type="text/javascript">
//Enter "frombottom" or "fromtop"
var verticalpos="frombottom"
if (!document.layers)
document.write('</div>')
function JSFX_FloatTopDiv()
{
	var startX =3,
	startY = 450;
	var ns = (navigator.appName.indexOf("Netscape") != -1);
	var d = document;
	function ml(id)
	{
		var el=d.getElementById?d.getElementById(id):d.all?d.all[id]:d.layers[id];
		if(d.layers)el.style=el;
		el.sP=function(x,y){this.style.left=x;this.style.top=y;};
		el.x = startX;
		if (verticalpos=="fromtop")
		el.y = startY;
		else{
		el.y = ns ? pageYOffset + innerHeight : document.body.scrollTop + document.body.clientHeight;
		el.y -= startY;
		}
		return el;
	}
	window.stayTopLeft=function()
	{
		if (verticalpos=="fromtop"){
		var pY = ns ? pageYOffset : document.body.scrollTop;
		ftlObj.y += (pY + startY - ftlObj.y)/8;
		}
		else{
		var pY = ns ? pageYOffset + innerHeight : document.body.scrollTop + document.body.clientHeight;
		ftlObj.y += (pY - startY - ftlObj.y)/8;
		}
		ftlObj.sP(ftlObj.x, ftlObj.y);
		setTimeout("stayTopLeft()", 10);
	}
	ftlObj = ml("divStayTopLeft");
	stayTopLeft();
}
JSFX_FloatTopDiv();
</script>
