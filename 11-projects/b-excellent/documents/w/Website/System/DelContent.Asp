<!--#include file="../Include/Const.Asp" -->
<!--#include file="../Include/ConnSiteData.Asp" -->
<!--#include file="CheckAdmin.Asp"-->
<%
Dim Result, Selectid
Dim ix, tempx, selectx, len_idx
Result = request.QueryString("Result")
SelectID = request.Form("SelectID")
Call SiteInfo
Select Case Result
    Case "Administrators"
        Select Case Trim(Request.Form("batch"))
        Case "批量生效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Admin set Working = 1 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "批量失效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Admin set Working = 0 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "删除所选"
            If SelectID<>"" Then conn.Execute "delete from Qianbo_Admin where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
    End Select
    Case "LoginLog"
        If SelectID<>"" Then conn.Execute "delete from Qianbo_AdminLog where id in ("&SelectID&")"
        response.redirect request.servervariables("http_referer")
    Case "MemGroup"
        If SelectID<>"" Then conn.Execute "delete from Qianbo_MemGroup where GroupID in ('"&SelectID&"')"
        conn.Execute "Update Qianbo_About set GroupID='200603281858588888' , Exclusive='>=' where GroupID = '"&SelectID&"'"
        conn.Execute "Update Qianbo_Download set GroupID='200603281858588888' , Exclusive='>=' where GroupID = '"&SelectID&"'"
        conn.Execute "Update Qianbo_Members set GroupID='200603281858588888' , GroupName='临时游客' where GroupID = '"&SelectID&"'"
        conn.Execute "Update Qianbo_News set GroupID='200603281858588888' , Exclusive='>=' where GroupID = '"&SelectID&"'"
        conn.Execute "Update Qianbo_Others set GroupID='200603281858588888' , Exclusive='>=' where GroupID = '"&SelectID&"'"
        conn.Execute "Update Qianbo_Products set GroupID='200603281858588888' , Exclusive='>=' where GroupID = '"&SelectID&"'"
        response.redirect request.servervariables("http_referer")
    Case "Members"
        Select Case Trim(Request.Form("batch"))
        Case "批量生效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Members set Working = 1 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "批量失效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Members set Working = 0 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "删除所选"
            If SelectID<>"" Then conn.Execute "delete from Qianbo_Members where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
    End Select
    Case "About"
        If SelectID<>"" Then conn.Execute "delete from Qianbo_About where id in ("&SelectID&")"
        response.redirect request.servervariables("http_referer")
    Case "Products"
        Select Case Trim(Request.Form("batch"))
        Case "批量生效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Products set ViewFlag = 1 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "批量失效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Products set ViewFlag = 0 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "删除所选"
            If SelectID<>"" Then conn.Execute "delete from Qianbo_Products where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
    End Select
    Case "News"
        Select Case Trim(Request.Form("batch"))
        Case "批量生效"
            If SelectID<>"" Then conn.Execute "update Qianbo_News set ViewFlag = 1 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "批量失效"
            If SelectID<>"" Then conn.Execute "update Qianbo_News set ViewFlag = 0 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "删除所选"
            If SelectID<>"" Then conn.Execute "delete from Qianbo_News where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
    End Select
    Case "Download"
        Select Case Trim(Request.Form("batch"))
        Case "批量生效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Download set ViewFlag = 1 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "批量失效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Download set ViewFlag = 0 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "删除所选"
            If SelectID<>"" Then conn.Execute "delete from Qianbo_Download where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
    End Select
    Case "Jobs"
        Select Case Trim(Request.Form("batch"))
        Case "批量生效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Jobs set ViewFlag = 1 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "批量失效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Jobs set ViewFlag = 0 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "删除所选"
            If SelectID<>"" Then conn.Execute "delete from Qianbo_Jobs where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
    End Select
    Case "Message"
        Select Case Trim(Request.Form("batch"))
        Case "批量生效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Message set ViewFlag = 1 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "批量失效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Message set ViewFlag = 0 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "删除所选"
            If SelectID<>"" Then conn.Execute "delete from Qianbo_Message where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
    End Select
    Case "Order"
        If SelectID<>"" Then conn.Execute "delete from Qianbo_Order where id in ("&SelectID&")"
        response.redirect request.servervariables("http_referer")
    Case "Talents"
        If SelectID<>"" Then conn.Execute "delete from Qianbo_Talents where id in ("&SelectID&")"
        response.redirect request.servervariables("http_referer")
    Case "Navigation"
        Select Case Trim(Request.Form("batch"))
        Case "批量生效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Navigation set ViewFlag = 1 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "批量失效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Navigation set ViewFlag = 0 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "删除所选"
            If SelectID<>"" Then conn.Execute "delete from Qianbo_Navigation where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
    End Select
    Case "FriendLink"
        Select Case Trim(Request.Form("batch"))
        Case "批量生效"
            If SelectID<>"" Then conn.Execute "update Qianbo_FriendLink set ViewFlag = 1 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "批量失效"
            If SelectID<>"" Then conn.Execute "update Qianbo_FriendLink set ViewFlag = 0 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "删除所选"
            If SelectID<>"" Then conn.Execute "delete from Qianbo_FriendLink where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
    End Select
    Case "Others"
        Select Case Trim(Request.Form("batch"))
        Case "批量生效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Others set ViewFlag = 1 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "批量失效"
            If SelectID<>"" Then conn.Execute "update Qianbo_Others set ViewFlag = 0 where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
        Case "删除所选"
            If SelectID<>"" Then conn.Execute "delete from Qianbo_Others where id in ("&SelectID&")"
            response.redirect request.servervariables("http_referer")
    End Select
    Case Else
End Select
%>