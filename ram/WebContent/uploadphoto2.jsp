<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
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
  width:100%;
}
</style>
<script type="text/javascript">

function check()
{
	 if((document.myform.des.value.length==0)||(document.myform.lat.value.length==0)||(document.myform.lon.value.length==0)||(document.myform.city.value.length==0)||(document.myform.cat.value.length==0)	)	

{
alert("ALL * FIELDS ARE MANDATORY");
return false;
}

}

</script>
</head>

<body style="margin-top:0px;margin-left:0px;margin-right:0px">
<table  width="100%" cellpadding="0" cellspacing="0"   style="background-color:#FFFFCC">
<tr  height="60px"><td><jsp:include page="header2.jsp"></jsp:include></td></tr>
<tr><td style="padding:100px;">
<center><b>STEP 2</b></center><br/>
<form action="uploadfix.jsp" method="post" onsubmit="return check()" name="myform">
<b>Add Description</b><br/>
<textarea rows="5" cols="30" name="des" id="des" ></textarea><br/><br/>
<b>Set the location of the image</b>&nbsp;<input type="button" value="SET LOCATION" onclick="window.open('setloc2.jsp','setloc2')">*<br/><br/>
<input type="hidden" name="lat" id="lat" value="">
<input type="hidden" name="lon" id="lon" value="">
<b>City</b>&nbsp;&nbsp;<input type="text" name="city" id="city" value="">*<br/><br/>
<input type="hidden" name="credits" id="credits" value="50">
<b>Select a category:*</b><br/><br/>
<input type="radio" name="cat" value="eat" checked="checked">EAT<br/>
<input type="radio" name="cat" value="shop">SHOP<br/>
<input type="radio" name="cat" value="health">HEALTHCARE<br/>
<input type="radio" name="cat" value="tour">TOURIST ATTRACTION<br/>
<div align="center"><input type="submit" value="SUBMIT"></div><br/><br/>
</form>

</td></tr>
<tr height="50px"><td><jsp:include page="footer.jsp"></jsp:include></td></tr>
</table>
</body>
</html>
