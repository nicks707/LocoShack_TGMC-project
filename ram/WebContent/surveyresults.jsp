<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LocoShack-Check Survey Results</title>
<style>
html, body,table
{
  height: 100%;
}
</style>
</head>
<body style="margin-top:0px;margin-left:0px;margin-right:0px">
<table width="100%" cellpadding="0" cellspacing="0"   style="background-color:#FFFFCC">
<tr height="60px"><td><jsp:include page="accheader.jsp"></jsp:include></td></tr>
<tr><td>
<center><form action="surveyresults2.jsp">
INPUT THE SURVEY ID:&nbsp;<input type="text" name="surveyid" id="surveyid"><br/>
<input type="submit" value="CHECK">
</form></center>

</td></tr>
<tr height="80px"><td><jsp:include page="footer.jsp"></jsp:include></td></tr>
</table>
</body>
</html>