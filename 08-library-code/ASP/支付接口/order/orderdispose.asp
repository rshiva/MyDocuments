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
 dim sql
 dim rs
 set rs=server.createobject("adodb.recordset")
 sql="select id,disposed,disposedate from myorder where id="&request("ID")
 rs.open sql,conn,1,3
 if not rs.eof then
   if request("dispose")="yes" then
   	rs("disposed") = 1
   	rs("disposedate")=now()
   else
   	rs("disposed") = 0
   	rs("disposedate")=null
   end if
   rs.update
 end if
 rs.close
 set rs=nothing
 conn.close
 set conn=nothing
 response.redirect "vieworder.asp"
%>
