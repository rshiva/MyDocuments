<%
Dim AdminAction
AdminAction = request.QueryString("AdminAction")
Select Case AdminAction
    Case "Out"
        Call OutLogin()
    Case Else
        Call Login()
End Select

Sub Login()
    If session("AdminName") = "" Or session("UserName") = "" Or session("AdminPurview") = "" Or session("LoginSystem")<>"Succeed" Then
        response.redirect "Admin_Login.Asp"
        response.End
    End If
End Sub

Sub OutLogin()
    session.contents.Remove "AdminName"
    session.contents.Remove "UserName"
    session.contents.Remove "AdminPurview"
    session.contents.Remove "LoginSystem"
    session.contents.Remove "VerifyCode"
    response.redirect "Admin_Login.Asp"
End Sub
%>