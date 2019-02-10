<%@page import="com.bean.Product"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.Category"%>
<%@page import="com.dao.AppDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
</head>
<body>
<%
ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
AppDao appdao = (AppDao)context.getBean("AppDao");
List<Category> list = appdao.getAllCategory();
%>
<%
	Product p = (Product)request.getAttribute("p");
	Category ci = p.getCategory_id();
%>
<form name="frm" method="post" action="update">
	<table cellspacing="5" cellpadding="5">
		<tr>
			<td><input type="hidden" name="pid" value="<%= p.getPid() %>"></td>
		</tr>
		<tr>
			<td>Product Name</td>
			<td><input type="text" name="pname" value="<%= p.getProduct_name() %>"></td>
		</tr>
		
		<tr>
			<td>Price</td>
			<td><input type="text" name="price" value="<%= p.getPrice() %>"></td>
		</tr>
		
		<tr>
			<td>Product Name</td>
			<td><input type="text" name="quantity" value="<%= p.getQuantity() %>"></td>
		</tr>
		<tr>
			<td>Select Category</td>
			<td><select name="catId">
		<%
			for(Category c:list)
			{
				
		%>
				<option value="<%=c.getCategoryid() %>" <% if(c.getCategoryid() == ci.getCategoryid()){ %> selected <% } %>><%=c.getCategory_name() %></option>
		<%	
			}
		%>
			</select></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="action" value="Update">
			</td>
		</tr>
	</table>
</form>
</body>
</html>