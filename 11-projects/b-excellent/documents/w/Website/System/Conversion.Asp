<!--#include file="../Include/Const.Asp" -->
<!--#include file="../Include/ConnSiteData.Asp" -->
<!--#include file="CheckAdmin.Asp"-->
<%
ID = request.QueryString("ID")
LX = request.QueryString("LX")
Operation = request.QueryString("Operation")
strReferer = Request.ServerVariables("http_referer")
If Operation = "up" Then
    Conn.Execute "update "&LX&" set ViewFlag = 1 where ID=" & ID
Else
    Conn.Execute "update "&LX&" set ViewFlag = 0 where ID=" & ID
End If
response.Redirect strReferer
%>