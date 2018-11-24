<%--
  Created by IntelliJ IDEA.
  User: Lorenzo
  Date: 04/11/2018
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Failure</title>
</head>
<body>
<p>Login non avvenuto</p>
<br>
<p>Ricontrolla i dati da te inseriti</p><br>
<p>Username: <% out.print(session.getAttribute("username"));%></p>
<p>Password: <% out.print(session.getAttribute("password"));%></p>
</body>
</html>
