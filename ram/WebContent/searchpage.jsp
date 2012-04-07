<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LocoShack-Search Results</title>
<style>
html, body,table
{
  height: 100%;
  width:100%
}
#find img
{
width:117px;
height:120px;

}

</style>
  <script language="JavaScript" src="http://j.maxmind.com/app/geoip.js"></script>
 
</head>
<body style="margin-top:0px;margin-right:0px;margin-left:0px" >
<table cellpadding="0px" cellspacing="0px" >
<tr height="80px"><td><jsp:include page="header.jsp"></jsp:include></td></tr>
<tr height="100%" ><td style="padding-left:50px;background-image:url('images/Green-cloth-texture.jpg');""   valign="top">
<center><b><h2>Here are your search results</h2></b></center><br/>
&nbsp;&nbsp;&nbsp;<b>You searched for:</b><%=request.getParameter("loc") %>
<table cellpadding="0px" cellspacing="0px"  style="padding-top:0px;">
<%



double lati=Double.parseDouble(request.getParameter("lati"));//latd
double lati_up=lati+0.9;
double lati_down=lati-0.9;


double lngi=Double.parseDouble(request.getParameter("lngi"));//long
double lngi_up=lngi+0.9;
double lngi_down=lngi-0.9;



String loci=request.getParameter("loci");//location=no need
String loc=request.getParameter("loc");//query
String cati=request.getParameter("cati");//category...may be all or any selected one
//out.println(lati);
//out.println(lngi);
//out.println(loci);
//out.println(loc);
//out.println(cati);
try{
String userid=(String)session.getAttribute("userid");
Connection con;

Class.forName("com.ibm.db2.jcc.DB2Driver");
con = DriverManager.getConnection("jdbc:db2://localhost:50000/GEO","db2admin","tgmc");
int i=0,j=0;
if(cati.equals("all"))
{
 
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from db2admin.image where lat between '"+lati_down+"' and '"+lati_up+"' and lon between '"+lngi_down+"' and '"+lngi_up+"'");
	while(rs.next())
	{
		i=1;
		String image=rs.getString("image");
		String path="imagedes.jsp?image="+image;
		
		String des=rs.getString("des");
		String city=rs.getString("city");
		%>
		<tr>
		<td><div id="find"><a href="<%=path%>"><img src="<%=image%>"></a></div></td><td valign="top">DESCRIPTION:<br/><%=des%></td><td valign="top">CITY:<%=city %><br/></td>
		</tr><br/>
		<%
	}// for if result set ends here
	
}

else
	{
	 
	
	Statement st1=con.createStatement();
	ResultSet rs1=st1.executeQuery("select image from db2admin.image where (lat between '"+lati_down+"' and '"+lati_up+"') and (lon between '"+lngi_down+"' and '"+lngi_up+"') and cat='"+cati+"'");
	while(rs1.next())
	{
		j=1;
		String image=rs1.getString("image");
		String path="imagedes.jsp?path="+image;
		String cat=rs1.getString("cat");
		String des=rs1.getString("des");
		String city=rs1.getString("city");
		%>
		<tr>
		<td><div id="find"><a href="<%=path%>"><img src="<%=image%>"></a></div></td><td valign="top">DESCRIPTION:<br/><%=des %></td><td valign="top">CITY:<%=city %><br/></td>
		</tr><br/>
		<%

		Statement st2=con.createStatement();
		int k=st2.executeUpdate("insert into tagmap values('"+loc+"','"+cati+"')");
	}// for else result set ends here
	
	
	
	}
if((i==0)&&(j==0))
{
	%>
<center><b>NO RESULTS FOUND&nbsp;&nbsp;&nbsp;<a href="main.jsp">TRY AGAIN</a></b></center>
<%	
}


}
catch(Exception e)
{
out.println(e);	
}


%>
</table>



</td></tr>
<tr height="50px"><td><jsp:include page="footer.jsp"></jsp:include></td></tr>
</table>
</body>
</html>
