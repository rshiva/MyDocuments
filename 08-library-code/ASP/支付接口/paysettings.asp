<%
'#############################################################
'#               贺喜支付平台支付接口设置文件
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
'# ·此程序不得随意公开发布、销售或进行其他非法转让。
'# ·如对此程序有任何疑问，请在管理区留言。
'#############################################################
'以下代码为变量声明
dim reg_userid,paykey,servicename,receive_url,use_custom1,custom1_name,use_custom2,custom2_name,fee_mode,pay_fee,payvia_list,payvia_mode,pay_mode,order_mode,orderuser,orderpass

'商户编号，请自行设定，不知道的可登录商户管理区查看，登录：http://merchant.168reg.cn
reg_userid=0

'商户密钥，请自行设定，没设置商户密钥的商户请访问：http://merchant.168reg.cn/interface_set.asp
paykey=""

'服务名称,长度：50
servicename="XXXX网会员"

'接收地址，请自行设定为上传后payreceive.asp所在网址,长度：100
receive_url="http://www.yourdomain.com/payreceive.asp"

'是否启用自定义字段1,true值为启用,false值为不启用
use_custom1=true

'自定义字段1名称
custom1_name="用户名"

'是否启用自定义字段2,true值为启用,false值为不启用
use_custom2=false

'自定义字段2名称
custom2_name=""

'是否固定支付金额,true值为固定金额,false值为不固定金额
fee_mode=false

'固定支付金额，以元为单位，当不使用固定支付金额时，此值无效
pay_fee=1

'使用的支付途径列表，格式：支付途径payvia参数|支付途径名称,支付途径payvia参数|支付途径名称
payvia_list="1|银行卡支付,2|声讯电话支付,3|互联星空支付,4|手机短信注册,5|腾讯财付通支付,6|腾讯Q币支付,7|神州行充值卡支付(最高500元),8|盛大游戏点卡支付(最低1元，最高100元),9|支付宝支付,10|手机银行支付,11|北京宽带支付(最高200元)"

'选择支付途径模式，1为多选，2为单选
payvia_mode=1

'支付模式，启用测试模式时请将值设为"testmode"，正式模式请不要设置此变量
pay_mode=""

'是否使用支付接口自带的简易定单管理系统,true值为使用,false值为不使用
order_mode=true

'定单管理系统登录用户名
orderuser="admin"

'定单管理系统登录密码
orderpass="admin"

%>