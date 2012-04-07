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

try {
String str=request.getParameter("user");

Connection con;
Class.forName("com.ibm.db2.jcc.DB2Driver");
// Get a Connection to the database
con = DriverManager.getConnection("jdbc:db2://localhost:50000/GEO","db2admin","tgmc");
//Add the data into the database
String sql = "SELECT sec FROM db2admin.userdata WHERE user='"+str+"'";
Statement stm = con.createStatement();
stm.executeQuery(sql);

ResultSet rs= stm.getResultSet();
int count = 0;
if(rs.next ()){
String sec=rs.getString("sec");
out.println(sec);


}

}
catch(Exception e){
out.println("Exception is ;"+e);
}
%>

</body>
</html>