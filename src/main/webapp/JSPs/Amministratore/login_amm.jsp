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
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Bootstrap Core CSS -->
        <link href="../../bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="../../bootstrap/metisMenu/metisMenu.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="../../bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">
        <!-- Morris Charts CSS -->
        <link href="../../bootstrap/morrisjs/morris.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="../../bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <title>Admin Dashboard</title>
    </head>
    <body>
        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                        <a class="navbar-brand">Benvenuto <% out.print(session.getAttribute("username"));%>!</a>
                </div>
                <ul class="nav navbar-top-links navbar-left">
                    <!-- /.dropdown -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-left">
                            <li>
                                <a href="#">
                                    <i class="fa fa-user fa-fw"></i> Profilo Utente</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Impostazioni</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="index.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->
                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li>
                                <a href="#" class="active"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> Studenti<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="studenti.jsp">Elenco Studenti</a>
                                    </li>
                                    <li>
                                        <a href="ins_studente.jsp">Inserisci Studente</a>
                                    </li>
                                    <li>
                                        <a href="#">Rimuovi Studente</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> Docenti<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="#">Elenco Docenti</a>
                                    </li>
                                    <li>
                                        <a href="#">Inserisci Docente</a>
                                    </li>
                                    <li>
                                        <a href="#">Rimuovi Docente</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-book fa-fw"></i> Corsi<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="#">Elenco Corsi</a>
                                    </li>
                                    <li>
                                        <a href="#">Inserisci Corso</a>
                                    </li>
                                    <li>
                                        <a href="#">Rimuovi Corso</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-clock-o fa-fw"></i> Prenotazioni<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="#">Elenco Prenotazioni</a>
                                    </li>
                                    <li>
                                        <a href="#">Inserisci Prenotazione</a>
                                    </li>
                                    <li>
                                        <a href="#">Rimuovi Prenotazione</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Dashboard</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="col-lg-3 col-md-6 col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-users fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><%out.print(StudenteDAO.getN());%>
                                    </div>
                                    <div>Studenti</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-users fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                                        <%out.print(DocenteDAO.getN());%>
                                    </div>
                                    <div>Docenti</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-book fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                                        <%out.print(CorsoDAO.getN());%>
                                    </div>
                                    <div>Corsi</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-clock-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                                        <%out.print(PrenotazioneDAO.getN());%>
                                    </div>
                                    <div>Prenotazioni</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Da modificare
            <div class="collapse" id="student">
                <form action="insert_studente">
                    <div class="form-group">
                        <input name="username" class="form-control" placeholder="Username">
                        <input name="password" type="password" class="form-control" placeholder="Password">
                        <input name="nome" class="form-control" placeholder="Nome">
                        <input name="cognome" class="form-control" placeholder="Cognome">
                    </div><br>
                    <button type="submit" value="ins_stud" class="btn btn-primary" id="sign">Inserisci</button>
                </form>
            </div>
            -->
        </div>

        <!-- jQuery -->
        <script src="../../bootstrap/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../../bootstrap/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../../bootstrap/metisMenu/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript
        <script src="../../vendor/morrisjs/morris.min.js"></script> -->
        <script src="../../bootstrap/raphael/raphael.min.js"></script>
        <!-- <script src="../../data/morris-data.js"></script> -->

        <!-- Custom Theme JavaScript -->
        <script src="../../bootstrap/dist/js/sb-admin-2.js"></script>
    </body>
</html>
