<%
Set rssetup=conn.execute("select * from dm_mp3") 
kaiguan=rssetup("kaiguan")
guanbi=rssetup("guanbi")
skin="skin"&rssetup("skin")
loginskin=rssetup("loginskin")
yzm_skin=rssetup("yzm_skin")
bodyfixed=rssetup("bodyfixed")
sitekeywords=rssetup("sitekeywords")
sitedescription=rssetup("sitedescription")
sitename=rssetup("sitename")
siteurl=rssetup("siteurl")
adm_mail= rssetup("adm_mail")
adm_kf= rssetup("adm_kf")
kf_color= rssetup("kf_color")
newsmove=rssetup("newsmove")
news_skin=rssetup("news_skin")
type1=rssetup("usertype1")
type2=rssetup("usertype2")
type3=rssetup("usertype3")
type4=rssetup("usertype4")
type5=rssetup("usertype5")
type6=rssetup("usertype6")
kou1=rssetup("kou1")
kou2=rssetup("kou2")
kou3=rssetup("kou3")
kou4=rssetup("kou4")
kou5=rssetup("kou5")
kou6=rssetup("kou6")
mosi=rssetup("mosi")
pic_xiaogao=rssetup("pic_xiaogao")
lar_color=rssetup("lar_color")		'大类颜色
mid_color=rssetup("mid_color")		'中类颜色
tree_num=rssetup("tree_num")
tree_view=rssetup("tree_view")
tree_display=rssetup("tree_display")
index_tishi=rssetup("index_tishi")
quehuo=rssetup("quehuo")
wujiage=rssetup("wujiage")
huiyuanjia=rssetup("huiyuanjia")
prompt_num= rssetup("prompt_num")
newprod_num= rssetup("newprod_num")
renmen_num= rssetup("renmen_num")
fenlei_num= rssetup("fenlei_num")
reg= rssetup("reg")
bbs= rssetup("bbs")
help_hang=rssetup("help_hang")
menu= rssetup("menu")
lockip= rssetup("lockip")
prod_pic="pic/"
qqonline=rssetup("qqonline")
adm_qq= rssetup("adm_qq")
adm_qq_name= rssetup("adm_qq_name")
whereqq=rssetup("whereqq")
kefuskin=rssetup("kefuskin")
qqskin=rssetup("qqskin")
qqmsg_on=rssetup("qqmsg_on")
qqmsg_off=rssetup("qqmsg_off")
lockip=rssetup("lockip")
ip=rssetup("ip")
topmenu_view=rssetup("topmenu_view")
topmenu=rssetup("topmenu")
music=rssetup("other1")
set rssetup=nothing
%>
<%
'此文件不需要作任何修改
if adm_qq<>"" and qqonline=1 then
adm_qq=replace(adm_qq,"，",",")
if isnull(adm_qq_name) or adm_qq_name="" then adm_qq_name=adm_qq
adm_qq_name=replace(adm_qq_name,"，",",")
QQ_NAME=split(adm_qq_name,",")
QQ=split(adm_qq,",")
for N=0 to UBound(QQ)
MyQQ=MyQQ+QQ(N)+":"
next
%>
<script language="javascript">
var online= new Array();
if (!document.layers)
document.write('<div id="divStayTopLeft" style="position:absolute">')
</script>
<layer id="divStayTopLeft">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td><img border=0 src=images/qq/up<%=kefuskin%>.gif></td></tr>
<script src="http://webpresence.qq.com/getonline?Type=1&<%=Myqq%>"></script>
<tr><td>
<table width=118 border=0 bgcolor=#FFFFFF background=images/qq/mid<%=kefuskin%>.gif>
<%
for N=0 to UBound(QQ)
%>
<script>
if (online[<%=n%>]==0)
document.write("<tr><td align=right><a class='c' target=blank href='http://wpa.qq.com/msgrd?V=1&Uin=<%=QQ(n)%>&Site=<%=sitename%>&Menu=no'><img alt='<p align=left><%=qqmsg_off%>' src=images/qq/QQoff<%=qqskin%>.gif border=0 align=middle></a></td><td><a class='c' target=blank href='http://wpa.qq.com/msgrd?V=1&Uin=<%=QQ(n)%>&Site=<%=sitename%>&Menu=no' alt='<p align=left><%=qqmsg_off%>'><%=QQ_name(n)%></a></td></tr>");
else
document.write("<tr><td align=right><a class='b' target=blank href='http://wpa.qq.com/msgrd?V=1&Uin=<%=QQ(n)%>&Site=<%=sitename%>&Menu=no'><img alt='<p align=left><%=qqmsg_on%>' src=images/qq/QQon<%=qqskin%>.gif border=0 align=middle></a></td><td><a class='b' target=blank href='http://wpa.qq.com/msgrd?V=1&Uin=<%=QQ(n)%>&Site=<%=sitename%>&Menu=no' alt='<p align=left><%=qqmsg_on%>'><%=QQ_name(n)%></a></td></tr>");
</script >
<%next%>
</table></td></tr>
<tr><td><img border=0 src=images/qq/down<%=kefuskin%>.gif></td></tr>
</table>
</layer>
<%
if whereqq=1 then
%>
<script type="text/javascript">
var verticalpos="frombottom"
if (!document.layers)
document.write('</div>')
function JSFX_FloatTopDiv()
{
	var startX =2,
	startY = 550;
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
<%else%>
<script type="text/javascript">
var verticalpos="frombottom"
if (!document.layers)
document.write('</div>')
function JSFX_FloatTopDiv()
{
	var startX =screen.width-140,
	startY = 550;
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

<%
end if
end if
%>
