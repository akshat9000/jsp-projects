<%@ page import="java.util.*" %>

<html>

<body>

<form action="todoList.jsp">
	Add new item: <input type="text" name="theItem" />
	
	<input type="submit" value="submit" />
	
</form>

<%
	List<String> items = (List<String>) session.getAttribute("myToDo");
	if(items == null) {
		items = new ArrayList<String>();
		session.setAttribute("myToDo", items);
	}
	
	String theItem = request.getParameter("theItem");
	
	boolean isItemNotEmpty = theItem != null && !theItem.trim().equals("");
	boolean isItemNotDuplicate = theItem != null && !items.contains(theItem.trim());

	if(isItemNotEmpty && isItemNotDuplicate) {
		items.add(theItem.trim());
	}
	
%>

<hr>
<br>
<b>To Do List Items:</b>
<ol>
<%
	for (String temp : items) {
		out.println("<li>"+temp+"</li>");
	}
%>
</ol>

</body>

</html>