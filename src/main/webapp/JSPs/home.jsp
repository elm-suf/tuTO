<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%!
%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="text/html" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/home.css">
    <title>LOGIN DATABASE</title>
</head>
<body>
    <div id="outer">
        <div id="inner">
            <h1>Form di autenticazione</h1>
            <h1>Inserire i propri dati</h1>
            <form action="/controller" method="post">
                <div class="form-group">
                    <input name="username" class="form-control" placeholder="Username">
                    <input name="password" type="password" class="form-control" placeholder="Password">
                </div><br>
                <button type="submit" name="action" value="login" class="btn btn-primary" id="sign">Login</button>
            </form>
        </div>
    </div>
</body>
</html>