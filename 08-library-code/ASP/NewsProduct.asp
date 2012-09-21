<!--最新图文代码开始-->
<%
Const New_img=10      
set rs_Product=server.createobject("adodb.recordset")
sqltext="select top " & New_img & " * from Product where Passed=True and Newproduct=true order by UpdateTime desc"
rs_Product.open sqltext,conn,1,1
if not rs_Product.EOF then%>
<div align='center' id='demo' style='overflow:hidden;height:125px;width:545px;'><!--滚动区的高度和宽度-->
<table align='center' cellpadding='0' cellspace='0' border='0'>
<tr>
	<td id='demo1' valign='top'>
		<table width='100%' cellpadding='0' cellspacing='0' border='0' align='center'>
		<tr valign='top'>
	<%
	while not rs_Product.EOF
	fileExt=lcase(getFileExtName(rs_Product("DefaultPicUrl")))		
	%>
			<td align='center'>
				<TABLE width=100% border=0 align=center cellPadding=0 cellSpacing=0>
				<TR>
					<TD width=8 rowspan=3 >&nbsp;</TD>
					<TD vAlign=top width=8><img src='Images/bg_0ltop.gif' width=10 height=10></TD>
					<TD background=images/bg_01.gif></TD>
					<TD vAlign=top width=7><img src='Images/bg_0rtop.gif' width=10 height=10></TD>
					<TD width=7 rowspan=3 vAlign=top>&nbsp;</TD>
				</TR>
				<TR>
					<TD background='Images/bg_03.gif'>&nbsp;</TD>
					<TD align="center" bgcolor="#E9E9E9">
						<a href='ProductShow.asp?ID=<%=rs_Product("ID")%>' target=_blank title='<%=rs_Product("title")%>'>
		<%if fileext="jpg" or fileext="bmp" or fileext="png" or fileext="gif" then%>
							 <img border="0" height="80" src="<%if rs_Product("DefaultPicUrl")="" then%>Img/nopic.gif<%else%><%=rs_Product("DefaultPicUrl")%><%end if%>" width="105" alt="<%=rs_Product("title")%>">
		<%else
			if fileext="swf" then%>
							<object  classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000'  codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0' width='105' height='84'>
								<param name=movie value='<%=rs_Product("DefaultPicUrl")%>'>
								<param name=quality value=high>
								<param name='Play' value='-1'>
								<param name='Loop' value='0'>
								<param name='Menu' value='-1'>
								<param name='wmode' value='transparent'>
								<embed src='<%=rs_Product("DefaultPicUrl")%>' width='105' height='84' pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash'></embed>
							</object>
												
			<%end if
		end if%></a>
						
	  			</TD>
	  			<TD background='Images/bg_04.gif'>&nbsp;</TD>
				</TR>
				<TR>
					<TD><img src='Images/bg_0lbottom.gif' width=10 height=10></TD>
					<TD><img src='Images/bg_02.gif'></TD>					
					<TD><img src='Images/bg_0rbottom.gif' width=10 height=10></TD>
	  		</TR>
	  		<TR>
	  			<TD>&nbsp;</TD>
					<TD colspan=3 align=center height=20 valign='top' background='Images/bg_05.gif'>
	  				<a href='ProductShow.asp?ID=<%=rs_Product("ID")%>' target=_blank title='<%=rs_Product("title")%>'><%=cutstr(rs_Product("title"),8)%></a>
	 				</TD>
	 				<TD>&nbsp;</TD>
				</TR>
	 			</TABLE>
			</td>
	  <%
	  rs_Product.MoveNext
	wend
	%>
		</tr>
		</table>
	</td>
	<td id=demo2 valign=top></td>
</tr>
</table>
</div>
   <%if New_img >5 then%>
<script>
var Picspeed=15
demo2.innerHTML=demo1.innerHTML
function Marquee1(){
if(demo2.offsetWidth-demo.scrollLeft<=0)
demo.scrollLeft-=demo1.offsetWidth
else{
demo.scrollLeft++
}
}
var MyMar1=setInterval(Marquee1,Picspeed)
demo.onmouseover=function() {clearInterval(MyMar1)}
demo.onmouseout=function() {MyMar1=setInterval(Marquee1,Picspeed)}
</script>
	<%end if
else
	Response.Write "暂 无 最 新 图 文"
end if
rs_Product.close
set rs_Product=nothing
%>
<!--最新图文代码结束-->