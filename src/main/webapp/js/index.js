var cercaMateria = angular.module("moduloCeraMateria", []);

cercaMateria.controller("cercaMateriaCtrl", CercaMateria);
cercaMateria.controller("prenotaCtrl", prenotaCtrl);

function CercaMateria($scope, $http) {

    //essenzialmente aggiorno il valore di elenco su cui faccio li
    $scope.getInseganti = function () {
        console.log("fammi vedere gli insegnanti che insegnano " + $scope.inputcorso);

        $http({
            method: 'GET',
            url: '/controller',
            params: {
                'action': 'insegnamenti',
                'subject': $scope.inputcorso
            }
        }).then(function (response) {
            $scope.elenco = response.data;
            console.log(response.data);
        });
    };
}

function prenotaCtrl($scope, $http) {

    $scope.mostraDisponibilita = function (docente) {
        console.log("mostro disponibilita input ");
        console.log($scope.inputdata);

        var date = $scope.inputdata.getFullYear() + '-' + ($scope.inputdata.getMonth()+1) + '-' + $scope.inputdata.getDate();
        console.log('date = ' + date);
        $http({
            method: 'GET',
            url: '/controller',
            params: {
                'action': 'disponibilita',
                'docente': docente.username,
                'data': date
            }
        }).then(function (response) {
            // $scope.elenco = response.data;
            document.getElementById('display-lessons').innerHTML = response.data;
            console.log(response.data);
            $scope.disponibili = response.data;
        });
    };



    $scope.effettuaPrenotazione = function (slot) {
        console.log(slot);
        console.log($scope.inputcorso);

        var date = $scope.inputdata.getFullYear() + '-' + ($scope.inputdata.getMonth()+1) + '-' + $scope.inputdata.getDate();

        $http({
            method : 'get',
            url : '/controller',
            params : {
                'action' : 'prenotazione',
                'slot' : slot,
                'docente' : $scope.docente.username,  //todo-done sistemare qui
                'corso' : $scope.inputcorso,      //todo sistema qui
                'data' : date,
                'stato' : 'attiva'
             }

        });
    }
}