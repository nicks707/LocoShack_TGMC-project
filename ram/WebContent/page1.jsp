<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="" method="get" >
Name:<input type="text" id="name">
Roll:<input type="text" id="roll">
<input type="submit" id="sub" value="Submit">


</form>

</body>
</html>
<%
String name=request.getParameter("name");
Integer roll=Integer.valueOf(request.getParameter("roll"));
if((!name.equals(""))&&(roll!=null))
{
try
{
	
Class.forName("com.ibm.db2.jcc.DB2Driver");
Connection Conn=DriverManager.getConnection("jdbc:db2://localhost:50000/GEO","db2admin","tgmc");

Statement Stmt=Conn.createStatement();


Stmt.executeUpdate("insert into db2admin.account values('"+name+"','"+roll+"')");
out.println("Done");
}

catch(Exception e)
{
	
out.println(e);
}
		}


%> 
