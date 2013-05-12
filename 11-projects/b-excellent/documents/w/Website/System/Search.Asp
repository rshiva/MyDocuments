<!--#include file="../Include/Const.Asp" -->
<!--#include file="../Include/ConnSiteData.Asp" -->
<!--#include file="CheckAdmin.Asp"-->
<%
Dim Result
Result = request.QueryString("Result")
Dim Keyword
Keyword = request.Form("Keyword")
Select Case Result
    Case "Members"
        response.redirect ("MemList.Asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
    Case "News"
        response.redirect ("NewsList.Asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
    Case "Download"
        response.redirect ("DownList.Asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
    Case "Products"
        response.redirect ("ProductList.Asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
    Case "Jobs"
        response.redirect ("JobsList.Asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
    Case "Message"
        response.redirect ("MessageList.Asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
    Case "Order"
        response.redirect ("OrderList.Asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
    Case "Talents"
        response.redirect ("TalentsList.Asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
    Case "Others"
        response.redirect ("OthersList.Asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
    Case "UserMessage"
        response.redirect ("UserMessage.Asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
    Case Else
End Select
%>