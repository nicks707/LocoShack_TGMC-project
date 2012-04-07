<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
	 if((document.myform.image.value.length==0)	)	

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
<tr><td>
<center><b><h2>Create Survey</h2></b></center><br/>
<center>Welcome to LocoShack surveys.You can now create your own survey and get custom results based on responses</center><br/>
<center><b>STEP 1</b></center>
</td></tr>
<tr><td style="padding:100px;">
<form name="myform" onsubmit=" return checkfield();"  enctype="multipart/form-data" action="FileUploadServletNew" method="post">
<center>Upload Image&nbsp;&nbsp;<input type="file" name="image" id="image" size="40">*</center><br/>
<center><input type="submit" value="UPLOAD"></center>

</form>
</td></tr>
<tr height="80px"><td><jsp:include page="footer.jsp"></jsp:include></td></tr>
</table>
</body>
</html>