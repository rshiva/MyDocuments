<!--#include file="Conn.asp"-->
<!--#include file="Admin.asp"-->
<!--#include file="inc/head.asp"-->

<table cellpadding="2" cellspacing="1" border="0" width="95%" align="center" class="table_southidc">
	<tr>
		<td class="back_southidc" colspan="2" height="25" align="center"><b>服务器环境</b></td>
	</tr>
	
	<tr class="tr_southidc">
		<td width="50%" height="23">服务器域名：<font class="t4"> <%=Request.ServerVariables("server_name")%> 
		/ <%=Request.ServerVariables("Http_HOST")%></font></td>
		<td width="50%">脚本解释引擎：<font class="t4"> <%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></font></td>
	</tr>
	<tr class="tr_southidc">
		<td width="50%" height="23">服务器软件的名称：<font class="t4"> <%=Request.ServerVariables("SERVER_SOFTWARE")%></font></td>
		<td width="50%">&nbsp;</td>
	</tr>
</table>
<br>
<%
sub discreteness
%>
<table cellpadding="2" cellspacing="1" border="0" width="95%" align="center" class="table_southidc">
<tr class="back_southidc" >
<td width="57%" height="25"><span style="font-weight: bold">&nbsp;组件名称</span></td>
<td width="41%" height="25"><span style="font-weight: bold">支持及版本</span></td>
</tr>

<%
Dim theInstalledObjects(17)
theInstalledObjects(0) = "MSWC.AdRotator"
theInstalledObjects(1) = "MSWC.BrowserType"
theInstalledObjects(2) = "MSWC.NextLink"
theInstalledObjects(3) = "MSWC.Tools"
theInstalledObjects(4) = "MSWC.Status"
theInstalledObjects(5) = "MSWC.Counters"
theInstalledObjects(6) = "MSWC.PermissionChecker"
theInstalledObjects(7) = "ADODB.Stream"
theInstalledObjects(8) = "adodb.connection"
theInstalledObjects(9) = "Scripting.FileSystemObject"
theInstalledObjects(10) = "SoftArtisans.FileUp"
theInstalledObjects(11) = "SoftArtisans.FileManager"
theInstalledObjects(12) = "JMail.Message"
theInstalledObjects(13) = "CDONTS.NewMail"
theInstalledObjects(14) = "Persits.MailSender"
theInstalledObjects(15) = "LyfUpload.UploadFile"
theInstalledObjects(16) = "Persits.Upload.1"
theInstalledObjects(17) = "w3.upload"

For i=0 to 17
Response.Write "<TR ><TD class='tr_southidc'>&nbsp;" & theInstalledObjects(i) & "<font color=888888>&nbsp;"
select case i
case 8
Response.Write "(ACCESS 数据库)"
case 9
Response.Write "(FSO 文本文件读写)"
case 10
Response.Write "(SA-FileUp 文件上传)"
case 11
Response.Write "(SA-FM 文件管理)"
case 12
Response.Write "(JMail 邮件发送)"
case 13
Response.Write "(WIN虚拟SMTP 发信)"
case 14
Response.Write "(ASPEmail 邮件发送)"
case 15
Response.Write "(LyfUpload 文件上传)"
case 16
Response.Write "(ASPUpload 文件上传)"
case 17
Response.Write "(w3 upload 文件上传)"
end select
Response.Write "</font></td><td height=25>"
If Not IsObjInstalled(theInstalledObjects(i)) Then
Response.Write "<font color=red><b>×</b></font>"
Else
Response.Write "<b>√</b> " & getver(theInstalledObjects(i)) & ""
End If
Response.Write "</td></TR>" & vbCrLf
Next
%>
</table>
<%
end sub

''''''''''''''''''''''''''''''
Function IsObjInstalled(strClassString)
On Error Resume Next
IsObjInstalled = False
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(strClassString)
If 0 = Err Then IsObjInstalled = True
Set xTestObj = Nothing
Err = 0
End Function
''''''''''''''''''''''''''''''
Function getver(Classstr)
On Error Resume Next
getver=""
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(Classstr)
If 0 = Err Then getver=xtestobj.version
Set xTestObj = Nothing
Err = 0
End Function
discreteness %>
