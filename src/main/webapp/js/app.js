//++++++++++++++++++++++++MODULE++++++++++++++++++++++++++++++++++++++++++++++++++//
var app = angular.module("myApp", ['ngRoute']);

app.config(['$routeProvider', '$locationProvider',
    function ($routeProvider) {
        $routeProvider
            .when('/', {
                templateUrl: 'views/cerca-materia.html',
                controller: 'cercaMateriaCtrl'
            })
            .when('/tabella', {
                templateUrl: 'views/tabella.html',
                controller: 'tabellaCtrl'
            })
            .when('/login', {
                templateUrl: 'views/login-register.html'
            })
            .otherwise({redirectTo: '/'});
    }]);

app.controller("tabellaCtrl", tabellaCtrl);
app.controller("main", main);

function main ($scope, $http) {

    $scope.logout = function () {

        console.log("logout");

        $http({
            method : 'POST',
            url : '/controller',
            params : {
                action : 'logout'
            }
        }).then(function (value) {
            console.log("value = "+value);
        })

    }
}

function tabellaCtrl($scope, $http) {
    $http({
        method: 'get',
        url: '/controller',
        params: {
            action: 'lista-prenotazioni'
            // studente: 'studente'// todo prendere username da session object
        }
    }).then(function (response) {
        console.log(response.data);
        $scope.fakeData = response.data;
    }, function (reason) {
        console.log(reason);
        window.location = '/views/login-register.html';
    });

    $scope.delete = function (prenotazione) {
        console.log("elimina prenotazione : " + prenotazione.data);
        console.log("elimina fakedata =  : " + $scope.fakeData);
        // if (confirm("sei sicuro?")) {
        mscConfirm("Delete?", "Sicuro sicuro?", function () {
            var bool = deleteEntry(prenotazione, $http);
            if (bool) {
                var index = $scope.fakeData.indexOf(prenotazione);
                if (index > -1) {
                    $scope.fakeData[index].stato = 'disdetta';
                }
                alert("Deleted")
            } else {
                prompt("couldn't delete");
            }
        });

    };

    function deleteEntry(prenotazione, $http) {
        $http({
            method: 'get',
            url: '/controller',
            params: {
                action: 'disdisci',
                docente: prenotazione.docente,
                data: prenotazione.data,
                slot: prenotazione.slot,
                studente: 'studente'  //todo SESSIONE
            }
        }).then(function (response) {
            console.log(response.data);
        }, function (reason) {
            console.log("++++++Reason+++++++  " + reason);
            return false;
        });
        return true;
    }
}

//***********************CONTROLLERS*********************************************//
app.controller("cercaMateriaCtrl", cercaMateriaCtrl);
app.controller("prenotaCtrl", prenotaCtrl);


function cercaMateriaCtrl($scope, $http) {

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

        var date = $scope.inputdata.getFullYear() + '-' + ($scope.inputdata.getMonth() + 1) + '-' + $scope.inputdata.getDate();
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
            console.log(response.data);
            $scope.disponibili = response.data;
            console.log('scope' + $scope.disponibili);
        });


    };

    $scope.effettuaPrenotazione = function (slot) {
        console.log(slot);
        console.log($scope.inputcorso);

        var date = $scope.inputdata.getFullYear() + '-' + ($scope.inputdata.getMonth() + 1) + '-' + $scope.inputdata.getDate();

        $http({
            method: 'post',
            url: '/controller',
            params: {
                'action': 'prenotazione',
                'slot': slot,
                'docente': $scope.docente.username,  //todo-done sistemare qui
                'corso': $scope.inputcorso,      //todo sistema qui
                'data': date,
                'stato': 'attiva'
            }
        }).then(function (response) {
            console.log("&&&&&&&&&&&&&&&&&ok");
            console.log(response)
        }, function (reason) {
            console.log("~~~~~~~~~~~~~~~~");
            console.log(reason);
            window.location = '/views/login-register.html'
        });
    };
}