<%--
  Created by IntelliJ IDEA.
  User: Lorenzo
  Date: 12/1/2018
  Time: 9:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../../css/bootstrap/bootstrap.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="../../css/fontawesome.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.10/angular-material.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.js"></script>
    <script src="../../js/custom.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular-animate.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular-aria.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular-messages.js"></script>
    <!-- Angular Material Javascript now available via Google CDN; version 0.8 used here -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.10/angular-material.js"></script>
    <title>Profilo Utente</title>
</head>
<body>
<div id="wrapper">

    <!-- Navigation -->
    <div class="wrapper">
        <!-- Sidebar -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Benvenuto <% out.print(session.getAttribute("username"));%>!</h3>
            </div>

            <ul class="list-unstyled components">
                <li>
                    <a href="Amministratore/dashboard.jsp"><i class="fa fa-chart-pie"></i> Dashboard</a>
                </li>
                <li>
                    <a href="#studenti" data-toggle="collapse" aria-expanded="false"
                       class="dropdown-toggle"><i class="fa fa-user"></i> Studenti</a>
                    <ul class="collapse list-unstyled" id="studenti">
                        <li class="active">
                            <a href="Amministratore/studenti.jsp">Elenco studenti</a>
                        </li>
                        <li>
                            <a href="Amministratore/ins_studente.jsp">Inserisci studente</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#docenti" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i
                            class="fa fa-chalkboard-teacher"></i> Docenti</a>
                    <ul class="collapse list-unstyled" id="docenti">
                        <li>
                            <a href="Amministratore/docenti.jsp">Elenco docenti</a>
                        </li>
                        <li>
                            <a href="Amministratore/ins_docente.jsp">Inserisci docente</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#corsi" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i
                            class="fa fa-book"></i> Corsi</a>
                    <ul class="collapse list-unstyled" id="corsi">
                        <li>
                            <a href="Amministratore/corsi.jsp">Elenco corsi</a>
                        </li>
                        <li>
                            <a href="Amministratore/ins_corso.jsp">Inserisci corso</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#prenotazioni" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i
                            class="fa fa-clock"></i> Prenotazioni</a>
                    <ul class="collapse list-unstyled" id="prenotazioni">
                        <li>
                            <a href="Amministratore/prenotazioni.jsp">Elenco prenotazioni</a>
                        </li>
                        <li>
                            <a href="Amministratore/ins_prenotazione.jsp">Inserisci prenotazione</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>

        <!-- Page Content  -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="navbar-btn">
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Profilo <i class="fa fa-user"></i></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/index.html">Logout <i class="fas fa-sign-out-alt"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="card text-center">
                <div class="card-header">Informazioni di profilo</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6 my-auto d-none d-md-none d-lg-block">
                            <img class="mx-auto" src="https://bit.ly/2lI5e4Z" alt="">
                        </div>
                        <form class="col-lg-6">
                            <label for="username">Username</label>
                            <input type="text" class="form-control text-center" id="username"
                                   value="<% out.print(session.getAttribute("username"));%>" readonly><br>
                            <label for="password">Password</label>
                            <input type="text" class="form-control text-center" id="password"
                                   value="<% out.print(session.getAttribute("password"));%>" readonly><br>
                            <label for="nome">Nome</label>
                            <input type="text" class="form-control text-center" id="nome"
                                   value="<% out.print(session.getAttribute("nome"));%>" readonly><br>
                            <label for="cognome">Cognome</label>
                            <input type="text" class="form-control text-center" id="cognome"
                                   value="<% out.print(session.getAttribute("cognome"));%>" readonly>
                        </form>
                    </div>
                </div>
                <div class="card-footer text-muted"></div>
            </div>

        </div>
    </div>
</div>
<!-- Font Awesome JS -->
<script src="../js/fontawesome.min.js"></script>

<!-- Custom JS -->
<script src="../js/custom.js"></script>

<!-- jQuery CDN - Slim version (=without AJAX) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<!-- Popper.JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
        crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script src="../../js/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
            $(this).toggleClass('active');
        });
    });
</script>
</body>
</html>
