<%@LANGUAGE="JAVASCRIPT" CODEPAGE="936"%>
<%
Response.Charset = "gb2312";
(function () {

	var conn = Server.CreateObject("Adodb.Connection");
	conn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("Cdrag.mdb");
	conn.Open;
	
	with (Response) {
	
		var rs = conn.Execute("Select Top 1 Src From [Pic] Order By Id Desc")
		if (!rs.Eof) {
			Write(rs("Src").Value);
		} else Write("没有信息的说");
		rs.Close; rs = null;
	}
	
	conn.Close; conn = null;
})();
%>