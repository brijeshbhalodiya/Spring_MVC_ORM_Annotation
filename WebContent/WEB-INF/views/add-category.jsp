<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Category</title>
</head>
<body>

	<form name="frm" method="post" action="addCategory">
	<table>
		<tr>
			<td>Category Name</td>
			<td><input type="text" name="cname"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="action" value="Insert Category">
			</td>
		</tr>
	</table>
</form>

</body>
</html>