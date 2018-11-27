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
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../../css/bootstrap/bootstrap.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="../../css/fontawesome.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="../../css/style.css">

    <script>
        var xhr = new XMLHttpRequest();
        function elenco_studenti() {
            var url = "/controller?action=elenco_studenti";
            xhr.open("GET", url, true);
            xhr.onreadystatechange = buildHtmlTable;
            xhr.send(null);
        }

        function buildHtmlTable() {
            if(xhr.readyState === 4 && xhr.status === 200) {
                selector = '#elenco';
                console.log(xhr.responseText);
                myList = JSON.parse(xhr.responseText);
                console.log(myList);
                var columns = addAllColumnHeaders(myList, selector);
                for (var i = 0; i < myList.length; i++) {
                    var row$ = $('<tr/>');
                    var th$ = ($('<th scope="row"/>').html(i));
                    row$.append(th$);
                    for (var colIndex = 0; colIndex < columns.length; colIndex++) {
                        var cellValue = myList[i][columns[colIndex]];
                        if (cellValue == null) cellValue = "";
                        row$.append($('<td/>').html(cellValue));
                    }
                    $(selector).append(row$);
                }
            }
        }

        // Adds a header row to the table and returns the set of columns.
        // Need to do union of keys from all records as some records may not contain
        // all records.
        function addAllColumnHeaders(myList, selector) {
            var columnSet = [];
            var headerTr$ = $('<thead/>');
            var tbody$ = $('<tbody/>');
            headerTr$.append($('<th scope="col"/>').html('#'));

            for (var i = 0; i < myList.length; i++) {
                var rowHash = myList[i];
                for (var key in rowHash) {
                    if (key !== 'id' && $.inArray(key, columnSet) === -1) {
                        columnSet.push(key);
                        headerTr$.append($('<th scope="col"/>').html(key));
                    }
                }
            }
            $(selector).append(headerTr$);
            $(selector).append(tbody$);

            return columnSet;
        }

        /*$(document).ready(function(){
            $.ajax({
                url: '/controller?action=elenco_studenti',
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                }
            });
        });*/


    </script>
    <title>Elenco Studenti</title>
</head>
<body onload="elenco_studenti()">
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
                        <a href="dashboard.jsp">Dashboard</a>
                    </li>
                    <li>
                        <a href="#studenti" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Studenti</a>
                        <ul class="collapse list-unstyled" id="studenti">
                            <li class="active">
                                <a href="#">Elenco studenti</a>
                            </li>
                            <li>
                                <a href="ins_studente.jsp">Inserisci studente</a>
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
                                <a href="#">Elenco corsi</a>
                            </li>
                            <li>
                                <a href="#">Inserisci corso</a>
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
                        <!-- Aggiungere icona omino -->
                    </div>
                </nav>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-md-7 col-lg-9">
                            <h1 class="page-header">Elenco Studenti</h1>
                        </div>
                        <div class="col-sm-4 col-md-5 col-lg-3 my-auto float-right align-bottom">
                            <button style="width:100%; margin-bottom:1em" class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                Rimuovi studente
                            </button>
                            <div class="collapse" id="collapseExample">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" placeholder="Username" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button">OK</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr style="margin-top: 0;">
                    <br>
                    <table class="table table-striped table-bordered table-hover" id = "elenco"></table>
                </div>
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
