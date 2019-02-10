<%@page import="com.bean.Category"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AppDao"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products</title>
</head>
<body>
<%
ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
AppDao dao = (AppDao)context.getBean("AppDao");
List<Product> list = dao.getAllProducts();

%>
<table border="1" width="100%">
	<tr>
		<th>ID</th>
		<th>PRODUCT NAME</th>
		<th>PRICE</th>
		<th>QUANTITY</th>
		<th>CATEGORY NAME</th>
		<th>EDIT</th>
		<th>DELETE</th>
	</tr>
	<%
		for(Product p:list)
		{
			Category c = p.getCategory_id();
	%>
	<tr>
		<td><%=p.getPid() %></td>
		<td><%=p.getProduct_name() %></td>
		<td><%=p.getPrice() %></td>
		<td><%=p.getQuantity() %></td>
		<td><%=c.getCategory_name() %></td>
		<td>
			<form name="edit" method="post" action="update">
				<input type="hidden" name="eid" value="<%=p.getPid()%>">
				<input type="submit" name="action" value="Edit">
			</form>
		</td>
		<td>
			<form name="delete" method="post" action="delete">
				<input type="hidden" name="eid" value="<%=p.getPid()%>">
				<input type="submit" name="action" value="Delete">
			</form>
		</td>
	</tr>
	<%
		}
	%>
</table>
</body>
</html>