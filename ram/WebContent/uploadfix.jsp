<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String imgid=(String)session.getAttribute("imgid");
String userid=(String)session.getAttribute("userid");
String des=request.getParameter("des");
String lat=(request.getParameter("lat"));
String lon=(request.getParameter("lon"));
String city=(request.getParameter("city")).toUpperCase();
String cat=request.getParameter("cat");


try{
	
Connection con;
Statement st;
Class.forName("com.ibm.db2.jcc.DB2Driver");
con = DriverManager.getConnection("jdbc:db2://localhost:50000/GEO","db2admin","tgmc");
st=con.createStatement();
int i=st.executeUpdate("UPDATE db2admin.image SET userid='"+userid+"',des='"+des+"',lat='"+lat+"',lon='"+lon+"',city='"+city+"',cat='"+cat+"' WHERE imgid='"+imgid+"'");

if(i==1)
{
	out.println("rfrf");
response.sendRedirect("success.jsp?credits=50");
}

}
catch(Exception e)
{
out.println(e);

}


%>

</body>
</html>