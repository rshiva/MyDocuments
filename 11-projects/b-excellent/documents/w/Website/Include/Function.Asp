<%
Function ReplaceBadChar(strChar)
    If strChar = "" Or IsNull(strChar) Then
        ReplaceBadChar = ""
        Exit Function
    End If
    Dim strBadChar, arrBadChar, tempChar, i
    strBadChar = "+,',%,^,&,?,(,),<,>,[,],{,},/,\,;,:," & Chr(34) & "," & Chr(0) & ",--"
    arrBadChar = Split(strBadChar, ",")
    tempChar = strChar
    For i = 0 To UBound(arrBadChar)
        tempChar = Replace(tempChar, arrBadChar(i), "")
    Next
    tempChar = Replace(tempChar, "@@", "@")
    ReplaceBadChar = tempChar
End Function

Function ReplaceConstChar(strChar)
    If strChar = "" Or IsNull(strChar) Then
        ReplaceConstChar = ""
        Exit Function
    End If
    Dim strBadChar, arrBadChar, tempChar, i
    strBadChar = "+,',%,^,&,?,(,),<,>,[,],{,},," & Chr(0) & ""
    arrBadChar = Split(strBadChar, ",")
    tempChar = strChar
    For i = 0 To UBound(arrBadChar)
        tempChar = Replace(tempChar, arrBadChar(i), "")
    Next
    tempChar = Replace(tempChar, "@@", "@")
    ReplaceConstChar = tempChar
End Function

Function StrLen(Str)
    If Str = "" Or IsNull(Str) Then
        StrLen = 0
        Exit Function
    Else
        Dim regex
        Set regex = New regexp
        regEx.Pattern = "[^\x00-\xff]"
        regex.Global = True
        Str = regEx.Replace(Str, "^^")
        Set regex = Nothing
        StrLen = Len(Str)
    End If
End Function

Function StrLeft(Str, StrLen)
    Dim L, T, I, C
    If Str = "" Then
        StrLeft = ""
        Exit Function
    End If
    Str = Replace(Replace(Replace(Replace(Str, "&nbsp;", " "), "&quot;", Chr(34)), "&gt;", ">"), "&lt;", "<")
    L = Len(Str)
    T = 0
    For i = 1 To L
        C = Abs(AscW(Mid(Str, i, 1)))
        If C>255 Then
            T = T + 2
        Else
            T = T + 1
        End If
        If T>= StrLen Then
            StrLeft = Left(Str, i) & "…"
            Exit For
        Else
            StrLeft = Str
        End If
    Next
    StrLeft = Replace(Replace(Replace(Replace(StrLeft, " ", "&nbsp;"), Chr(34), "&quot;"), ">", "&gt;"), "<", "&lt;")
End Function

Function StrReplace(Str)
    If Str = "" Or IsNull(Str) Then
        StrReplace = ""
        Exit Function
    Else
        StrReplace = Replace(Str, " ", "&nbsp;")
        StrReplace = Replace(StrReplace, Chr(13), "&lt;br&gt;")
        StrReplace = Replace(StrReplace, "<", "&lt;")
        StrReplace = Replace(StrReplace, ">", "&gt;")
    End If
End Function

Function ReStrReplace(Str)
    If Str = "" Or IsNull(Str) Then
        ReStrReplace = ""
        Exit Function
    Else
        ReStrReplace = Replace(Str, "&nbsp;", " ")
        ReStrReplace = Replace(ReStrReplace, "<br />", Chr(13))
        ReStrReplace = Replace(ReStrReplace, "&lt;br&gt;", Chr(13))
        ReStrReplace = Replace(ReStrReplace, "&lt;", "<")
        ReStrReplace = Replace(ReStrReplace, "&gt;", ">")
    End If
End Function

Function HtmlStrReplace(Str)
    If Str = "" Or IsNull(Str) Then
        HtmlStrReplace = ""
        Exit Function
    Else
        HtmlStrReplace = Replace(Str, "&lt;br&gt;", "<br />")
    End If
End Function

Function ViewNoRight(GroupID, Exclusive)
    Dim rs, sql, GroupLevel
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select GroupLevel from Qianbo_MemGroup where GroupID='"&GroupID&"'"
    rs.Open sql, conn, 1, 1
    GroupLevel = rs("GroupLevel")
    rs.Close
    Set rs = Nothing
    ViewNoRight = True
    If session("GroupLevel") = "" Then session("GroupLevel") = 0
    Select Case Exclusive
        Case ">="
            If Not session("GroupLevel") >= GroupLevel Then
                ViewNoRight = False
            End If
        Case "="
            If Not session("GroupLevel") = GroupLevel Then
                ViewNoRight = False
            End If
    End Select
End Function

Function GetUrl()
    GetUrl = "http://"&Request.ServerVariables("SERVER_NAME")&Request.ServerVariables("URL")
    If Request.ServerVariables("QUERY_STRING")<>"" Then GetURL = GetUrl&"?"& Request.ServerVariables("QUERY_STRING")
End Function

Function HtmlSmallPic(GroupID, PicPath, Exclusive)
    Dim rs, sql, GroupLevel
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select GroupLevel from Qianbo_MemGroup where GroupID='"&GroupID&"'"
    rs.Open sql, conn, 1, 1
    GroupLevel = rs("GroupLevel")
    rs.Close
    Set rs = Nothing
    HtmlSmallPic = PicPath
    If session("GroupLevel") = "" Then session("GroupLevel") = 0
    Select Case Exclusive
        Case ">="
            If Not session("GroupLevel") >= GroupLevel Then HtmlSmallPic = "../Images/NoRight.jpg"
        Case "="
            If Not session("GroupLevel") = GroupLevel Then HtmlSmallPic = "../Images/NoRight.jpg"
    End Select
    If HtmlSmallPic = "" Or IsNull(HtmlSmallPic) Then HtmlSmallPic = "../Images/NoPicture.jpg"
End Function

Function IsValidMemName(memname)
    Dim i, c
    IsValidMemName = True
    If Not (3<= Len(memname) And Len(memname)<= 16) Then
        IsValidMemName = False
        Exit Function
    End If
    For i = 1 To Len(memname)
        c = Mid(memname, i, 1)
        If InStr("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-", c) <= 0 And Not IsNumeric(c) Then
            IsValidMemName = False
            Exit Function
        End If
    Next
End Function

Function IsValidEmail(email)
    Dim names, Name, i, c
    IsValidEmail = True
    names = Split(email, "@")
    If UBound(names) <> 1 Then
        IsValidEmail = False
        Exit Function
    End If
    For Each Name in names
        If Len(Name) <= 0 Then
            IsValidEmail = False
            Exit Function
        End If
        For i = 1 To Len(Name)
            c = Mid(Name, i, 1)
            If InStr("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-.", c) <= 0 And Not IsNumeric(c) Then
                IsValidEmail = False
                Exit Function
            End If
        Next
        If Left(Name, 1) = "." Or Right(Name, 1) = "." Then
            IsValidEmail = False
            Exit Function
        End If
    Next
    If InStr(names(1), ".") <= 0 Then
        IsValidEmail = False
        Exit Function
    End If
    i = Len(names(1)) - InStrRev(names(1), ".")
    If i <> 2 And i <> 3 Then
        IsValidEmail = False
        Exit Function
    End If
    If InStr(email, "..") > 0 Then
        IsValidEmail = False
    End If
End Function

Function FormatDate(DateAndTime, Format)
    On Error Resume Next
    Dim yy, y, m, d, h, mi, s, strDateTime
    FormatDate = DateAndTime
    If Not IsNumeric(Format) Then Exit Function
    If Not IsDate(DateAndTime) Then Exit Function
    yy = CStr(Year(DateAndTime))
    y = Mid(CStr(Year(DateAndTime)), 3)
    m = CStr(Month(DateAndTime))
    If Len(m) = 1 Then m = "0" & m
    d = CStr(Day(DateAndTime))
    If Len(d) = 1 Then d = "0" & d
    h = CStr(Hour(DateAndTime))
    If Len(h) = 1 Then h = "0" & h
    mi = CStr(Minute(DateAndTime))
    If Len(mi) = 1 Then mi = "0" & mi
    s = CStr(Second(DateAndTime))
    If Len(s) = 1 Then s = "0" & s
    Select Case Format
        Case "1"
            strDateTime = y & "-" & m & "-" & d & " " & h & ":" & mi & ":" & s
        Case "2"
            strDateTime = yy & m & d & h & mi & s
        Case "3"
            strDateTime = yy & m & d & h & mi
        Case "4"
            strDateTime = yy & "年" & m & "月" & d & "日"
        Case "5"
            strDateTime = m & "-" & d
        Case "6"
            strDateTime = m & "/" & d
        Case "7"
            strDateTime = m & "月" & d & "日"
        Case "8"
            strDateTime = y & "年" & m & "月"
        Case "9"
            strDateTime = y & "-" & m
        Case "10"
            strDateTime = y & "/" & m
        Case "11"
            strDateTime = y & "-" & m & "-" & d
        Case "12"
            strDateTime = y & "/" & m & "/" & d
        Case "13"
            strDateTime = yy & "." & m & "." & d
        Case "14"
            strDateTime = yy & "-" & m & "-" & d
        Case Else
            strDateTime = DateAndTime
    End Select
    FormatDate = strDateTime
End Function

Function WriteMsg(Message)
    response.Write "<script language='JavaScript'>alert('"&Message&"');" & "history.back()" & "</script>"
End Function

Public SiteTitle, SiteUrl, ComName, Address, ZipCode, Telephone, Fax, Email, Keywords, Descriptions, Video, IcpNumber, MesViewFlag, SiteLogo, SiteDetail

Sub SiteInfo()
    Dim rs, sql
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select top 1 * from Qianbo_Site"
    rs.Open sql, conn, 1, 1
    SiteTitle = rs("SiteTitle")
    Keywords = rs("Keywords")
    Descriptions = rs("Descriptions")
    SiteUrl = rs("SiteUrl")
    ComName = rs("ComName")
    Address = rs("Address")
    ZipCode = rs("ZipCode")
    Telephone = rs("Telephone")
    Fax = rs("Fax")
    Email = rs("Email")
    Video = rs("Video")
    IcpNumber = rs("IcpNumber")
    MesViewFlag = rs("MesViewFlag")
    SiteLogo = rs("SiteLogo")
    SiteDetail = rs("SiteDetail")
    rs.Close
    Set rs = Nothing
End Sub

Function CheckStr(Strer, Num)
    Dim Shield, w
    If Strer = "" Or IsNull(Strer) Then Exit Function
    Select Case Num
        Case 1
            If IsNumeric(Strer) = 0 Then
                Response.Write "操作错误"
                Response.End
            End If
            Strer = Int(Strer)
    End Select
    CheckStr = Strer
End Function
%>