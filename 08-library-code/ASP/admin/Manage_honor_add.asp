<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<%if Request.QueryString("mark")="southidc" then%>
<%
title=server.htmlencode(Trim(Request("title")))
img=server.htmlencode(Trim(Request("img")))
%>

<%
If title="" Then
response.write "SORRY <br>"
response.write "请输入更新内容的标题!!<a href=""javascript:history.go(-1)"">返回重输</a>"
response.end
end if
If img="" Then
response.write "SORRY <br>"
response.write "内容不能为空!!<a href=""javascript:history.go(-1)"">返回重输</a>"
response.end
end if

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from honor "
rs.open sql,conn,1,3
rs.addnew
rs("title")=title
rs("img")=img
rs("Time")=Date()
rs.update
rs.close
response.redirect "Manage_honor.asp"
end if
%>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
 <form method="post" name="myform" action="Manage_honor_add.asp?mark=southidc">
  <tr> 
    <td align="center" valign="top"> <br> <br>
      <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr bgcolor="#ECF5FF" class="back_southidc">
          <td height="25" colspan="2" align="center"><span style="font-weight: bold">添加企业荣誉</span></td>
        </tr>
        <tr bgcolor="#E3E3E3">
          <td width="8%" height="25"><div align="center">荣誉名称</div></td>
          <td width="62%" height="25"><input type="text" name="title" class="inputtext" maxlength="30" size="25"></td>
        </tr>
        <tr bgcolor="#ECF5FF">
          <td height="25" bgcolor="#E3E3E3"><div align="center">荣誉证书</div></td>
          <td height="25" bgcolor="#E3E3E3"><input name="img" type="text" class="inputtext" id="img" size="30" maxlength="50">
              <font color="#FF0000"> * 图片地址</font></td>
        </tr>
        <tr bgcolor="#ECF5FF">
          <td height="25" colspan="2" bgcolor="#E3E3E3"><div align="center">
              <input name="submit" type="submit" value="确定">
            &nbsp;
            <input name="reset" type="reset" value="取消">
          </div></td>
        </tr>
        <tr>
          <td height="25" colspan="2" bgcolor="#E3E3E3">图片上传</td>
        </tr>
        <tr>
          <td height="25" colspan="2" bgcolor="#E3E3E3"><div align="left">
              <iframe style="top:2px" ID="UploadFiles" src="../upload_Photo.asp?PhotoUrlID=3" frameborder=0 scrolling=no width="300" height="25"></iframe>
          </div></td>
        </tr>
      </table>
      <br> </td>
  </tr>
   </form>
</table>