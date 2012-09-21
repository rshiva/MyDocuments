<%@ Language="VBScript" CODEPAGE="936"%>
<!--#include file="inc/head.asp"-->





<% 
Response.Buffer = True
'####################################
'#                                  #
'#      ITlearner ASP探针 V1.2      #
'#                                  #
'#     http://www.itlearner.com     #
'#                                  #
'#    转载本程序时请保留这些信息    #
'#                                  #
'####################################
Dim startime
	 startime=timer()
Dim hx
Set hx = New Cls_AspCheck

class Cls_AspCheck

Public FileName,WebName,WebUrl,SysName,SysNameE,SysVersion

'检查组件是否被支持
Public Function IsObjInstalled(strClassString)
	On Error Resume Next
	Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If Err Then
		IsObjInstalled = False
	else	
		IsObjInstalled = True
	end if
	Set xTestObj = Nothing
End Function

'检查组件版本
Public Function getver(Classstr)
	On Error Resume Next
	Dim xTestObj
	Set xTestObj = Server.CreateObject(Classstr)
	If Err Then
		getver=""
	else	
	 	getver=xTestObj.version
	end if
	Set xTestObj = Nothing
End Function

Public Function GetObjInfo(startnum,endnum)
	dim i,Outstr
	for i=startnum to endnum
      	Outstr = Outstr & "<tr bgcolor=#FFFFFF align=center height=18><TD align=left>&nbsp;" & theTestObj(i,0) & ""
      	Outstr = Outstr & "<font color=#888888>&nbsp;"&theTestObj(i,1)&"</font>"
      	Outstr = Outstr & "</td>"
    	If Not IsObjInstalled(theTestObj(i,0)) Then 
      	Outstr = Outstr & "<td align=left>&nbsp;<font color=red><b>×</b></font></td>"
    	Else
      	Outstr = Outstr & "<td align=left>&nbsp;<font color=green><b>√</b></font> " & getver(theTestObj(i,0)) & "</td>"
		End If
      	Outstr = Outstr & "</tr>" & vbCrLf
	next
	Response.Write(Outstr)
End Function

Public Function cdrivetype(tnum)
    Select Case tnum
        Case 0: cdrivetype = "未知"
        Case 1: cdrivetype = "可移动磁盘"
        Case 2: cdrivetype = "本地硬盘"
        Case 3: cdrivetype = "网络磁盘"
        Case 4: cdrivetype = "CD-ROM"
        Case 5: cdrivetype = "RAM 磁盘"
    End Select
end function

Private Sub Class_Initialize()
	WebName="IT学习者"
	WebUrl="http://www.itlearner.com"
	SysName="ASP探针"		
	SysNameE="AspCheck"
	SysVersion="V1.2"
	FileName=Request.ServerVariables("SCRIPT_NAME")
End Sub

Public Function dtype(num)
    Select Case num
        Case 0: dtype = "未知"
        Case 1: dtype = "可移动磁盘"
        Case 2: dtype = "本地硬盘"
        Case 3: dtype = "网络磁盘"
        Case 4: dtype = "CD-ROM"
        Case 5: dtype = "RAM 磁盘"
    End Select
End Function

Public Function formatdsize(dsize)
    if dsize>=1073741824 then
		formatdsize=Formatnumber(dsize/1073741824,2) & " GB"
    elseif dsize>=1048576 then
    	formatdsize=Formatnumber(dsize/1048576,2) & " MB"
    elseif dsize>=1024 then
		formatdsize=Formatnumber(dsize/1024,2) & " KB"
	else
		formatdsize=dsize & "B"
	end if
End Function

Public Function formatvariables(str)
on error resume next
str = cstr(server.htmlencode(str))
formatvariables=replace(str,chr(10),"<br>")
End Function

Public Sub ShowFooter()
	dim Endtime,Runtime,OutStr
	Endtime=timer()
	OutStr = "<table align=center border=0 cellpadding=0 cellspacing=1 class=tableBorder><tr><td>"
 	Runtime=FormatNumber((endtime-startime)*1000,2) 
	if Runtime>0 then
		if Runtime>1000 then
		  	OutStr = OutStr & "页面执行时间：约"& FormatNumber(runtime/1000,2) & "秒"
		else
			OutStr = OutStr & "页面执行时间：约"& Runtime & "毫秒"
		end if	
	end if
	Response.Write(OutStr)
End Sub
End class

Dim theTestObj(25,1)

	theTestObj(0,0) = "MSWC.AdRotator"
	theTestObj(1,0) = "MSWC.BrowserType"
	theTestObj(2,0) = "MSWC.NextLink"
	theTestObj(3,0) = "MSWC.Tools"
	theTestObj(4,0) = "MSWC.Status"
	theTestObj(5,0) = "MSWC.Counters"
	theTestObj(6,0) = "MSWC.PermissionChecker"
	theTestObj(7,0) = "WScript.Shell"
	theTestObj(8,0) = "Microsoft.XMLHTTP"
	theTestObj(9,0) = "Scripting.FileSystemObject"
	theTestObj(9,1) = "(FSO 文本文件读写)"
	theTestObj(10,0) = "ADODB.Connection"
	theTestObj(10,1) = "(ADO 数据对象)"
    
	theTestObj(11,0) = "SoftArtisans.FileUp"
	theTestObj(11,1) = "(SA-FileUp 文件上传)"
	theTestObj(12,0) = "SoftArtisans.FileManager"
	theTestObj(12,1) = "(SoftArtisans 文件管理)"
	theTestObj(13,0) = "LyfUpload.UploadFile"
	theTestObj(13,1) = "(刘云峰的文件上传组件)"
	theTestObj(14,0) = "Persits.Upload"
	theTestObj(14,1) = "(ASPUpload 文件上传)"
	theTestObj(15,0) = "w3.upload"
	theTestObj(15,1) = "(Dimac 文件上传)"

	theTestObj(16,0) = "JMail.SmtpMail"
	theTestObj(16,1) = "(Dimac JMail 邮件收发)</a>"
	theTestObj(17,0) = "CDONTS.NewMail"
	theTestObj(17,1) = "(虚拟 SMTP 发信)"
	theTestObj(18,0) = "Persits.MailSender"
	theTestObj(18,1) = "(ASPemail 发信)"
	theTestObj(19,0) = "SMTPsvg.Mailer"
	theTestObj(19,1) = "(ASPmail 发信)"
	theTestObj(20,0) = "DkQmail.Qmail"
	theTestObj(20,1) = "(dkQmail 发信)"
	theTestObj(21,0) = "Geocel.Mailer"
	theTestObj(21,1) = "(Geocel 发信)"
	theTestObj(22,0) = "IISmail.Iismail.1"
	theTestObj(22,1) = "(IISmail 发信)"
	theTestObj(23,0) = "SmtpMail.SmtpMail.1"
	theTestObj(23,1) = "(SmtpMail 发信)"
	theTestObj(24,0) = "SoftArtisans.ImageGen"
	theTestObj(24,1) = "(SA 的图像读写组件)"
	theTestObj(25,0) = "W3Image.Image"
	theTestObj(25,1) = "(Dimac 的图像读写组件)"


%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<TITLE><%=hx.SysVersion%></TITLE>
<BODY leftmargin="50">
<p><a name=top></a><br>
  <%
dim action
action=request("action")
if action="testzujian" then
call ObjTest2
end if

Call menu
Call SystemTest
Call ObjTest
Call CalculateTest
Call DriveTest
Call SpeedTest
hx.ShowFooter
Set hx= nothing

%>
  <%Sub menu%>
</p>
<table cellpadding="2" cellspacing="1" border="0" width="90%" align="center" class="table_southidc">
  <tr>
    <td class="back_southidc" colspan="2" height="25" align="center"><b>快 捷 方 式</b></td>
  </tr>
  <tr class="tr_southidc">
    <td width="11%" height="23">快捷功能链接</td>
    <td width="88%" height="23"><a href="Help.asp"><font color="000000"> 　</font></a><a href="#SystemTest">服务器有关参数</a> | <a href="#ObjTest">服务器组件情况</a> | <a href="#CalcuateTest">服务器运算能力</a> | <a href="#DriveTest">服务器磁盘信息</a> | <a href="#SpeedTest">服务器连接速度</a></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>
  <%End Sub%>
  <%Sub smenu(i)%>
  <a href="#top" title="返回顶部"><font face='Webdings' color=#FFFFFF>5</font></a> <span id=txt<%=i%> name=txt<%=i%>><a href='#' title='关闭此项'><font face='Wingdings' color=#FFFFFF>x</font></a></span> 
  <%End Sub%>
  <%Sub SystemTest
on error resume next
%>
  <a name="SystemTest"></a> 
</p>
<table width="90%" border="0" align="center" cellpadding="2" cellspacing="1" class="table_southidc">
  <tr class="back_southidc"> 
    <td height="25" align="center" bgcolor="#0099CF" class="td_southidc" onClick="showsubmenu(0)"><strong>服务器有关参数</strong> 
    <%Call smenu(0)%></td>
  </tr>
  <tr> 
    <td bgcolor="#FFFFFF" id='submenu0' style="display"><table width=100% border=0 cellpadding=3 cellspacing=1 bgcolor="#FFFFFF" class="table_southidc">
        <tr bgcolor="#FFFFFF" height=18> 
          <td width="130">&nbsp;服务器名</td>
          <td width="170" height="18">&nbsp;<%=Request.ServerVariables("SERVER_NAME")%></td>
          <td width="130" height="18">&nbsp;服务器操作系统</td>
          <td width="170" height="18">&nbsp;<%=Request.ServerVariables("OS")%></td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td>&nbsp;服务器IP</td>
          <td>&nbsp;<%=Request.ServerVariables("LOCAL_ADDR")%></td>
          <td>&nbsp;服务器端口</td>
          <td>&nbsp;<%=Request.ServerVariables("SERVER_PORT")%></td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td>&nbsp;服务器时间</td>
          <td>&nbsp;<%=now%></td>
          <td>&nbsp;服务器CPU数量</td>
          <td>&nbsp;<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> 
          个</td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td>&nbsp;IIS版本</td>
          <td height="18">&nbsp;<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
          <td height="18">&nbsp;脚本超时时间</td>
          <td height="18">&nbsp;<%=Server.ScriptTimeout%> 秒</td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td>&nbsp;Application变量</td>
          <td height="18">&nbsp;
            <%Response.Write(Application.Contents.Count & "个 ")
		  if Application.Contents.count>0 then Response.Write("[<a href=""?action=showapp"">遍历Application变量</a>]")%>
          </td>
          <td height="18">&nbsp;Session变量<br> </td>
          <td height="18">&nbsp;
            <%Response.Write(Session.Contents.Count&"个 ")
		  if Session.Contents.count>0 then Response.Write("[<a href=""?action=showsession"">遍历Session变量</a>]")%>
          </td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td height="18">&nbsp;<a href="?action=showvariables">所有服务器参数</a></td>
          <td height="18">&nbsp;
            <%Response.Write(Request.ServerVariables.Count&"个 ")
		  if Request.ServerVariables.Count>0 then Response.Write("[<a href=""?action=showvariables"">遍历服务器参数</a>]")%>
          </td>
          <td height="18">&nbsp;服务器环境变量</td>
          <td height="18">&nbsp;
            <%
			dim WshShell,WshSysEnv
			Set WshShell = server.CreateObject("WScript.Shell")
			Set WshSysEnv = WshShell.Environment
			if err then
				Response.Write("服务器不支持WScript.Shell组件")
				err.clear
			else
				Response.Write(WshSysEnv.count &"个 ")
				if WshSysEnv.count>0 then Response.Write("[<a href=""?action=showwsh"">遍历环境变量</a>]") 
		 	end if
		  %>		  
		  </td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td align=left>&nbsp;服务器解译引擎</td>
          <td height="18" colspan="3">&nbsp;JScript: <%= getEngVerJs() %> | VBScript: <%=getEngVerVBS()%></td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td align=left bgcolor="#FFFFFF">&nbsp;本文件实际路径</td>
          <td height="8" colspan="3" bgcolor="#FFFFFF">&nbsp;<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
        </tr>
      </table>
      <%
if action="showapp" or action="showsession" or action="showvariables" or action="showwsh" then
	showvariable(action)
end if
%>
    </td>
  </tr>
</table>
<br>
<%
End Sub

Sub showvariable(action)
%>
<table width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#0099CC" class="table_southidc">
  <tr bgcolor="#99CCFF"> 
    <td colspan="2" class="back_southidc"> &nbsp;&nbsp;
      <%
	on error resume next
	dim Item,xTestObj,outstr
	if action="showapp" then
		Response.Write("<font face='Webdings'>4</font> 遍历Application变量")
		set xTestObj=Application.Contents
	elseif action="showsession" then
		Response.Write("<font face='Webdings'>4</font> 遍历Session变量")
		set xTestObj=Session.Contents
	elseif action="showvariables" then
		Response.Write("<font face='Webdings'>4</font> 遍历服务器参数")
		set xTestObj=Request.ServerVariables
	elseif action="showwsh" then
		Response.Write("<font face='Webdings'>4</font> 遍历环境变量")
		dim WshShell
		Set WshShell = server.CreateObject("WScript.Shell")
		set xTestObj=WshShell.Environment
	end if
		Response.Write "(<a href="&hx.FileName&">关闭</a>)"
	%>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF" class="td_southidc"> 
    <td width="130">变量名</td>
    <td width="470">值</td>
  </tr>
  <%
	if err then
		outstr = "<tr bgcolor=#FFFFFF><td colspan=2>没有符合条件的变量</td></tr>"
		err.clear
	else
		dim w
		if action="showwsh" then
			for each Item in xTestObj
				w=split(Item,"=")
				outstr = outstr & "<tr bgcolor=#FFFFFF>"
				outstr = outstr & "<td>" & w(0) & "</td>" 
				outstr = outstr & "<td>" & w(1) & "</td>" 
				outstr = outstr & "</tr>" 		
			next
		else
			dim i
			for each Item in xTestObj
				outstr = outstr & "<tr bgcolor=#FFFFFF>"
				outstr = outstr & "<td>" & Item & "</td>" 				
				outstr = outstr & "<td>"
				if IsArray(xTestObj(Item)) then		
					for i=0 to ubound(xTestObj(Item))-1
					outstr = outstr & hx.formatvariables(xTestObj(Item)(i)) & "<br>"
					next
				else
					outstr = outstr & hx.formatvariables(xTestObj(Item))
				end if			
				outstr = outstr & "</td>"
				outstr = outstr & "</tr>" 
			next
		end if
	end if
		Response.Write(outstr)	
		set xTestObj=nothing
		%>
</table>
<%End Sub%>
<%Sub ObjTest%>
<a name="ObjTest"></a>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" class="table_southidc">
  <tr> 
    <td height="25" align="center" bgcolor="#0099CF" class="back_southidc" onClick="showsubmenu(1)"><strong><font color="#000000">服务器</font></strong><font color=#000000><strong>组件情况</strong></font> 
    <%Call smenu(1)%></td>
  </tr>
  <tr class="td_southidc"> 
    <td style="display" id='submenu1'><table width=100% border=0 cellpadding=3 cellspacing=1 bgcolor="#0099CF" class="table_southidc">
        <tr bgcolor="#99CCFF" height=18> 
          <td colspan="2" bgcolor="#99CCFF">&nbsp;&nbsp;<font face='Webdings'>4</font> IIS自带的ASP组件</td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td width=450 align="center" class="td_southidc">组 件 名 称</td>
          <td width=150 align="center" class="td_southidc">支持及版本</td>
        </tr>
        <%hx.GetObjInfo 0,10%>
      </table>
      <table width=100% border=0 cellpadding=3 cellspacing=1 bgcolor="#0099CF" class="table_southidc">
        <tr bgcolor="#99CCFF" height=18> 
          <td colspan="2">&nbsp;&nbsp;<font face='Webdings'>4</font> 常见的文件上传和管理组件 </td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td width=450 align="center" class="td_southidc">组 件 名 称</td>
          <td width=150 align="center" class="td_southidc">支持及版本</td>
        </tr>
        <%hx.GetObjInfo 11,15%>
      </table>
      <table width=100% border=0 cellpadding=3 cellspacing=1 bgcolor="#0099CF" class="table_southidc">
        <tr bgcolor="#99CCFF" height=18> 
          <td colspan="2">&nbsp;&nbsp;<font face='Webdings'>4</font> 常见的收发邮件组件</td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td width=450 align="center" class="td_southidc">组 件 名 称</td>
          <td width=150 align="center" class="td_southidc">支持及版本</td>
        </tr>
        <%hx.GetObjInfo 16,23%>
      </table>
      <table width=100% border=0 cellpadding=3 cellspacing=1 bgcolor="#0099CF" class="table_southidc">
        <tr bgcolor="#99CCFF" height=18> 
          <td colspan="2">&nbsp;&nbsp;<font face='Webdings'>4</font> 图像处理组件</td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td width=450 align="center" class="td_southidc">组 件 名 称</td>
          <td width=150 align="center" class="td_southidc">支持及版本</td>
        </tr>
        <%hx.GetObjInfo 24,25%>
      </table>
      <table width=100% border=0 cellpadding=3 cellspacing=1  bgcolor="#0099CF" class="table_southidc">
        <tr> 
          <td bgcolor="#99CCFF">&nbsp;&nbsp;<font face='Webdings'>4</font> 其他组件支持情况检测 </td>
        </tr>
        <FORM action=?action=testzujian method=post id=form1 name=form1 onSubmit="JavaScript:return Checksearchbox();">
          <tr class="tr_southidc"> 
            <td height=30 bgcolor="#FFFFFF">输入你要检测的组件的ProgId或ClassId 
              <input class=input type=text value="" name="classname" size=40> 
              <INPUT type=submit value="确定" class=backc id=submit1 name=submit1> 
            </td>
          </tr>
        </FORM>
      </table></td>
  </tr>
</table>
<br>
<%
End Sub
Sub ObjTest2
	Dim strClass
    strClass = Trim(Request.Form("classname"))
    If strClass <> "" then
	
    Response.Write "<br>您指定的组件的检查结果："
      If Not hx.IsObjInstalled(strClass) then 
        Response.Write "<br><font color=red>很遗憾，该服务器不支持" & strclass & "组件！</font>"
      Else
        Response.Write "<br><font color=green>"
		Response.Write " 恭喜！该服务器支持" & strclass & "组件。"
		If hx.getver(strclass)<>"" then
		Response.Write " 该组件版本是：" & hx.getver(strclass)
		End if
		Response.Write "</font>"
      End If
      Response.Write "<br>"
    end if
	
	Response.Write "<p><a href="&hx.FileName&">返回</a></p>"
	Response.End
End Sub
Sub CalculateTest
%><a name="CalcuateTest"></a>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" class="table_southidc">
  <tr class="back_southidc"> 
    <td height="25" align="center" bgcolor="#0099CF" onClick="showsubmenu(2)"><font color="#000000"><strong>服务器运算能力</strong></font> 
    <%Call smenu(2)%></td>
  </tr>
  <tr class="td_southidc"> 
    <td style="display" id='submenu2'> <table width=100% border=0 cellpadding=3 cellspacing=1 bgcolor="#0099CF" class="table_southidc">
        <tr bgcolor="#99CCFF" height=18> 
          <td colspan="3">&nbsp;&nbsp;<font face='Webdings'>4</font> 让服务器执行50万次加法(<font color="#000000">整数运算</font>)和20万次开方(<font color="#000000">浮点运算</font>)，记录其所使用的时间。          </td>
        </tr>
        <tr height=18> 
          <td width="400" align=center bgcolor="#FFFFFF"><font color="#000000">可 
            供 参 考 的 服 务 器 列 表</font></td>
          <td width="100"  align=center bgcolor="#FFFFFF"><font color="#000000">整数运算</font>          </td>
          <td width="100" align=center bgcolor="#FFFFFF"><font color="#000000">浮点运算</font></td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td align=left>(CPU:Athlon1.6G&nbsp; 内存:512M)</td>
          <td> &nbsp;269.53 毫秒</td>
          <td> &nbsp;328.13 毫秒 </td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td align=left>(CPU:Celeron 2G&nbsp; 内存:512M)</td>
          <td>&nbsp;250.00 毫秒 </td>
          <td>&nbsp;296.88 毫秒</td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td align=left>(CPU:XEON2.4G 内存:2G)</td>
          <td>&nbsp;281.25 毫秒 </td>
          <td>&nbsp;234.38 毫秒</td>
        </tr>
        
        <%
	dim i,t1,t2,tempvalue,runtime1,runtime2
	'开始计算50万次加法所需时间
	t1=timer()
	for i=1 to 500000
		tempvalue= 1 + 1
	next
	t2=timer()
	runtime1=formatnumber((t2-t1)*1000,2)
	
	'开始计算20万次开方所需时间
	t1=timer()
	for i=1 to 200000
		tempvalue= 2^0.5
	next
	t2=timer()
	runtime2=formatnumber((t2-t1)*1000,2)
%>
        <tr bgcolor="#FFFFFF" height=25> 
          <td align=left>&nbsp;<font color=red>您正在使用的这台服务器</font>&nbsp; <INPUT name="button" type="button" class=backc onClick="document.location.href='<%=hx.FileName%>'" value="重新测试">          </td>
          <td>&nbsp;<font color=red><%=runtime1%> 毫秒</font></td>
          <td>&nbsp;<font color=red><%=runtime2%> 毫秒</font></td>
        </tr>
      </table></td>
  </tr>
</table>
<br>
<%
End Sub
Sub DriveTest
	On Error Resume Next
	Dim fo,d,xTestObj
	set fo=Server.Createobject("Scripting.FileSystemObject")
	set xTestObj=fo.Drives
%>
<a name="DriveTest"></a>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" class="table_southidc">
  <tr class="back_southidc">
    <td height="25" align="center" bgcolor="#0099CF" onClick="showsubmenu(4)"><font color="#000000"><strong>服务器磁盘信息 
      </strong></font> 
    <%Call smenu(4)%></td>
  </tr>
  <tr class="td_southidc">
    <td style="display" id='submenu4'> 
		<%if hx.IsObjInstalled("Scripting.FileSystemObject") then%>
      <table width=100% border=0 cellpadding=3 cellspacing=1 bgcolor="#0099CF" class="table_southidc">
        <tr bgcolor="#99CCFF" height=18> 
          <td colspan="7">&nbsp;&nbsp;<font face='Webdings'>4</font> 服务器磁盘信息</td>
        </tr>
        <tr height=18 bgcolor="#FFFFFF" align=center> 
		  <td width="90">磁盘类型</td>
          <td width="40">盘符</td>
          <td width="30">可用</td>
          <td width="100">卷标</td>
          <td width="80">文件系统</td>
          <td width="130">可用空间</td>
		  <td width="130">总空间</td>
        </tr>
		<%
	for each d in xTestObj
		Response.write "<tr height=18 bgcolor=#FFFFFF>"
		Response.write "<td>&nbsp;"&hx.dtype(d.DriveType)&"</td>"
		Response.write "<td>&nbsp;"&d.DriveLetter&"</td>"		
		if d.DriveLetter = "A" then
		Response.Write "<td colspan=6>&nbsp;为防止影响服务器，不检查软驱</td>"
		else
		Response.write "<td align=center> "
		if d.isready then
			Response.Write "√"
			Response.write "</td>"
			Response.write "<td>&nbsp;"&d.VolumeName&"</td>"
			Response.write "</td>"		
			Response.write "<td>&nbsp;"&d.FileSystem&"</td>"	
			Response.write "<td>&nbsp;"&hx.formatdsize(d.FreeSpace)&"</td>"
			Response.write "<td>&nbsp;"&hx.formatdsize(d.TotalSize)&"</td>"
		else
			Response.Write "×"
			Response.Write "<td colspan=4>&nbsp;可能是磁盘有问题，或者程序没有读取权限</td>"			
		end if			 
		end if		 
	next%>
      </table>
	  <%
	Dim filePath,fileDir,fileDrive
	filePath = server.MapPath(".")
	set fileDir = fo.GetFolder(filePath)
	set fileDrive = fo.GetDrive(fileDir.Drive)
	  %>
      <table width=100% border=0 cellpadding=3 cellspacing=1 bgcolor="#0099CF" class="table_southidc">
        <tr bgcolor="#99CCFF" height=18> 
          <td colspan="6">&nbsp;&nbsp;<font face='Webdings'>4</font> 当前文件夹信息 (<%=filePath%>)</td>
        </tr>
        <tr height=18 bgcolor="#FFFFFF" align=center> 
          <td width="100">已用空间</td>
          <td width="100">可用空间</td>
          <td width="70">文件夹数</td>
          <td width="70">文件数</td>
          <td width="130">创建时间</td>
          <td width="130">修改时间</td>
        </tr>
        <%
		Response.write "<tr height=18 bgcolor=#FFFFFF align=center>"
		Response.write "<td>"&hx.formatdsize(fileDir.Size)&"</td>"
		Response.write "<td>"
		Response.write hx.formatdsize(fileDrive.AvailableSpace)
		if err then
		Response.write "没有权限读取"
		error.clear
		end if
		Response.write "</td>"
		Response.write "<td>"&fileDir.SubFolders.Count&"</td>"
		Response.write "<td>"&fileDir.Files.Count&"</td>"						
		Response.write "<td>"&fileDir.DateCreated&"</td> "
		Response.write "<td>"&fileDir.DateLastModified&"</td> "
	
	Dim i,t1,t2,runtime,TestFileName
	Dim tempfo
	t1= timer()
	TestFileName=server.mappath("ITlearner_Test.txt")
	for i=1 to 30
	set tempfo=fo.CreateTextFile(TestFileName,true)
		tempfo.WriteLine "It's a test file."
	set tempfo=nothing
	set tempfo=fo.OpenTextFile(TestFileName,8,0)
		tempfo.WriteLine "It's a test file."
	set tempfo=nothing
	set tempfo=fo.GetFile(TestFileName)
		tempfo.delete True
	set tempfo=nothing	
	next
	t2=	timer()
	runtime=formatnumber((t2-t1)*1000,2)		 
%>
      </table>
      <table width=100% border=0 cellpadding=3 cellspacing=1 bgcolor="#0099CF" class="table_southidc">
        <tr bgcolor="#99CCFF" height=18> 
          <td colspan="2">&nbsp;&nbsp;<font face='Webdings'>4</font> 磁盘文件操作速度测试 (重复创建、写入、追加和删除文本文件30次，记录其所使用的时间)</td>
        </tr>
        <tr height=18> 
          <td width="400" align=center bgcolor="#FFFFFF"><font color="#000000">可 
            供 参 考 的 服 务 器 列 表</font></td>
          <td width="200"  align=center bgcolor="#FFFFFF"><font color="#000000">完成时间</font></td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td align=left>(CPU:Athlon1.6G&nbsp; 内存:512M)</td>
          <td>&nbsp;218.75 ~ 269.53 毫秒 </td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td align=left>(CPU:Celeron 2G&nbsp; 内存:512M)</td>
          <td>&nbsp;203.13 ~ 250.00 毫秒</td>
        </tr>
        <tr bgcolor="#FFFFFF" height=18> 
          <td align=left>(CPU:XEON2.4G 内存:2G)</td>
          <td>&nbsp;187.50 ~ 234.38 毫秒</td>
        </tr>
        
        <tr bgcolor="#FFFFFF" height=25> 
          <td align=left>&nbsp;<font color=red>您正在使用的这台服务器</font>&nbsp; <INPUT name="button2" type="button" class=backc onClick="document.location.href='<%=hx.FileName%>'" value="重新测试">          </td>
          <td>&nbsp;<font color=red><%=runtime%> 毫秒</font></td>
        </tr>
      </table>
      <%
	  	else
		Response.write "&nbsp;您的服务器或租用的空间不支持FSO组件，无法进行此项测试!"
	end if%>
    </td>
  </tr>
</table>
<br>
<%
End Sub
Sub SpeedTest
Response.Flush()
%>
<a name="SpeedTest"></a>
<%	if action="SpeedTest" then%>
<div id="testspeed"> 
  <table width="200" border="0" cellspacing="0" cellpadding="0" class="divcenter">
    <tr> 
      <td height="30" align=center><p><font color="#000000"><span id=txt1>网速测试中，请稍候...</span></font></p></td>
    </tr>
  </table>
</div>
<%	end if%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0099CF" class="table_southidc">
  <tr class="back_southidc"> 
    <td height="25" align="center" bgcolor="#0099CF" onClick="showsubmenu(3)"><font color="#000000"><strong>服务器连接速度</strong></font> 
      <%smenu(3)%>    </td>
  </tr>
  <tr> 
    <td bgcolor="#F8F9FC" style="display" id='submenu3'> <table width="100%" border="0" cellpadding=3 cellspacing=1 bgcolor="#FFFFFF" class="table_southidc">
        <tr bgcolor="#FFFFFF"> 
          <td width="80">接入设备</td>
          <td width="420">&nbsp;连接速度(理想值)</td>
          <td width="100">下载速度(理想值)</td>
        </tr>
<tr bgcolor="#FFFFFF"> 
          <td>56k Modem</td>
          <td>56 Kbps</td>
          <td>&nbsp;7.0 k/s</td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td>64k ISDN</td>
          <td>64 Kbps</td>
          <td>&nbsp;8.0 k/s</td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td>512k ADSL</td>
          <td>512 Kbps</td>
          <td>&nbsp;64.0 k/s</td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td height="19">1.5M Cable</td>
          <td>1500 Kbps</td>
          <td>&nbsp;187.5 k/s</td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td>5M FTTP</td>
          <td> 5000 Kbps</td>
          <td>&nbsp;625.0 k/s</td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td bgcolor="#FFFFFF">当前连接速度</td>
          <%
	if action="SpeedTest" then
		dim i
		Response.Write("<script language=""JavaScript"">var tSpeedStart=new Date();</script>")	
		Response.Write("<!--") & chr(13) & chr(10)
		for i=1 to 1000
		Response.Write("####################################################################################################") & chr(13) & chr(10)
		next
		Response.Write("-->") & chr(13) & chr(10)
		Response.Write("<script language=""JavaScript"">var tSpeedEnd=new Date();</script>") & chr(13) & chr(10)		
		Response.Write("<script language=""JavaScript"">")
		Response.Write("var iSpeedTime=0;iSpeedTime=(tSpeedEnd - tSpeedStart) / 1000;")
		Response.Write("if(iSpeedTime>0) iKbps=Math.round(Math.round(100 * 8 / iSpeedTime * 10.5) / 10); else iKbps=10000 ;")
		Response.Write("var iShowPer=Math.round(iKbps / 100);")		
		Response.Write("if(iShowPer<1) iShowPer=1;  else if(iShowPer>82)   iShowPer=82;")
		Response.Write("</script>") & chr(13) & chr(10)		
		Response.Write("<script language=""JavaScript"">") 
		Response.Write("document.write('<td> ' + iKbps + ' Kbps');")
		Response.Write("</script>") & chr(13) & chr(10)
		Response.Write("</td><td>&nbsp;<a href='?action=SpeedTest' title=测试连接速度><u>")
		Response.Write("<script language=""JavaScript"">")
		Response.Write("document.write(Math.round(iKbps/8*10)/10+ ' k/s');")		
		Response.Write("</script>") & chr(13) & chr(10)				
		Response.Write 	"</u></a></td>"
%>
<script>
txt1.innerHTML="网速测试完毕!"
testspeed.style.visibility="hidden"
</script>
<%
	else
		Response.Write "<td></td><td>&nbsp;<a href='?action=SpeedTest' title=测试连接速度><u>开始测试</u></a></td>"
	end if
%>
        </tr>
      </table></td>
  </tr>
</table>
<%End Sub%>
</BODY>
</HTML>
