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

    <title>Inserisci Docente</title>

    <script>
        var xhr = new XMLHttpRequest();

        function insertCorso() {
            var url = "/controller?action=insert-corso&titolo=" + $('#titolo').val();
            console.log(url);
            console.log("WELCOME INSERT STUDENT");
            xhr.open("post", url, false);
            xhr.onreadystatechange = check;
            xhr.send();
        }

        function check() {
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
                <a href="dashboard.jsp"><i class="fa fa-chart-pie"></i> Dashboard</a>
            </li>
            <li>
                <a href="#studenti" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i
                        class="fa fa-user"></i> Studenti</a>
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
                    <li>
                        <a href="docenti.jsp">Elenco docenti</a>
                    </li>
                    <li class="active">
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
                        <a href="#">Inserisci corso</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#prenotazioni" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="fa fa-clock"></i> Prenotazioni</a>
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
        <h1 class="page-header">Inserisci Corso</h1>
        <hr>
        <br>
        <div class="row">
            <form class="col-xs-12 col-sm-8 col-md-6 col-lg-6" role="form">
                <div class="form-group">
                    <label>Titolo</label>
                    <input class="form-control" id="titolo">
                </div>
                <div class="form-group text-center">
                    <button id="insert-student" onclick="insertCorso()" type="submit"
                            class="btn btn-theme btn-lg btn-block">Inserisci
                    </button>
                </div>
            </form>
            <div class="col-lg-6 my-auto text-center d-none d-md-none d-lg-block">
                <i class="fa fa-book big-icon d-block mx-auto"></i>
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