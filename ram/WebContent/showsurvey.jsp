<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LocoShack-Take Survey</title>
<style>
html, body,table
{
  height: 100%;
  width:100%;
}
#show img
{
width:117px;
height:120px;

}
</style>
</head>
<body style="margin-top:0px;margin-left:0px;margin-right:0px">
<table width="100%" cellpadding="0" cellspacing="0"   style="background-color:#FFFFCC">
<form action="showsurvey2.jsp">
<tr height="60px"><td><jsp:include page="accheader.jsp"></jsp:include></td></tr>
<tr><td style="padding-left:80px;">

<%
String userid=(String)session.getAttribute("userid");
String surveyid=request.getParameter("surveyid");

try
{
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/GEO","db2admin","tgmc");
    Statement stimg=con.createStatement();
    ResultSet rsimg=stimg.executeQuery("select imgid from db2admin.surveymap where surveyid='"+surveyid+"'");
	if(rsimg.next())
	{
		String imgid=rsimg.getString("imgid");
		Statement stimg2=con.createStatement();
		ResultSet rsimg2=stimg2.executeQuery("select image from db2admin.image where imgid='"+imgid+"'");
		if(rsimg2.next())
		{
			String path=rsimg2.getString("image");
			
			%>
			
			<center><div id="show"><img src="<%=path%>"/></div></center>
			
			
			<%
		
		
		
		}//end of rsimg2
}//end of rsimg
	
	
	
	
	
	
	Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from db2admin.survey_que where surveyid='"+surveyid+"'");
    if(rs.next())
    {
    	String surdes=rs.getString("surdes");
    	String city=rs.getString("city");
    	
    %>
    <br/>
   <center> <b>About Image</b><br/>
    <%=surdes %><br/>
    <b>City</b><br/>
    <%=city %></center>
     <b>  Q1:<%=rs.getString("q1") %>?<br/></b>
       <input type="radio" name="a1" value="1" checked="checked">Poor&nbsp;
       <input type="radio" name="a1" value="2">Average&nbsp;
       <input type="radio" name="a1" value="3" >Good&nbsp;
       <input type="radio" name="a1" value="4" >Excellent&nbsp;
       <input type="radio" name="a1" value="5" >Outstanding<br/><br/>
      


      <b>   Q2:<%=rs.getString("q2") %>?<br/></b>
       <input type="radio"   name="a2" value="1" checked="checked">Poor&nbsp;
       <input type="radio" name="a2" value="2">Average&nbsp;
       <input type="radio" name="a2" value="3" >Good&nbsp;
       <input type="radio" name="a2" value="4" >Excellent&nbsp;
       <input type="radio" name="a2" value="5" >Outstanding<br/><br/>
      
    
        <b> Q3:<%=rs.getString("q3") %>?<br/></b>
       <input type="radio" name="a3" value="1" checked="checked">Poor&nbsp;
       <input type="radio" name="a3" value="2">Average&nbsp;
       <input type="radio" name="a3" value="3" >Good&nbsp;
       <input type="radio" name="a3" value="4" >Excellent&nbsp;
       <input type="radio" name="a3" value="5" >Outstanding<br/><br/>
      
    
       <b>  Q4:<%=rs.getString("q4") %>?<br/></b>
       <input type="radio" name="a4" value="1" checked="checked">Poor&nbsp;
       <input type="radio" name="a4" value="2">Average&nbsp;
       <input type="radio" name="a4" value="3" >Good&nbsp;
       <input type="radio" name="a4" value="4" >Excellent&nbsp;
       <input type="radio" name="a4" value="5" >Outstanding<br/><br/>
      
    
     <b>    Q5:<%=rs.getString("q5") %>?<br/></b>
       <input type="radio" name="a5" value="1" checked="checked">Poor&nbsp;
       <input type="radio" name="a5" value="2">Average&nbsp;
       <input type="radio" name="a5" value="3" >Good&nbsp;
       <input type="radio" name="a5" value="4" >Excellent&nbsp;
       <input type="radio" name="a5" value="5" >Outstanding<br/><br/>
      
 <input type="hidden" name="surveyid" value="<%=surveyid%>">

 
  <%  	
 
    }
    //survey done make te entry 
    Statement st1=con.createStatement();
      int i=st.executeUpdate("insert into db2admin.usersurveymap values('"+userid+"','"+surveyid+"')");
       
       st.close();
       st1.close();
    
    
}//try ends
catch(Exception e)
{
out.println(e);	
}
%>

<center><input type="submit" value="SUBMIT"></center><br/><br/>
</td></tr>
<tr height="60px"><td><jsp:include page="footer.jsp"></jsp:include></td></tr>
</form>
</table>
</body>
</html>