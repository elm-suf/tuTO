var module = angular.module('mySite', ['ngMaterial']);

module.controller('studenti_ctrl', studenti_ctrl);
module.controller('docenti_ctrl', docenti_ctrl);
module.controller('corsi_ctrl', corsi_ctrl);
module.controller('prenotazioni_ctrl', prenotazioni_ctrl);

function studenti_ctrl($scope, $http, $mdDialog) {
    $http.get("/controller", {params: {'action': 'elenco_studenti'}})
        .then(function (response) {
            console.log(response.data);
            $scope.tabella = response.data;
        });

    $scope.elimina = function (x, ev) {
        var confirm = $mdDialog.confirm()
            .title('Sei sicuro?')
            .targetEvent(ev)
            .ok('OK!')
            .cancel('Chiudi');

        $mdDialog.show(confirm).then(function () {
            $http({
                method: 'GET',
                url: "/controller",
                params: {
                    'action': 'remove_studente', 'username': x.username
                }
            }).then(function () {
                $http({
                    method: 'GET',
                    url: "/controller",
                    params: {
                        'action': 'elenco_studenti'
                    }
                }).then(function (response) {
                    console.log(response.data);
                    $scope.tabella = response.data;
                })
            });
        }, function () {
            console.log("Errore caricamento")
        });
    };

}

function docenti_ctrl($scope, $http, $mdDialog) {
    $http.get("/controller", {params: {'action': 'elenco_docenti'}})
        .then(function (response) {
            console.log(response.data);
            $scope.tabella = response.data;
        });

    $scope.elimina = function (x, ev) {
        var confirm = $mdDialog.confirm()
            .title('Sei sicuro?')
            .targetEvent(ev)
            .ok('OK!')
            .cancel('Chiudi');

        $mdDialog.show(confirm).then(function () {
            $http({
                method: 'GET',
                url: "/controller",
                params: {
                    'action': 'remove_docente', 'username': x.username
                }
            }).then(function () {
                $http({
                    method: 'GET',
                    url: "/controller",
                    params: {
                        'action': 'elenco_docenti'
                    }
                }).then(function (response) {
                    console.log(response.data);
                    $scope.tabella = response.data;
                })
            });
        }, function () {
            console.log("Errore caricamento")
        });
    };
}

function corsi_ctrl($scope, $http, $mdDialog) {
    $http.get("/controller", {params: {'action': 'elenco_corsi'}})
        .then(function (response) {
            console.log(response.data);
            $scope.tabella = response.data;
        });

    $scope.elimina = function (x, ev) {
        var confirm = $mdDialog.confirm()
            .title('Sei sicuro?')
            .targetEvent(ev)
            .ok('OK!')
            .cancel('Chiudi');

        $mdDialog.show(confirm).then(function () {
            $http({
                method: 'GET',
                url: "/controller",
                params: {
                    'action': 'remove_corso', 'titolo': x.titolo
                }
            }).then(function () {
                $http({
                    method: 'GET',
                    url: "/controller",
                    params: {
                        'action': 'elenco_corsi'
                    }
                }).then(function (response) {
                    console.log(response.data);
                    $scope.tabella = response.data;
                })
            });
        }, function () {
            console.log("Errore caricamento")
        });
    }
}

function prenotazioni_ctrl($scope, $http) {
    $http.get("/controller", {params: {'action': 'elenco_prenotazioni'}})
        .then(function (response) {
            console.log(response.data);
            $scope.tabella = response.data;
        });

    $scope.elimina = function (x, ev) {
        var confirm = $mdDialog.confirm()
            .title('Sei sicuro?')
            .targetEvent(ev)
            .ok('OK!')
            .cancel('Chiudi');

        $mdDialog.show(confirm).then(function () {
            $http({
                method: 'GET',
                url: "/controller",
                params: {
                    'action': 'remove_prenotazione',
                    'docente': x.docente,
                    'studente': x.studente,
                    'slot': x.slot,
                    'data': x.data
                }
            }).then(function () {
                $http({
                    method: 'GET',
                    url: "/controller",
                    params: {
                        'action': 'elenco_prenotazioni'
                    }
                }).then(function (response) {
                    console.log(response.data);
                    $scope.tabella = response.data;
                })
            });
        }, function () {
            console.log("Errore caricamento")
        });
    }
}