<!--#include file="CheckAdmin.Asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="AdminDefaultTheme/MasterPage.css" type="text/css" rel="stylesheet" />
<link href="AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<title>管理导航菜单</title>
<script type="text/javascript">
<!--
function Creathtml()
{
    var bln=confirm("请确定是否操作？");
    return bln;
}
function CreathtmlAll()
{
    var bln=confirm("请确定是否操作？");
    return bln;
}
-->
</script>
</head>

<body id="Guidebody">
  <div id="Guide_back">
    <ul>
      <li id="Guide_top">
        <div id="Guide_toptext">快捷导航</div>
      </li>
      <li id="Guide_main">
        <div id="Guide_box">
          <div class="guide">
            <ul id="Links">
<%
Select Case Request("ID")
    Case "System"
        Call System()
    Case "News"
        Call News()
    Case "DownLoad"
        Call DownLoad()
    Case "Other"
        Call Other()
    Case "Feedback"
        Call Feedback()
    Case "User"
        Call User()
    Case Else
        Call System()
End Select
%>
              <%Sub System%>
                <li><a href="SetSite.Asp" target="main_right">网站参数设置</a></li>
                <li><a href="FriendLinkEdit.Asp?Result=Add" target="main_right">友情链接添加</a></li>
                <li><a href="FriendLinkList.Asp" target="main_right">友情链接管理</a></li>
                <li><a href="dispcont.asp" target="main_right">访问信息查看</a></li>
              <%End Sub%>
              <%Sub News%>
                <li><a href="NewsSort.Asp?Action=Add&ParentID=0" target="main_right">文章类别管理</a></li>
                <li><a href="NewsList.Asp" target="main_right">文章列表管理</a></li>
                <li><a href="NewsEdit.Asp?Result=Add" target="main_right">添加文章</a></li>
                <li><a href="AboutList.Asp" target="main_right">企业信息列表</a></li>
                <li><a href="AboutEdit.Asp?Result=Add" target="main_right">添加企业信息</a></li>
              <%End Sub%>
              <%Sub DownLoad%>
                <li><a href="DownSort.Asp?Action=Add&ParentID=0" target="main_right">信息类别管理</a></li>
                <li><a href="DownList.Asp" target="main_right">信息列表管理</a></li>
                <li><a href="DownEdit.Asp?Result=Add" target="main_right">添加信息</a></li>
              <%End Sub%>
              <%Sub Other%>
                <li><a href="OthersSort.Asp?Action=Add&ParentID=0" target="main_right">信息类别管理</a></li>
                <li><a href="OthersList.Asp" target="main_right">信息列表管理</a></li>
                <li><a href="OthersEdit.Asp?Result=Add" target="main_right">添加信息</a></li>
              <%End Sub%>
              <%Sub Feedback%>
                <li><a href="MessageList.Asp" target="main_right">留言信息管理</a></li>
              <%End Sub%>
              <%Sub User%>
                <li><a href="AdminList.Asp" target="main_right">网站管理员管理</a></li>
                <li><a href="AdminEdit.Asp?Result=Add" target="main_right">添加网站管理员</a></li>
                <li><a href="ManageLog.Asp" target="main_right">后台登录日志管理</a></li>
              <%End Sub%>
            </ul>
          </div>
        </div>
      </li>
      <li id="Guide_bottom"></li>
    </ul>
  </div>
</body>
</html>