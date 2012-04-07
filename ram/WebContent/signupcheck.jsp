<%@ page language="java" import="java.sql.*"  contentType="text/html;  charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LocoShack-Response</title>
<style>
html, body,table
{
  height: 100%;
}
</style>
</head>

<body style="margin-top:0px;margin-left:0px;margin-right:0px;">
<table width="100%" cellpadding="0px" cellspacing="0px" style=" background-image:url(images/Green-cloth-texture.jpg)">
<tr height="80px"><td><jsp:include page="header.jsp"></jsp:include></td></tr>
<tr height="100%"><td>
<%
String fn=request.getParameter("fn");
String ln=request.getParameter("ln");
String email=request.getParameter("email");
String un=request.getParameter("un");
String pwd=request.getParameter("pwd");
String dob=request.getParameter("dob");
String sec=request.getParameter("sec");
String secans=request.getParameter("secans");
String sex=request.getParameter("sex");
String city=(request.getParameter("city")).toUpperCase();
String cont=request.getParameter("cont");

StringBuffer sb = new StringBuffer();  
for (int x = 0; x <8; x++)  
{  
  sb.append((char)((int)(Math.random()*26)+97));  
}  
String userid=sb.toString();  



try
{
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/GEO","db2admin","tgmc");
    Statement st=con.createStatement();
	int a=st.executeUpdate("insert into db2admin.userdata values('"+fn+"','"+ln+"','"+email+"','"+un+"','"+pwd+"','"+dob+"','"+sec+"','"+secans+"','"+sex+"','"+userid+"','0','"+city+"','"+cont+"')");
	
    if(a==1)
    {
    %>	
   <center>You have successfully signed up with LocoShack.Now please <a href="login.jsp">LOGIN</a>.</center> 	
    	
   <% 	
   st.close();
   Statement st1=con.createStatement();
   int b=st1.executeUpdate("insert into db2admin.usermap values('"+un+"','"+pwd+"','"+userid+"')");
    }
    else
    {
    %>
    There has been some error .Please try again!!	
    	
    <%	
    }
    
}
catch(Exception e)
{
out.println("FATAL ERROR/n");
out.println(e);

}










%>
</td></tr>
<tr height="50px"><td><jsp:include page="footer.jsp"></jsp:include></td></tr>




</table>




</body>
</html>