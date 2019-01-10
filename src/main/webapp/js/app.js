//++++++++++++++++++++++++MODULE++++++++++++++++++++++++++++++++++++++++++++++++++//
var studente = angular.module("studente", ['ngRoute', 'ngMaterial']);
var amministratore = angular.module("amministratore", ['ngRoute', 'ngMaterial']);

studente.run(function ($rootScope) {
    function getCookie(cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }

    console.log("studente.run");
    console.log("cookie : " + getCookie('logged'));
    console.log($rootScope.logged);
    $rootScope.logged = false;
    console.log($rootScope.logged);
});

studente.config(['$routeProvider', '$locationProvider',
    function ($routeProvider) {
        $routeProvider
            .when('/', {
                templateUrl: 'html/Studente/homepage.html',
                controller: 'homepage_ctrl'
            })
            .when('/profilo', {
                templateUrl: 'html/profilo.html',
                controller: 'profilo_ctrl'
            })
            .when('/cerca', {
                templateUrl: 'html/Studente/cerca-materia.html',
                controller: 'cercaMateriaCtrl'
            })
            .when('/tabella', {
                templateUrl: 'html/Studente/tabella.html',
                controller: 'tabellaCtrl'
            })
            .when('/login', {
                templateUrl: 'html/login-register.html',
                controller: 'login_ctrl'
            })
            .otherwise({redirectTo: '/'});
    }]);

amministratore.config(['$routeProvider', '$locationProvider',
    function ($routeProvider) {
        $routeProvider
            .when('/', {
                templateUrl: 'dashboard.html'
            })
            .when('/profilo', {
                templateUrl: '../profilo.html',
                controller: 'profilo_ctrl'
            })
            .when('/studenti', {
                templateUrl: 'studenti.html',
                controller: 'studenti_ctrl'
            })
            .when('/corsi', {
                templateUrl: 'corsi.html',
                controller: 'corsi_ctrl'
            })
            .when('/docenti', {
                templateUrl: 'docenti.html',
                controller: 'docenti_ctrl'
            })
            .when('/insegnamenti', {
                templateUrl: 'insegnamenti.html',
                controller: 'insegnamenti_ctrl'
            })
            .when('/prenotazioni', {
                templateUrl: 'prenotazioni.html',
                controller: 'prenotazioni_ctrl'
            })
            .when('/inserisci_studente', {
                templateUrl: 'inserisci_studente.html'
            })
            .when('/inserisci_corso', {
                templateUrl: 'inserisci_corso.html'
            })
            .when('/inserisci_docente', {
                templateUrl: 'inserisci_docente.html'
            })
            .when('/inserisci_insegnamento', {
                templateUrl: 'inserisci_insegnamento.html'
            })
            .when('/inserisci_prenotazione', {
                templateUrl: 'inserisci_prenotazione.html'
            })
            .when('/login', {
                templateUrl: 'views/login-register.html'
            })
            .otherwise({redirectTo: '/'});
    }]);

studente.controller("tabellaCtrl", tabellaCtrl);
studente.controller("cercaMateriaCtrl", cercaMateriaCtrl);
studente.controller("homepage_ctrl", homepage_ctrl);
studente.controller("profilo_ctrl", profilo_ctrl);
studente.controller("prenotaCtrl", prenotaCtrl);
studente.controller("login_ctrl", login_ctrl);
studente.controller("register_ctrl", register_ctrl);
studente.controller("main", main);

amministratore.controller('dashboard_ctrl', dashboard_ctrl);
amministratore.controller('studenti_ctrl', studenti_ctrl);
amministratore.controller('inserisci_studente_ctrl', inserisci_studente_ctrl);
amministratore.controller('docenti_ctrl', docenti_ctrl);
amministratore.controller('inserisci_docente_ctrl', inserisci_docente_ctrl);
amministratore.controller('corsi_ctrl', corsi_ctrl);
amministratore.controller('inserisci_corso_ctrl', inserisci_corso_ctrl);
amministratore.controller('prenotazioni_ctrl', prenotazioni_ctrl);
amministratore.controller('inserisci_prenotazione_ctrl', inserisci_prenotazione_ctrl);
amministratore.controller('insegnamenti_ctrl', insegnamenti_ctrl);
amministratore.controller('inserisci_insegnamento_ctrl', inserisci_insegnamento_ctrl);
amministratore.controller("profilo_ctrl", profilo_ctrl);
amministratore.controller("main", main);

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function main($scope, $http, $rootScope) {

    $scope.logout = function () {
        console.log("logout");
        $rootScope.logged = false;
        $http({
            method: 'POST',
            url: '/controller',
            params: {
                action: 'logout'
            }
        }).then(function (value) {
            console.log("value = " + value);
            window.location.href = "/#login";
        }, function (reason) {
            console.log(reason);
            window.location.href = "/#login";
        })

    }
}

function inserisci_studente_ctrl($scope, $http, $mdDialog) {
    $scope.inserisci_studente = function () {
        $http({
            method: 'POST',
            url: '/controller',
            params: {
                action: 'insert_student',
                username: $scope.username,
                password: $scope.password,
                nome: $scope.nome,
                cognome: $scope.cognome
            }
        }).then(function (value) {
            console.log("value = " + value);
            var success = $mdDialog.alert()
                .title('Studente inserito')
                .ok('OK!');
            $mdDialog.show(success);

        }, function (reason) {
            console.log(reason);
            var insuccess = $mdDialog.alert()
                .title('Studente non inserito')
                .ok('OK!');
            $mdDialog.show(insuccess);
        })
    }
}

function inserisci_docente_ctrl($scope, $http, $mdDialog) {
    $scope.inserisci_docente = function () {
        $http({
            method: 'POST',
            url: '/controller',
            params: {
                action: 'insert_docente',
                username: $scope.username,
                password: $scope.password,
                nome: $scope.nome,
                cognome: $scope.cognome
            }
        }).then(function (value) {
            console.log("value = " + value);
            var success = $mdDialog.alert()
                .title('Docente inserito')
                .ok('OK!');
            $mdDialog.show(success);

        }, function (reason) {
            console.log(reason);
            var insuccess = $mdDialog.alert()
                .title('Docente non inserito')
                .ok('OK!');
            $mdDialog.show(insuccess);
        })
    }
}

function inserisci_corso_ctrl($scope, $http, $mdDialog) {
    $scope.inserisci_corso = function () {
        $http({
            method: 'POST',
            url: '/controller',
            params: {
                action: 'insert_corso',
                titolo: $scope.titolo
            }
        }).then(function (value) {
            console.log("value = " + value);
            var success = $mdDialog.alert()
                .title('Corso inserito')
                .ok('OK!');
            $mdDialog.show(success);

        }, function (reason) {
            console.log(reason);
            var insuccess = $mdDialog.alert()
                .title('Corso non inserito')
                .ok('OK!');
            $mdDialog.show(insuccess);
        })
    }
}

function inserisci_prenotazione_ctrl($scope, $http, $mdDialog) {
    $http.get("/controller", {params: {'action': 'elenco_corsi'}})
        .then(function (response) {
            console.log(response.data);
            $scope.corsi = response.data;
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
        });

    $http.get("/controller", {params: {'action': 'elenco_studenti'}})
        .then(function (response) {
            console.log(response.data);
            $scope.studenti = response.data;
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
        });

    $scope.getDocenti = function(){
        console.log("cambiato");
        $http.get("/controller",
            {
                params: {
                    action: 'insegnamenti',
                    subject: $scope.corso
                }
            })
            .then(function (response) {
                console.log(response.data);
                $scope.docenti = response.data;
            })
    };

    $scope.inserisci_prenotazione = function () {
        $http({
            method: 'POST',
            url: '/controller',
            params: {
                action: 'insert_prenotazione',
                stato: $scope.stato,
                studente: $scope.studente,
                docente: $scope.docente,
                corso: $scope.corso,
                slot: $scope.slot,
                data: $scope.data
            }
        }).then(function (value) {
            console.log("value = " + value);
            var success = $mdDialog.alert()
                .title('Prenotazione inserita')
                .ok('OK!');
            $mdDialog.show(success);

        }, function (reason) {
            console.log(reason);
            var insuccess = $mdDialog.alert()
                .title('Prenotazione non inserita')
                .ok('OK!');
            $mdDialog.show(insuccess);
        })
    }
}

function inserisci_insegnamento_ctrl($scope, $http, $mdDialog) {
    $http.get("/controller", {params: {'action': 'elenco_corsi'}})
        .then(function (response) {
            console.log(response.data);
            $scope.corsi = response.data;
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
        });

    $http.get("/controller", {params: {'action': 'elenco_docenti'}})
        .then(function (response) {
            console.log(response.data);
            $scope.docenti = response.data;
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
        });

    $scope.inserisci_insegnamento = function () {
        $http({
            method: 'POST',
            url: '/controller',
            params: {
                action: 'insert_insegnamento',
                corso: $scope.corso,
                docente: $scope.docente
            }
        }).then(function (value) {
            console.log("value = " + value);
            var success = $mdDialog.alert()
                .title('Insegnamento inserito')
                .ok('OK!');
            $mdDialog.show(success);

        }, function (reason) {
            console.log(reason);
            var insuccess = $mdDialog.alert()
                .title('Insegnamento non inserito')
                .ok('OK!');
            $mdDialog.show(insuccess);
        })
    }
}

function register_ctrl($scope, $http, $mdDialog) {
    $scope.register = function () {
        $http({
            method: 'POST',
            url: '/controller',
            params: {
                action: 'register',
                nome: $scope.nome,
                cognome: $scope.cognome,
                username: $scope.username,
                password: $scope.password
            }
        }).then(function (response) {
            if (response.status === 201) {
                var success = $mdDialog.alert()
                    .title('Registrazione avvenuta come:  ' + response.data["username"])
                    .ok('OK!');
                $mdDialog.show(success);
            }
        }, function () {
            var insuccess = $mdDialog.alert()
                .title('Registrazione non avvenuta')
                .ok('OK!');
            $mdDialog.show(insuccess);
        })
    }
}


function login_ctrl($scope, $http, $rootScope) {
    $scope.login = function () {
        console.log($scope.username, $scope.password);
        $http({
            method: 'get',
            url: '/controller',
            params: {
                action: 'login',
                username: $scope.username,
                password: $scope.password
            }
        }).then(function (response) {
            console.log(response);
            console.log($rootScope.logged);
            console.log(response.data);
            console.log(getCookie('isAdmin'));
            if (response.status === 200) {

                $rootScope.userlogged = response.data;
                $rootScope.logged = true;
                if (getCookie('isAdmin') == 'true') {
                    console.log("amsssministratore");
                    window.location = "/html/Amministratore/index.html";
                } else {
                    window.location = "/#";
                }
            }
        }, function (reason) {
            console.log(reason);
            $rootScope.logged = "false";
            console.log(reason.data);
            alert(reason.statusText);
        });
    };


    function getCookie(cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }

    function setCookie(cname, cvalue, exdays) {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }
}

function homepage_ctrl($scope, $rootScope, $http) {
    var init = function () {
        console.log("init cookie: " + getCookie('logged'));
        $http({
            method: 'GET',
            url: '/controller',
            params: {
                'action': 'elenco_corsi'
            }
        }).then(function (response) {
            $scope.courses = response.data;
            console.log(response.data);
        })
    };
    init();

    console.log("rootscope logged = " + $rootScope.logged);
    if ($rootScope.logged === false)
        window.location.href = "/#cerca";

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
        window.location.href = "/#login";
        // location.replace("/html/-register.html");
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


function cercaMateriaCtrl($scope, $http) {
    $scope.inputcorso;
    $scope.detail = false;
    console.log("inside controller");
    var init = function () {
        $http({
            method: 'GET',
            url: '/controller',
            params: {
                'action': 'elenco_corsi'
            }
        }).then(function (response) {
            $scope.courses = response.data;
            console.log(response.data);
        })
    };
    init();

    //essenzialmente aggiorno il valore di elenco su cui faccio li
    $scope.getInsegnanti = function (course) {
        $scope.inputcorso = course;
        $scope.detail = true;
        // console.log("fammi vedere gli insegnanti che insegnano " + course.titolo);
        console.log("titolto" + course);
        console.log("iTHISnputcorso = " + this.inputcorso);
        console.log("Scopenputcorso = " + $scope.inputcorso);

        $http({
            method: 'GET',
            url: '/controller',
            params: {
                'action': 'insegnamenti',
                'subject': course//.titolo
            }
        }).then(function (response) {
            $scope.elenco = response.data;
            //console.log(response.data);
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
        });
    };

    $scope.mostraDisponibilita = function (docente, inputdata) {
        console.log("mostro disponibilita input ");
        console.log(inputdata);

        var date = inputdata.getFullYear() + '-' + (inputdata.getMonth() + 1) + '-' + inputdata.getDate();
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
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
        });
    };

    $scope.effettuaPrenotazione = function (slot, inputdata, docente) {
        console.log(slot);
        console.log("thisinput " + this.inputcorso);
        console.log("Scopenputcorso = " + $scope.inputcorso);

        var date = inputdata.getFullYear() + '-' + (inputdata.getMonth() + 1) + '-' + inputdata.getDate();

        $http({
            method: 'post',
            url: '/controller',
            params: {
                'action': 'prenotazione',
                'slot': slot,
                'docente': docente.username,  //todo-done sistemare qui
                'corso': this.inputcorso,      //todo sistema qui
                'data': date,
                'stato': 'attiva'
            }
        }).then(function (response) {
            console.log(response);
            console.log("splice " + $scope.disponibili.indexOf(slot));
            $scope.disponibili.splice($scope.disponibili.indexOf(slot), 1);
        }, function (reason) {
            console.log("~~~~~~~~~~~~~~~~");
            console.log(reason);
            window.location.href = "/#login";
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
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
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
            console.log(response);
            console.log("splice " + $scope.disponibili.indexOf(slot));
            $scope.disponibili.splice($scope.disponibili.indexOf(slot), 1);
        }, function (reason) {
            console.log("~~~~~~~~~~~~~~~~");
            console.log(reason);
            location.replace("/html/login-register.html");
        });
    };
}

function studenti_ctrl($scope, $http, $mdDialog) {
    $http.get("/controller", {params: {'action': 'elenco_studenti'}})
        .then(function (response) {
            console.log(response.data);
            $scope.tabella = response.data;
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
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
                    'action': 'remove_studente',
                    'username': x.username
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
            }, function (reason) {
                console.log(reason);
                location.replace("/html/login-register.html");
            });
        });
    };

}

function docenti_ctrl($scope, $http, $mdDialog) {
    $http.get("/controller", {params: {'action': 'elenco_docenti'}})
        .then(function (response) {
            console.log(response.data);
            $scope.tabella = response.data;
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
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
                    'action': 'remove_docente',
                    'username': x.username
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
            }, function (reason) {
                console.log(reason);
                location.replace("/html/login-register.html");
            });
        });
    };
}

function corsi_ctrl($scope, $http, $mdDialog) {
    $http.get("/controller", {params: {'action': 'elenco_corsi'}})
        .then(function (response) {
            console.log(response.data);
            $scope.tabella = response.data;
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
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
                    'action': 'remove_corso',
                    'titolo': x.titolo
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
            }, function (reason) {
                console.log(reason);
                location.replace("/html/login-register.html");
            });
        });
    }
}

function prenotazioni_ctrl($scope, $http, $mdDialog) {
    $http.get("/controller", {params: {'action': 'elenco_prenotazioni'}})
        .then(function (response) {
            console.log(response.data);
            $scope.tabella = response.data;
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
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
                    'stato': x.stato,
                    'studente': x.studente,
                    'docente': x.docente,
                    'corso': x.corso,
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
            }, function (reason) {
                console.log(reason);
                location.replace("/html/login-register.html");
            });
        });
    }
}

function insegnamenti_ctrl($scope, $http, $mdDialog) {
    $http.get("/controller", {params: {'action': 'elenco_insegnamenti'}})
        .then(function (response) {
            console.log(response.data);
            $scope.tabella = response.data;
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
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
                    'action': 'remove_insegnamento',
                    'corso': x.corso,
                    'docente': x.docente
                }
            }).then(function () {
                $http({
                    method: 'GET',
                    url: "/controller",
                    params: {
                        'action': 'elenco_insegnamenti'
                    }
                }).then(function (response) {
                    console.log(response.data);
                    $scope.tabella = response.data;
                })
            }, function (reason) {
                console.log(reason);
                location.replace("/html/login-register.html");
            });
        });
    }
}

function profilo_ctrl($scope, $http) {
    $http.get("/controller", {params: {'action': 'profilo'}})
        .then(function (response) {
            console.log(response.data);
            $scope.us_profilo = response.data["username"];
            $scope.pas_profilo = response.data["password"];
            $scope.nome_profilo = response.data["nome"];
            $scope.cogn_profilo = response.data["cognome"];
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
        });
}

function dashboard_ctrl($scope, $http) {
    $http.get("/controller", {params: {'action': 'statistiche'}})
        .then(function (response) {
            console.log(response.data);
            $scope.n_studenti = response.data[0];
            $scope.n_docenti = response.data[1];
            $scope.n_insegnamenti = response.data[2];
            $scope.n_corsi = response.data[3];
            $scope.n_prenotazioni = response.data[4];
        }, function (reason) {
            console.log(reason);
            location.replace("/html/login-register.html");
        });
}