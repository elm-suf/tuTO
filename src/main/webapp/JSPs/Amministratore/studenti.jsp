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

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.5/angular.min.js"></script>
    <!-- jQuery -->
    <script src="../../bootstrap/jquery/jquery.min.js"></script>
    <![endif]-->

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
                    <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                        <a href="login_amm.jsp"><i class="fa fa-dashboard fa-fw" ></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-user fa-fw"></i> Studenti<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level in">
                            <li>
                                <a href="#" class="active" >Elenco Studenti</a>
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
        <h1 class="page-header">Elenco Studenti</h1>
        <table class="table table-striped table-bordered table-hover" id = "elenco"></table>
    </div>

</div>


<script src="../../bootstrap/morrisjs/morris.min.js"></script>
<script src="../../bootstrap/raphael/raphael.min.js"></script>


<!-- Bootstrap Core JavaScript -->
<script src="../../bootstrap/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../../bootstrap/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../../bootstrap/dist/js/sb-admin-2.js"></script>
</body>
</html>
