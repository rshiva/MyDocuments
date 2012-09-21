<%@language=vbscript codepage=936 %>
<!--#include file="conn.asp"-->
<!--#include file="sql.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim rs
dim sql
dim count
set rs=server.createobject("adodb.recordset")
sql = "select * from SmallClass_New order by SmallClassID asc"
rs.open sql,conn,1,1
%>
<script language = "JavaScript">
var onecount;
subcat = new Array();
        <%
        count = 0
        do while not rs.eof 
        %>
subcat[<%=count%>] = new Array("<%= trim(rs("SmallClassName"))%>","<%= trim(rs("BigClassName"))%>","<%= trim(rs("SmallClassName"))%>");
        <%
        count = count + 1
        rs.movenext
        loop
        rs.close
        %>
onecount=<%=count%>;

function changelocation(locationid)
    {
    document.myform.SmallClassName.length = 1; 
    var locationid=locationid;
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { 
                document.myform.SmallClassName.options[document.myform.SmallClassName.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
    }    

function AddItem(strFileName){
  document.myform.IncludePic.checked=true;
  document.myform.DefaultPicUrl.value=strFileName;
  document.myform.DefaultPicList.options[document.myform.DefaultPicList.length]=new Option(strFileName,strFileName);
  document.myform.DefaultPicList.selectedIndex+=1;
  if(document.myform.UploadFiles.value==''){
	document.myform.UploadFiles.value=strFileName;
  }
  else{
    document.myform.UploadFiles.value=document.myform.UploadFiles.value+"|"+strFileName;
  }
}

function CheckForm()
{
    if (editor.EditMode.checked==true)
	  document.myform.Content.value=editor.HtmlEdit.document.body.innerText;
    else
	  document.myform.Content.value=editor.HtmlEdit.document.body.innerHTML; 

	if (document.myform.title.value.length == 0) {
		alert("新闻标题没有填写.");
		document.myform.title.focus();
		return false;
	}
	if (document.myform.BigClassName.value.length == 0) {
		alert("新闻大类没有选");
		document.myform.BigClassName.focus();
		return false;
	}
	
		if (document.myform.user.value.length == 0) {
		alert("新闻发布人没有填写");
		document.myform.user.focus();
		return false;
	}
	return true;
}
</script>
<!-- #include file="Inc/Head.asp" -->

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top">
	<table width="620" border="0" cellpadding="2" cellspacing="1" bgcolor="#E3E3E3" class="table_southidc">
        <form method="POST" name="myform" onSubmit="return CheckForm();" action="News_save.asp?action=Add" target="_self">
          <tr> 
            <td height="30" colspan="2" align="center" class="back_southidc" style="font-weight: bold">添 加 新 闻</td>
          </tr>
          <tr bgcolor="#E3E3E3"> 
            <td width="159" height="25"><font color="#FF0000">*</font>新闻标题：</td>
            <td width="476"> <input name="title" type="text" class="input" size="50" maxlength="200"></td>
          </tr>
          <tr bgcolor="#E3E3E3"> 
            <td height="25"><font color="#FF0000">*</font>新闻类别：</td>
            <td bgcolor="#E3E3E3"> <%		
        sql = "select * from BigClass_New"
        rs.open sql,conn,1,1
		if rs.eof and rs.bof then
			response.write "请先添加栏目。"
		else
		%> <select name="BigClassName" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">
                <option selected value="<%=trim(rs("BigClassName"))%>"><%=trim(rs("BigClassName"))%></option>
                <%
			dim selclass
		    selclass=rs("BigClassName")
        	rs.movenext
		    do while not rs.eof
			%>
                <option value="<%=trim(rs("BigClassName"))%>"><%=trim(rs("BigClassName"))%></option>
                <%
		        rs.movenext
    	    loop
		end if
        rs.close
			%>
              </select> <select name="SmallClassName">
                <option value="" selected>不指定小类</option>
                <%
			sql="select * from SmallClass_New where BigClassName='" & selclass & "'"
			rs.open sql,conn,1,1
			if not(rs.eof and rs.bof) then
			%>
                <option value="<%=rs("SmallClassName")%>"><%=rs("SmallClassName")%></option>
                <% rs.movenext
				do while not rs.eof%>
                <option value="<%=rs("SmallClassName")%>"><%=rs("SmallClassName")%></option>
                <%
			    	rs.movenext
				loop
			end if
	        rs.close
			%>
                <%
			ranNum=int(9*rnd)+10
			iddata=month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum
			%>
              </select></td>
          </tr>
          <tr bgcolor="#ECF5FF" class="back_southidc">
            <td height="25" colspan="2" align="center" valign="top">新闻内容</td>
          </tr>
          <tr bgcolor="#E3E3E3"> 
            <td height="25" colspan="2" valign="top"><div align="left">
                <textarea name="Content" style="display:none"></textarea>
                <iframe ID="editor" src="../editor.asp" frameborder=1 scrolling=no width="620" height="405"></iframe>
              </div></td>
          </tr>
          
          <tr bgcolor="#E3E3E3"> 
            <td height="25"><font color="#FF0000">*</font>发布人：</td>
            <td> <input name="user" type="text" class="input" value="<%=session("AdminName")%>" size="30"></td>
          </tr>
          
          <tr bgcolor="#E3E3E3"> 
            <td height="30" align="center"><div align="left">录入时间：</div></td>
            <td height="30" align="center"><div align="left"> 
                <input name="Infotime" type="text" id="Infotime" value="<%=now()%>" maxlength="50">
              </div></td>
          </tr>
          <tr> 
            <td height="30" colspan="2" align="center" bgcolor="#E3E3E3"> <input type="submit" name="Submit" value="提交" class="input">
              　 
              <input type="reset" name="Submit" value="重置" class="input"> </td>
          </tr>
        </form>
      </table></td>
  </tr>
</table>