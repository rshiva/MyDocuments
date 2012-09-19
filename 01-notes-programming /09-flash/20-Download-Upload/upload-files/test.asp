<!--#include file="class.asp"-->
<%
Server.ScriptTimeout = 300
Response.CacheControl = "no-cache"
Session.TimeOut = 60

'文件保存路径
path="files/"

'文件大小限制K
fsize=200

'允许上传类型
ext=Array("jpg","gif","bmp","zip","rar","doc","xls")

'检查文件类型
function checkext(str)
	flat=false
	if str<>"" then
		for i=0 to ubound(ext)
			if str=ext(i) then
				flat=true
			end if
		next
	end if
	checkext=flat
end function

'生成上传文件名
function MakedownName()
	dim fname
	randomize
	fname = now()
	fname = replace(fname,"-","")
	fname = replace(fname," ","") 
	fname = replace(fname,":","")
	fname = replace(fname,"PM","")
	fname = replace(fname,"AM","")
	fname = replace(fname,"上午","")
	fname = replace(fname,"下午","")
	fname = int(fname) + int((100-1+1)*Rnd + 1)
	MakedownName=fname
end function

set upload=new upload_5xsoft
for each filea in upload.objFile
	set file=upload.file(filea)
	if checkext(lcase(right(file.filename,3))) then
		file.SaveAs Server.MapPath(path & MakedownName & right(file.filename,4))
		'此处添加写入数据库记录
		response.Write(path & MakedownName & right(file.filename,4)) 
	end if
next
%>