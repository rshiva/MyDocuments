<%
'本文件内的所有函数均不能作任何修改，否则会影响系统正常运行。
function lleft(content,lef)
for le=1 to len(content)
if asc(mid(content,le,1))<0 then
lef=lef-2
else
lef=lef-1
end if
if lef<=0 then exit for
next
lleft=left(content,le)
end function
function llen(content)
truelen=0
for le=1 to len(content)
if asc(mid(content,le,1))<0 then
truelen=truelen+2
else
truelen=truelen+1
end if
next
llen=truelen
end function
function FormatNum(num,n)
if num<1 then
num="0"&cstr(FormatNumber(num,n))
else
num=cstr(FormatNumber(num,n))
end if
FormatNum=replace(num,",","")
end function
function checktext(txt)
checktext=txt
chrtxt="33|34|35|36|37|38|39|40|41|42|43|44|47|58|59|60|61|62|63|91|92|93|94|96|123|124|125|126|128"
chrtext=split(chrtxt,"|")
for c=0 to ubound(chrtext)
checktext=replace(checktext,chr(chrtext(c)),"")
next
end function
function ii11ii1(ii1liil)
ii11iil=split(ii1liil,".")
ii11ii1=ii11iil(0)&"."&ii11iil(1)&"."&ii11iil(2)&".**"
end function
sub checklogin()
set rscheck=conn.execute("select * from buyok_user where UserId='"&request.cookies("buyok")("userid")&"'")
if rscheck.eof and rscheck.bof then
response.write "<script language='javascript'>"
response.write "alert('对不起，您还没有注册或登陆。');"
response.write "location.href='javascript:history.go(-1)';"
response.write "</script>"
response.end
end if
set rscheck=nothing
end sub
function checkuserkou()
if request.cookies("buyok")("userid")="" then
checkuserkou=10
else
checkuserkou=request.cookies("buyok")("userkou")
if request.cookies("buyok")("userkou")="" then checkuserkou=10
end if
end function
sub checkmanage(str)
Set mrs = conn.Execute("select * from manage where username='"&request.cookies("buyok")("admin")&"'")
if not (mrs.bof and mrs.eof) then
manage=mrs("manage")
if instr(manage,str)<=0 then
response.write "<script language='javascript'>"
response.write "alert('警告：您没有此项操作的权限！');"
response.write "location.href='quit.asp';"
response.write "</script>"
response.end
else
session("buyok_admin_login")=0
end if
else 
response.write "<script language='javascript'>"
response.write "alert('没有登陆，不能执行此操作！');"
response.write "location.href='quit.asp';"
response.write "</script>"
response.end
end if
set mrs=nothing
end sub
sub aspsql()
SQL_injdata = "'|;|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare"
SQL_inj = split(SQL_Injdata,"|")
If Request.Form<>"" Then
For Each Sql_Post In Request.Form
For SQL_Data=0 To Ubound(SQL_inj)
if instr(Request.Form(Sql_Post),Sql_Inj(Sql_DATA))>0 Then
response.write "<script language='javascript'>"
response.write "alert('网站安全提示：请不要在参数中包含非法字符！');"
response.write "location.href='javascript:history.go(-1)';"
response.write "</script>"
response.end
end if
next
next
end if
If Request.QueryString<>"" Then
For Each SQL_Get In Request.QueryString
For SQL_Data=0 To Ubound(SQL_inj)
if instr(Request.QueryString(SQL_Get),Sql_Inj(Sql_DATA))>0 Then
response.write "<script language='javascript'>"
response.write "alert('网站安全提示：请不要在参数中包含非法字符！');"
response.write "location.href='javascript:history.go(-1)';"
response.write "</script>"
response.end
end if
next
Next
end If
end sub
sub buyok_check_path()
server_v1=lcase(Cstr(Request.ServerVariables("HTTP_REFERER")))
server_v2=lcase(Cstr(Request.ServerVariables("SERVER_NAME")))
if mid(server_v1,8,len(server_v2))<>server_v2 then
response.write "<script language='javascript'>"
response.write "alert('网站安全提示：\n\n请不要从外部服务器提交数据到本站！\n\n请不要乱改参数提交数据！');"
response.write "location.href='javascript:history.go(-1)';"
response.write "</script>"
response.end
end if
end sub
%>
