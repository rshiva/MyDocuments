<!--#include file="mysqlfire.asp"-->
<!--#include file="ordersec.asp"-->
<!--#include file="orderconn.asp"-->
<%
'#############################################################
'#              贺喜支付平台支付接口定单管理系统
'#                            v2.0
'#                   http://www.168reg.cn
'#
'#  版权所有: 株洲市和谐网络科技发展有限公司
'#
'#  主页地址: http://www.168reg.cn
'#  技术支持: support@168reg.cn
'#  技 术 QQ: 359465724
'#  技术QQ群：8246422，7048987
'#
'#############################################################
'# ·郑重声明:
'# ·此定单系统仅提供简易版定单管理功能，其他功能，请自行开发。
'# ·由于用户原因，可能导致定单数据丢失，请经常登录管理区查看定单。
'# ·此程序不得随意公开发布、销售或进行其他非法转让。
'# ·如对此程序有任何疑问，请在管理区留言。
'#############################################################
%>
<HTML><HEAD><TITLE>定单查看系统</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<%
   const MaxPerPage=30
   dim totalPut
   dim CurrentPage
   dim TotalPages
   dim i,j

   if not isempty(request("page")) then
      currentPage=cint(request("page"))
   else
      currentPage=1
   end if
   dim sql
   dim rs
   dim rstype
   if not isEmpty(request("viewtype")) then
	viewtype=request("viewtype")
   else
	viewtype=0
   end if

%>
<body text="#000000" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<DIV align=center><a href="vieworder.asp?viewtype=all">全部定单</a>｜<a href="vieworder.asp?viewtype=undispose">未处理定单</a>｜<a href="vieworder.asp?viewtype=disposed">已处理定单</a>｜<a href="logout.asp">退出管理</a>｜
<div align="center"><%
if viewtype="all" or viewtype="" then
	sql="select * from myorder order by id desc"
elseif viewtype="undispose" then
	sql="select * from myorder where disposed=0 order by id desc"
elseif viewtype="disposed" then
	sql="select * from myorder where disposed=1 order by disposedate desc"
else
	sql="select * from myorder order by id desc"
end if
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,1
  if rs.eof and rs.bof then
       response.write "<p align='center'> 还 没 有 任 何 定 单</p>"
   else
	  totalPut=rs.recordcount
      totalPut=rs.recordcount
      if currentpage<1 then
          currentpage=1
      end if
      if (currentpage-1)*MaxPerPage>totalput then
	   if (totalPut mod MaxPerPage)=0 then
	     currentpage= totalPut \ MaxPerPage
	   else
	      currentpage= totalPut \ MaxPerPage + 1
	   end if

      end if
       if currentPage=1 then
           showpage totalput,MaxPerPage,"vieworder.asp"
            showContent
            showpage totalput,MaxPerPage,"vieworder.asp"
       else
          if (currentPage-1)*MaxPerPage<totalPut then
            rs.move  (currentPage-1)*MaxPerPage
            dim bookmark
            bookmark=rs.bookmark
           showpage totalput,MaxPerPage,"vieworder.asp"
            showContent
             showpage totalput,MaxPerPage,"vieworder.asp"
        else
	        currentPage=1
           showpage totalput,MaxPerPage,"vieworder.asp"
           showContent
           showpage totalput,MaxPerPage,"vieworder.asp"
	      end if
	   end if
   rs.close
   end if
	
   set rs=nothing
   conn.close


   sub showContent
       dim i
	   i=0

%>
      <div align="center"><center><table border="1" cellspacing="0" bordercolorlight="#5493AC" bordercolordark="#FFFFFF" cellpadding="0">
        <tr>
          <td align="center" bgcolor="#5493AC" height="20"><font color="#FFFFFF">ID</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">服务名称</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">定单号</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">商户定单号</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">定单金额</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">自定义字段1</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">自定义字段2</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">支付方式</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">支付状态</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">定单时间</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">用户IP</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">是否已处理</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">处理时间</font></td>
        </tr>
<%do while not rs.eof%>
        <tr>
          <td height="23" align="center"><%=rs("id")%></td>
          <td align="center"><%=rs("servicename")%></td>
          <td align="center"><%=rs("orderid")%></td>
          <td align="center"><%=rs("billno")%></td>
          <td align="center"><%=rs("price")%>元</td>
          <td align="center"><%=rs("custom1")%></td>
          <td align="center"><%=rs("custom2")%></td>
          <td align="center"><%=rs("payvia")%></td>
          <td align="center"><%=rs("pstring")%></td>
          <td align="center"><%=rs("orderdate")%></td>
          <td align="center"><%=rs("vip")%></td>
          <td align="center"><%if rs("disposed")<>0 then%><font color="#0000FF">已处理</font><%else%><a href="orderdispose.asp?id=<%=rs("id")%>&dispose=yes"><font color="#FF0000">立即处理</font></a><%end if%></td>
          <td align="center"><%=rs("disposedate")%></td>
        </tr>
<% i=i+1
	      if i>=MaxPerPage then exit do
	      rs.movenext
	   loop
		  %>
      </table>
      </center></div><%
   end sub

function showpage(totalnumber,maxperpage,filename)
  dim n
  if totalnumber mod maxperpage=0 then
     n= totalnumber \ maxperpage
  else
     n= totalnumber \ maxperpage+1
  end if
  response.write "<form method=Post action="&filename&"?viewtype="&viewtype&">"
  if CurrentPage<2 then
    response.write "<font color='#000080'>首页 上一页</font>&nbsp;"
  else
    response.write "<a href="&filename&"?page=1&viewtype="&viewtype&">首页</a>&nbsp;"
    response.write "<a href="&filename&"?page="&CurrentPage-1&"&viewtype="&viewtype&">上一页</a>&nbsp;"
  end if
  if n-currentpage<1 then
    response.write "<font color='#000080'>下一页 尾页</font>"
  else
    response.write "<a href="&filename&"?page="&(CurrentPage+1)&"&viewtype="&viewtype&">"
    response.write "下一页</a> <a href="&filename&"?page="&n&"&viewtype="&viewtype&">尾页</a>"
  end if
   response.write "<font color='#000080'>&nbsp;页次：</font><strong><font color=red>"&CurrentPage&"</font><font color='#000080'>/"&n&"</strong>页</font> "
    response.write "<font color='#000080'>&nbsp;共<b>"&totalnumber&"</b>个定单 <b>"&maxperpage&"</b>个定单/页</font> "
   response.write " <font color='#000080'>转到：</font><input type='text' name='page' size=4 maxlength=10 class=smallInput value="&currentpage&" style=""color: #000000"">"
   response.write "<input class=buttonface type='submit'  value='Goto'  name='cndok' style='color: #000000'></span></p></form>"

end function
'end if

%>

    </dd>
    </div></td>
  </tr>
</table>
</BODY></HTML>
