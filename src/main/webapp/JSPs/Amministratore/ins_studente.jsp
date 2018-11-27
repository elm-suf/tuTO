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
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../../css/bootstrap/bootstrap.min.css">
        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="../../css/fontawesome.css">
        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="../../css/style.css">

        <title>Inserisci Studente</title>

        <script>
            var insertStudentBtn = document.getElementById('insert-student');
            var xhr = new XMLHttpRequest();

            function insertStudent() {
                var url = "/controller?action=insert-student&username=" + $('#username').val() + "&nome=" + $('#nome').val() + "&cognome=" + $('#cognome').val() + "&password=" + $('#password').val();
                console.log(url);
                console.log("WELCOME INSERT STUDENT");
                xhr.open("post", url, false);
                xhr.onreadystatechange = buildHtmlTable;
                xhr.send();
            }


            function buildHtmlTable() {
                //quando la response e' ready posso controllare lo status della response 200 -> success else -> error
                if (xhr.readyState === 4) {
                    if (xhr.status !== 200) {
                        alert('error status ' + xhr.status);
                    } else {
                        alert("success");
                    }
                }
            }
        </script>

    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3>Benvenuto <% out.print(session.getAttribute("username"));%>!</h3>
                </div>

                <ul class="list-unstyled components">
                    <li>
                        <a href="dashboard.jsp">Dashboard</a>
                    </li>
                    <li>
                        <a href="#studenti" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Studenti</a>
                        <ul class="collapse list-unstyled" id="studenti">
                            <li>
                                <a href="studenti.jsp">Elenco studenti</a>
                            </li>
                            <li class="active">
                                <a href="#">Inserisci studente</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#docenti" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Docenti</a>
                        <ul class="collapse list-unstyled" id="docenti">
                            <li>
                                <a href="docenti.jsp">Elenco docenti</a>
                            </li>
                            <li>
                                <a href="ins_docente.jsp">Inserisci docente</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#corsi" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Corsi</a>
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
                        <a href="#prenotazioni" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Prenotazioni</a>
                        <ul class="collapse list-unstyled" id="prenotazioni">
                            <li>
                                <a href="#">Elenco prenotazioni</a>
                            </li>
                            <li>
                                <a href="#">Inserisci prenotazione</a>
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
                        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-align-justify"></i>
                        </button>

                    </div>
                </nav>
                <h1 class="page-header">Inserisci Studente</h1>
                <hr>
                <br>
                <div class="row">
                    <form class="col-xs-12 col-sm-8 col-md-6 col-lg-6" role="form">
                        <label>Username</label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">@</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Es: LiliArdi" aria-label="Username" aria-describedby="basic-addon1">
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input class="form-control" id="password">
                        </div>
                        <div class="form-group">
                            <label>Nome</label>
                            <input class="form-control" id="nome">
                        </div>
                        <div class="form-group">
                            <label>Cognome</label>
                            <input class="form-control" id="cognome">
                        </div>
                        <div class="form-group text-center">
                            <button id="insert-student" onclick="insertStudent()" type="submit"
                                    class="btn btn-theme btn-lg btn-block">Inserisci
                            </button>
                        </div>
                    </form>
                    <div class="col-lg-6 my-auto text-center d-none d-md-none d-lg-block">
                        <i class="fa fa-user big-icon d-block mx-auto"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Font Awesome JS -->
        <script src="../../js/fontawesome.min.js"></script>

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

<!--
<div id="page-wrapper">
    <h1 class="page-header">Inserisci Studente</h1>
    <div class="row vertical-center ">
        <form class="col-xs-12 col-sm-8 col-md-6 col-lg-6" role="form">
            <label>Username</label>
            <div class="form-group input-group">
                <span class="input-group-addon">@</span>
                <input class="form-control" id="username" type="text" placeholder="Es. LiliArdi">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input class="form-control" id="password">
            </div>
            <div class="form-group">
                <label>Nome</label>
                <input class="form-control" id="nome">
            </div>
            <div class="form-group">
                <label>Cognome</label>
                <input class="form-control" id="cognome">
            </div>
            <div class="form-group text-center">
                <button id="insert-student" onclick="insertStudent()" type="submit"
                        class="btn btn-primary btn-lg btn-block">Inserisci
                </button>
            </div>
        </form>
        <div class="col-lg-8 center-block text-center d-none d-md-none d-lg-block">
            <i class="fa fa-user fa-17x "></i>
        </div>
    </div>
</div>
-->