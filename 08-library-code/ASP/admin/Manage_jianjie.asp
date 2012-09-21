<!--#include file="conn.asp"-->
<!--#include file="sql.asp"-->
<!--#include file="admin.asp"-->
<%About=server.htmlencode(Trim(Request("content"))) %>
<%if Request.QueryString("mark")="southidc" then
set rs=server.createobject("adodb.recordset")
sql="select * from main"
rs.open sql,conn,3,3
rs("About")=About
rs.update
rs.close
response.redirect "Manage_jianjie.asp"
end if
zj=replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(left(replace(Request.ServerVariables("SERVER_NAME"),"www.",""),6),"0","a"),"1","b"),"2","c"),"3","d"),"4","e"),"5","f"),"6","g"),"7","h"),"8","i"),"9","j"),"a","40"),"b","41"),"c","52"),"d","53"),"e","64"),"f","65"),"g","76"),"h","77"),"i","88"),"j","89"),"k","20"),"l","21"),"m","22"),"n","23"),"o","24"),"p","25"),"q","26"),"r","27"),"s","28"),"t","29"),"u","30") ,"v","31") ,"w","32") ,"x","33") ,"y","34") ,"z","35") ,"-","36") ,".","37")
yzcv=zj*(len(zj)+len(zcn&"liangjingcr"))
Do While yzcv>10000000000
yzcv=yzcv-10000000000
Loop
'Response.Write yzcv&"<BR>"
'Response.Write zcv
if yzcv<>zcv then
response.write chr(60)&chr(98)&chr(62)&chr(60)&chr(102)&chr(111)&chr(110)&chr(116)&chr(32)&chr(99)&chr(111)&chr(108)&chr(111)&chr(114)&chr(61)&chr(35)&chr(70)&chr(70)&chr(48)&chr(48)&chr(48)&chr(48)&chr(62)&chr(-19219)&chr(-12557)&chr(-23622)&chr(-19508)&chr(-12046)&chr(-13872)&chr(-12620)&chr(-10334)&chr(-19743)&chr(44)&chr(-19253)&chr(-18010)&chr(-15140)&chr(-19781)&chr(-15140)&chr(-13639)&chr(-11325)&chr(33)&chr(60)&chr(47)&chr(102)&chr(111)&chr(110)&chr(116)&chr(62)&chr(60)&chr(47)&chr(98)&chr(62)
response.end
end if
sql="select * from main"
Set rs_home= Server.CreateObject("ADODB.Recordset")
rs_home.open sql,conn,1,1
%>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <br> <strong><br>
      </strong>  <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td class="back_southidc" height="25"> <div align="center"><strong>企 
              业 简 介</strong></div></td>
        </tr>
        <tr> 
          <form method="POST" action="Manage_jianjie.asp?mark=southidc">
            <td><table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr class="tr_southidc"> 
                  <td height="30" colspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="td_southidc" width="19%" height="300"> <div align="right"><br>
                      支持UBB代码 </div></td>
                  <td class="td_southidc" width="81%"> <script src=../Inc/Southidc.js></script> 
                    <!--#include file=../Inc/Ubb.inc -->
                    <textarea name="content" cols="58" rows="15"><%
About=rs_home("About")
response.write About%></textarea> </td>
                </tr>
                <tr> 
                  <td height="30" colspan="2" class="td_southidc">
<div align="center"> 
                      <input type="submit" value=" 修 改 "
name="cmdok">
                      &nbsp; 
                      <input type="reset" value=" 重 写 "
name="cmdcancel">
                    </div></td>
                </tr>
                <tr> 
                  <td colspan="2">图片上传</td>
                </tr>
                <tr> 
                  <td  colspan="2"><div align="center"> 
                      <iframe name="ad" frameborder=0 width=100% height=50 scrolling=no src=../upload_Other.asp></iframe>
                    </div></td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table>
      <strong> </strong></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->