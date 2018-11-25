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
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="../../bootstrap/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../bootstrap/mine/style.css">
    <script src="../../bootstrap/bootstrap/js/jquery-slim.min.js"></script>
    <script src="../../bootstrap/bootstrap/js/popper.min.js"></script>
    <script src="../../bootstrap/bootstrap/js/bootstrap.min.js"></script>
    <title>Studente <% out.print(session.getAttribute("username"));%></title>
</head>
<body>
<p>Login avvenuto con successo</p>
<br>
<p>Ecco i tuoi dati</p><br>
<p>Username: <% out.print(session.getAttribute("username"));%></p>
<p>Password: <% out.print(session.getAttribute("password"));%></p>

</body>
</html>
