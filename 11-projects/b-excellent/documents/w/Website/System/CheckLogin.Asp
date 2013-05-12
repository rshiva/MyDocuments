<!--#include file="../Include/Const.Asp"-->
<!--#include file="../Include/ConnSiteData.Asp"-->
<!--#include file="../Include/Md5.Asp"-->
<%
Dim LoginName, LoginPassword, AdminName, Password, AdminPurview, Working, UserName, rs, sql
LoginName = ReplaceBadChar(Trim(request.Form("UserName")))
LoginPassword = Md5(ReplaceBadChar(request.Form("password")))
CheckCode = LCase(ReplaceBadChar(Trim(Request("CheckCode"))))
Call SiteInfo
If CheckCode = "" Then
    response.Write "<script language='JavaScript'>alert('验证码不能为空，请返回检查！');" & "history.back()" & "</script>"
    response.End
End If
If Trim(Session("CheckCode")) = "" Then
    response.Write "<script language='JavaScript'>alert('您在管理登录停留的时间过长，导致验证码失效。\n请重新返回登录页面进行登录。');" & "history.back()" & "</script>"
    response.End
End If
If CheckCode <> Session("CheckCode") Then
    response.Write "<script language='JavaScript'>alert('您输入的验证码和系统产生的不一致，请重新输入。');" & "history.back()" & "</script>"
    response.End
End If
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from Qianbo_Admin where AdminName='"&LoginName&"'"
rs.Open sql, conn, 1, 3
If rs.EOF Then
    response.Write "<script language='JavaScript'>alert('无此帐号，请返回检查！');" & "history.back()" & "</script>"
    response.End
Else
    AdminName = rs("AdminName")
    Password = rs("Password")
    AdminPurview = rs("AdminPurview")
    Working = rs("Working")
    UserName = rs("UserName")
End If
If LoginPassword<>Password Then
    response.Write "<script language='JavaScript'>alert('密码错误，请返回检查！');" & "history.back()" & "</script>"
    response.End
End If
If Not Working Then
    response.Write "<script language='JavaScript'>alert('帐号被禁用！');" & "history.back()" & "</script>"
    response.End
End If
If LoginName = AdminName And LoginPassword = Password Then
    rs("LastLoginTime") = Now()
    rs("LastLoginIP") = Request.ServerVariables("Remote_Addr")
    rs.update
    rs.Close
    Set rs = Nothing
    session("AdminName") = AdminName
    session("UserName") = UserName
    session("AdminPurview") = AdminPurview
    session("LoginSystem") = "Succeed"
    session.timeout = 60
    Response.Cookies("AdminLoginCode") = AdminLoginCode
    Dim LoginIP, LoginTime, LoginSoft
    LoginIP = Request.ServerVariables("Remote_Addr")
    LoginSoft = Request.ServerVariables("http_user_agent")
    LoginTime = Now()
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from Qianbo_AdminLog"
    rs.Open sql, conn, 1, 3
    rs.addnew
    rs("AdminName") = AdminName
    rs("UserName") = UserName
    rs("LoginIP") = LoginIP
    rs("LoginSoft") = LoginSoft
    rs("LoginTime") = LoginTime
    rs.update
    rs.Close
    Set rs = Nothing
    response.redirect "Admin_Index.Asp"
    response.End
End If
%>