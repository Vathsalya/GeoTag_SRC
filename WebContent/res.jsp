<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>The details</h1>
    <p>
        <%=request.getParameter("uploadField")  %>
        
    </p>
<p><strong>Description: </strong></p>
<p>
        <%=request.getParameter("text_Desc")  %>
    </p>
<p><strong>Place:</strong></p>
<p> <%=request.getContextPath()%> </p>
<p>
        <%=request.getParameter("text_place")  %>
    </p>
<p><strong>Image:</strong><img alt="" src="/<%=request.getParameter("uploadField") %>">
    </p> 
    <p><a href="/<%=request.getParameter("uploadField") %>" onclick="window.open(this.href); return false;" onkeypress="window.open(this.href); return false;">Show Image</a></p>
<p><strong>Map:</strong></p>
<p><a href="MAP.jsp" onclick="window.open(this.href); return false;" onkeypress="window.open(this.href); return false;">Show map</a></p>

<p>&nbsp;</p>
    
</body>
</html>