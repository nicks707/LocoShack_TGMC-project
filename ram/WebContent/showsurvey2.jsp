<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LocoShack-Take Survey</title>
</head>
<body>
<%

int a1=Integer.parseInt(request.getParameter("a1"));
int a2=Integer.parseInt(request.getParameter("a2"));
int a3=Integer.parseInt(request.getParameter("a3"));
int a4=Integer.parseInt(request.getParameter("a4"));
int a5=Integer.parseInt(request.getParameter("a5"));
String surveyid=request.getParameter("surveyid");
String userid=(String)session.getAttribute("userid");
int count=0;
int i=0;
int j=0;
try
{
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/GEO","db2admin","tgmc");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from db2admin.survey_ans where surveyid='"+surveyid+"'");
    while(rs.next())
    {
    	count++;
    }	
if(count==0)
{
Statement st1=con.createStatement();	
 i=st1.executeUpdate("insert into db2admin.survey_ans values('"+surveyid+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"')");

}
else
{
	
Statement st2=con.createStatement();
 j=st2.executeUpdate("UPDATE db2admin.survey_ans SET a1=a1+"+a1+",a2=a2+"+a2+",a3=a3+"+a3+",a4=a4+"+a4+",a5=a5+"+a5+" where surveyid='"+surveyid+"'");

}

if((i!=0)||(j!=0))
	response.sendRedirect("success.jsp?credits=100");


}
catch(Exception e)
{
out.println("FATAL ERROR REPORTED...TRY AFTER SOME TIME");
}


%>


</body>
</html>