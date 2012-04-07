<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LocoShack-Create Survey</title>
<style>
html, body,table
{
  height: 100%;
  width:100%;
}
</style>
<script type="text/javascript">
function checkfield()
{
	 if((document.myform.surdes.value.length==0)||(document.myform.city.value.length==0)||(document.myform.q1.value.length==0)||(document.myform.q2.value.length==0)||(document.myform.q3.value.length==0)||(document.myform.q4.value.length==0)||(document.myform.q5.value.length==0))	

{
alert("FIELDS IS MANDATORY");
return false;
}

}
</script>
</head>
<body style="margin-top:0px;margin-left:0px;margin-right:0px">
<table width="100%" cellpadding="0" cellspacing="0"   style="background-color:#FFFFCC">
<tr height="60px"><td><jsp:include page="accheader.jsp"></jsp:include></td></tr>
<tr><td style="padding:100px; ">
<center><b>STEP 2</b></center><br/>
<form action="successsurvey.jsp" name="myform" onsubmit=" return checkfield()">
Desciption about your survey(Who are you/What do you offer etc)*<br/><br/>
<textarea rows="5" cols="30" name="surdes" id="surdes"></textarea><br/><br/>
City&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="city" id="city">*<br/><br/>
Q1:<input type="text" name="q1" id="q1" size="100">?*<br/><br/>
Q2:<input type="text" name="q2" id="q2"size="100" value="">?*<br/><br/>
Q3:<input type="text" name="q3" id="q3" size="100" value="">?*<br/><br/>
Q4:<input type="text" name="q4" id="q4" size="100" value="">?*<br/><br/>
Q5:<input type="text" name="q5" id="q5" size="100" value="">?*<br/><br/>



<center><input type='submit' value='SUBMIT'></center>



</form>
</td></tr>
<tr height="80px"><td><jsp:include page="footer.jsp"></jsp:include></td></tr>

</table>
</body>
</html>