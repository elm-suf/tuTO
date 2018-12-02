<%@ page import="dao.StudenteDAO" %>
<%@ page import="dao.DocenteDAO" %>
<%@ page import="dao.CorsoDAO" %>
<%@ page import="dao.PrenotazioneDAO" %><%--
  Created by IntelliJ IDEA.
  User: Lorenzo
  Date: 04/11/2018
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="../../css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/fontawesome.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/angular-material.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular-route.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.10/angular-material.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular-animate.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular-aria.js"></script>
    <script src="../../js/app.js"></script>

    <title>Elenco Docenti</title>
</head>
<body ng-app="myApp">

<div id="wrapper">

    <!-- Navigation -->
    <div class="wrapper">
        <!-- Sidebar -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <a href="dashboard.jsp"><h3>Benvenuto <% out.print(session.getAttribute("username"));%>!</h3></a>
            </div>

            <ul class="list-unstyled components">
                <li>
                    <a href="dashboard.jsp"><i class="fa fa-chart-pie"></i> Dashboard</a>
                </li>
                <li>
                    <a href="#studenti" data-toggle="collapse" aria-expanded="false"
                       class="dropdown-toggle"><i class="fa fa-user"></i> Studenti</a>
                    <ul class="collapse list-unstyled" id="studenti">
                        <li>
                            <a href="studenti.jsp">Elenco studenti</a>
                        </li>
                        <li>
                            <a href="ins_studente.jsp">Inserisci studente</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#docenti" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i
                            class="fa fa-chalkboard-teacher"></i> Docenti</a>
                    <ul class="collapse list-unstyled" id="docenti">
                        <li class="active">
                            <a href="#">Elenco docenti</a>
                        </li>
                        <li>
                            <a href="ins_docente.jsp">Inserisci docente</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#corsi" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i
                            class="fa fa-book"></i> Corsi</a>
                    <ul class="collapse list-unstyled" id="corsi">
                        <li>
                            <a href="corsi.jsp">Elenco corsi</a>
                        </li>
                        <li>
                            <a href="ins_corso.jsp">Inserisci corso</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#prenotazioni" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i
                            class="fa fa-clock"></i> Prenotazioni</a>
                    <ul class="collapse list-unstyled" id="prenotazioni">
                        <li>
                            <a href="prenotazioni.jsp">Elenco prenotazioni</a>
                        </li>
                        <li>
                            <a href="ins_prenotazione.jsp">Inserisci prenotazione</a>
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

                    <div class="collapse navbar-collapse" id="navbarSupportedContent" ng-controller="main">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="/JSPs/profilo.jsp">Profilo <i class="fa fa-user"></i></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" ng-click="logout()" href="/views/login-register.html">Logout <i class="fas fa-sign-out-alt"></i></a>
                            </li>
                        </ul>
                    </div>

                </div>
            </nav>
            <div class="container" style="overflow: auto" ng-controller="docenti_ctrl" ng-cloak>
                <h1 class="page-header">Elenco Docenti</h1>
                <hr style="margin-top: 0;">
                <br>

                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Username</th>
                        <th scope="col">Password</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Cognome</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="x in tabella" ng-init="index=1">
                        <th scope="row">{{tabella.indexOf(x)}}</th>
                        <td>{{x.username}}</td>
                        <td>{{x.password}}</td>
                        <td>{{x.nome}}</td>
                        <td>{{x.cognome}}</td>
                        <td>
                            <md-button class="md-raised md-warn" ng-click="elimina(x, $event)">
                                Elimina
                            </md-button>
                        </td>
                    </tr>
                    </tbody>

                </table>

            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
        crossorigin="anonymous"></script>
<script src="../../js/bootstrap/bootstrap.min.js"></script>
<script src="../../js/fontawesome.min.js"></script>
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
