<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LocoShack-Login!</title>
<style>
html, body,table
{
  height: 100%;
  width:100%;
}
</style>
<!-- SCRIPTS -->
    <script type="text/javascript" language="javascript">
function chktext()
{
if((document.form.id.value.length == 0)&&(document.form.pass.value.length == 0))
{
alert("All fields are mandatory");
return false;
}
else
    {
if((document.form.pass.value.length == 0))
{
alert("Enter a valid password");
return false;

}
if((document.form.id.value.length == 0))
{
alert("Enter a valid username");
return false;
}
    }

      }
</script> 



</head>
<body style="margin-left:0px;margin-right:0px;margin-top:0px;">
<table cellpadding="0px" cellspacing="0px">
<tr height="80px" ><td colspan="3"><jsp:include page="header.jsp"></jsp:include></td></tr>
<tr height="100%" style=" background-image:url(images/Green-cloth-texture.jpg)">
<td width="10%"></td><td id="b1"  width="55%">
<form name="form" action="checklogin.jsp"  onsubmit="return chktext()">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fieldset  style=" background-color:#00FFFF; width:50%; height:100%;  ">
<legend><big>LOGIN</big></legend><br/><br/><br/>
<label for="id">Username</label><input type="text" name="id"/><br/><br/><br/>
<label for="pass">Password</label>&nbsp;<input type="password" name="pass"/><br/><br/><b>&nbsp;&nbsp;<br/><br/>&nbsp;&nbsp;<input type="submit" style="text-align: center;" value="LOGIN"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="forgot.jsp"><h5>Forgot password</h5></a></fieldset></form>
</td>
</td><td><b>Not yet registered<b></b>&nbsp;&nbsp;
<a href="signup.jsp">Register now!</a>
</td></tr>
<tr height="50px"><td colspan="3"><jsp:include page="footer.jsp"></jsp:include></td></tr>








</table>
</body>
</html>