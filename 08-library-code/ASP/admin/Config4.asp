<!--#include file="dmwh_conn.asp"-->
<!--#include file="Admin.asp"-->
<!-- #include file="Inc/Head.asp" -->
<script language=javascript src=../include/mouse_on_title.js></script>
<BODY>
<%
action=request("ok")
call aspsql()
if action="" then 
Set rs = conn.Execute("select * from dm_mp3") 
%>
<table width="90%" border="0" align="center" cellpadding="2" cellspacing="1" class="table_southidc" style="border-collapse: collapse; border-style: dotted; border-width: 0px">
<form action=Config4.asp method=post name=setup>
<tr class=back_southidc>
  <td height=25 colspan=2 align="center" class=td style="font-weight: bold">在线咨询设置 &nbsp;</td>
</tr>
<tr><td width=20% align=right class="td_southidc">“在线咨询”状态 &nbsp;</td>
<td class="td_southidc" >
<input type="radio" name="qqonline" value="1" <%if rs("qqonline")=1 then%>checked<%end if%>>显示
<input type="radio" name="qqonline" value="0" <%if rs("qqonline")=0 then%>checked<%end if%>>隐藏 
</td></TR>
<tr class="tr_southidc">
  <td width=20% align=right>显示位置 &nbsp;</td>
<td >
<input type="radio" name="whereqq" value="1" <%if rs("whereqq")=1 then%>checked<%end if%>>左侧
<input type="radio" name="whereqq" value="0" <%if rs("whereqq")=0 then%>checked<%end if%>>右侧 &nbsp; <img src=../images/admin/memo.gif alt="建议放在右侧"></td></TR>
<tr class="tr_southidc">
  <td width=20% align=right>客服QQ号 &nbsp;</td><td > <input type=text value="<%=rs("adm_qq")%>" size=35 name="adm_qq" maxlength="50" size=50> &nbsp; <img src=../images/admin/memo.gif alt="请填QQ号<br>多个QQ号用西文逗号隔开<br>注意：QQ号应与下面的昵称一一对应"> </td></TR>
<tr class="tr_southidc">
  <td width=20% align=right>客服QQ对应昵称 &nbsp;</td><td > <input type=text value="<%=rs("adm_qq_name")%>" size=35 name="adm_qq_name" maxlength="50" size=50> &nbsp; <img src=../images/admin/memo.gif alt="请填QQ昵称<br>多个昵称用西文逗号隔开<br>注意：昵称应与上面的QQ号一一对应"> </td></TR>
<tr><td width=20% align=right class="tr_southidc">请选择头像 &nbsp;</td>
<td class="tr_southidc">
<table width=50% border=0>
<tr><td><input type="radio" name="qqskin" value="1" <%if rs("qqskin")=1 then%>checked<%end if%>>在线：</td><td><img src=../images/qq/qqon1.gif border=0> </td><td> 离线：</td><td><img src=../images/qq/qqoff1.gif border=0> &nbsp; &nbsp; &nbsp; &nbsp; <img src=../images/admin/memo.gif alt="上面所填QQ昵称较长时<br>请使用第一种小头像<br>否则会超过窗口宽度"></td></tr>
<tr><td><input type="radio" name="qqskin" value="2" <%if rs("qqskin")=2 then%>checked<%end if%>>在线：</td><td><img src=../images/qq/qqon2.gif border=0> </td><td> 离线： </td><td> <img src=../images/qq/qqoff2.gif border=0> </td></tr> 
<tr><td><input type="radio" name="qqskin" value="3" <%if rs("qqskin")=3 then%>checked<%end if%>>在线：</td><td><img src=../images/qq/qqon3.gif border=0> </td><td> 离线： </td><td> <img src=../images/qq/qqoff3.gif border=0> </td></tr> 
<tr><td><input type="radio" name="qqskin" value="4" <%if rs("qqskin")=4 then%>checked<%end if%>>在线：</td><td><img src=../images/qq/qqon4.gif border=0> </td><td> 离线： </td><td> <img src=../images/qq/qqoff4.gif border=0> </td></tr> 
<tr><td><input type="radio" name="qqskin" value="5" <%if rs("qqskin")=5 then%>checked<%end if%>>在线：</td><td><img src=../images/qq/qqon5.gif border=0> </td><td> 离线： </td><td> <img src=../images/qq/qqoff5.gif border=0> </td></tr> 
</table>
</td></TR>
<tr><td width=20% align=right class="tr_southidc">请选择样式 &nbsp;</td>
<td class="tr_southidc" >
<input type="radio" name="kefuskin" value="1" <%if rs("kefuskin")=1 then%>checked<%end if%>>样式一	<input type="radio" name="kefuskin" value="2" <%if rs("kefuskin")=2 then%>checked<%end if%>>样式二	<input type="radio" name="kefuskin" value="3" <%if rs("kefuskin")=3 then%>checked<%end if%>>样式三	<input type="radio" name="kefuskin" value="4" <%if rs("kefuskin")=4 then%>checked<%end if%>>样式四	<input type="radio" name="kefuskin" value="5" <%if rs("kefuskin")=5 then%>checked<%end if%>>样式五	<a href=../images/help/qq.gif target=_blank><img src=../images/admin/memo.gif border=0 alt="点击预览效果"></a>
</td></TR>
<tr><td width=20% align=right class="tr_southidc">在线提示语 &nbsp;</td>
<td class="tr_southidc" > 
<TEXTAREA NAME="qqmsg_on" ROWS="3" COLS="34" style="overflow:auto;"><%=rs("qqmsg_on")%></TEXTAREA> &nbsp; <img align=top src=../images/admin/memo.gif alt="客服在线时，鼠标指向头像或昵称<br>会显示这句个性化提示语<br>换行请加〈br〉。"></td></tr>
<tr><td width=20% align=right class="tr_southidc">离线提示语 &nbsp;</td>
<td class="tr_southidc" >
<TEXTAREA NAME="qqmsg_off" ROWS="3" COLS="34" style="overflow:auto;"><%=rs("qqmsg_off")%></TEXTAREA> &nbsp; <img align=top src=../images/admin/memo.gif alt="客服离线时，鼠标指向头像或昵称<br>会显示这句个性化提示语<br>换行请加〈br〉。"></td></tr>
<tr><td width="568" height="40" colspan=2 class="tr_southidc" ><INPUT name="ok" TYPE="hidden" value="ok"><INPUT name=action TYPE="submit" value="保存设置"> &nbsp;</td>
</tr>
</form>
</table>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
end if
if action="ok" then
if request.form("qqonline")="" or request.form("whereqq")="" then
response.write "<script language='javascript'>"
response.write "alert('出错了，资料填写不完整或有错误！');"
response.write "location.href='javascript:history.go(-1)';"
response.write "</script>"
response.end
end if
if request.form("qqonline")=1 then
if trim(request.form("adm_qq"))="" or trim(request.form("qqmsg_on"))="" or trim(request.form("qqmsg_off"))="" then
response.write "<script language='javascript'>"
response.write "alert('出错了，资料填写不完整或有错误！');"
response.write "location.href='javascript:history.go(-1)';"
response.write "</script>"
response.end
end if
end if
if request.form("adm_qq_name")<>"" and request.form("adm_qq")<>"" then
adm_qq_name=replace(request.form("adm_qq_name"),"，",",")
adm_qq=replace(request.form("adm_qq"),"，",",")
if UBound(split(adm_qq_name,","))<> UBound(split(adm_qq,",")) then
response.write "<script language='javascript'>"
response.write "alert('出错了，客服QQ号与其昵称未一一对应！');"
response.write "location.href='javascript:history.go(-1)';"
response.write "</script>"
response.end
end if
end if
Set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from dm_mp3"
rs.open sql,conn,1,3
rs("qqonline")=request.form("qqonline")
rs("whereqq")=request.form("whereqq")
if request.form("qqonline")=1 then 
rs("kefuskin")=request.form("kefuskin")
rs("qqskin")=request.form("qqskin")
qqmsg_off=replace(trim(request.form("qqmsg_off")),"'","")
qqmsg_off=replace(qqmsg_off,"&quot;","")
rs("qqmsg_off")=qqmsg_off
qqmsg_on=replace(trim(request.form("qqmsg_on")),"'","")
qqmsg_on=replace(qqmsg_on,"&quot;","")
rs("qqmsg_on")=qqmsg_on
rs("adm_qq")=replace(request.form("adm_qq"),"，",",")
rs("adm_qq_name")=replace(request.form("adm_qq_name"),"，",",")
if request.form("adm_qq_name")="" then rs("adm_qq_name")=replace(request.form("adm_qq"),"，",",") 
end if
rs.update
url="config4.asp"
rs.close
set rs=nothing
conn.close
set conn=nothing
response.write "<script language='javascript'>"
response.write "alert('操作成功，您设置的信息已保存！');"
response.write "location.href='"&url&"';"
response.write "</script>"
end if%>