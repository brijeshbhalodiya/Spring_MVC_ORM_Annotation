<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.dao.AppDao"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
	ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
	AppDao appdao = (AppDao)context.getBean("AppDao");
	List<Category> list = appdao.getAllCategory();
	if(list.size() <= 0){
%>
	<h1>First <a href="addCategory">Add Category</a></h1>
<% }else{ %>
<form name="frm" method="post" action="addProduct">
	<table>
		<tr>
			<td>Select Category</td>
			<td><select name="catId">
				<option>---Select Category---</option>
		<%
			for(Category c:list)
			{
		%>
				<option value="<%=c.getCategoryid() %>"><%=c.getCategory_name() %></option>
		<%	
			}
		%>
			</select></td>
		</tr>
		<tr>
			<td>Product Name</td>
			<td><input type="text" name="pname"></td>
		</tr>
		
		<tr>
			<td>Price</td>
			<td><input type="number" name="price"></td>
		</tr>
		
		<tr>
			<td>Quantity</td>
			<td><input type="number" name="quantity"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="action" value="Insert Product">
			</td>
		</tr>
	</table>
</form>
<a href="Products">Show All Products</a>
<% } %>
</body>
</html>