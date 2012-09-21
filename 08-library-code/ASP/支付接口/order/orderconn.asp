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
   dim conn
   dim connstr

   on error resume next
   connstr="DBQ="+server.mappath("168regorder.asp")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
     set conn=server.createobject("ADODB.CONNECTION")
     conn.open connstr
%>