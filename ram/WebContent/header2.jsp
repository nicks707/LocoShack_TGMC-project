<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="margin-left:0px;margin-right:0px;margin-top:0px;">
<table cellpadding="0px" cellspacing="0px" width="100%">

<tr bgcolor="#00FFFF" style="height:60px;">
<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="hit.jsp"><b>HOW IT WORKS</b></a> | <a href="credits.jsp"><b>CREDITS</b></a> | <a href="buydata.jsp"><b>BUY DATASETS</b></a> | <a href="surveys.jsp"><b>SURVEYS</b></a> |  <a href="accmain.jsp"><b>ACCOUNT</b></a> </td>

<td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- code for links like welcome user/guest and signout --><b>Welcome <%=session.getAttribute("id") %></b>&nbsp;&nbsp;&nbsp;<a href="logout.jsp">Logout</a>&nbsp;&nbsp;</td>
</tr>

</table>

</body>
</html>