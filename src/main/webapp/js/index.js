// todo script per funzioni ajax riguardanti la pagina index.html

var xmlReq = new XMLHttpRequest();

function sendQuery() {
    console.log('send query()');
    xmlReq.open('get', '/controller?subject=' + document.getElementById('subject-input').value + '&action=insegnamenti', true);
    console.log('send query() open');
    xmlReq.onreadystatechange = displayData;
    console.log('send query() onready');
    xmlReq.send();
// console.log('/controller?subject=' + document.getElementById('subject-input').value + '&action=query');
}

function displayData() {
    console.log("console status redystate" + xmlReq.status + xmlReq.readyState);
    if (xmlReq.status == 200 && xmlReq.readyState == 4) {
        console.log('got response displayData()');
        console.log(xmlReq.responseText);
        var json = JSON.parse(xmlReq.responseText);

        var div = document.getElementById('display-lessons');
        var content = document.createElement('div');
        content.id = 'display-lessons';
        for (var i in json) {
            var li = document.createElement('div');
// li.innerHTML = "<div class=\"jumbotron jumbotron-fluid\">\n" +
//     "  <div class=\"container\">\n" +
            //     "    <h1 class=\"display-4\">" + json[i].username + "</h1>\n" +
            //     "    <p class=\"lead\">json[i]</p>\n" +
            //     "  </div>\n" +
//     "</div>";

            li.innerHTML = "<div class='card text-center'>" +
                "<div class='card-header'>" + json[i].username + "</div>" +
                "<div class='card-body'>" +
                "<h5 class='card-title'>" + json[i].nome+" "+ json[i].cognome + "</h5>"+
                "<button id='prenota' onclick='prenota()'>Prenota Ora</button>" +
                "</h5></div>";
            content.appendChild(li);
        }
        div.parentNode.replaceChild(content, div);
    }
}

function showAllUsers() {
    console.log("Show users;");
    xmlReq.open('get', '/controller?action=allstudents', true);
    console.log('/controller?action=allstudents');
    xmlReq.onreadystatechange = myFunction;
    xmlReq.send(null);
}

function myFunction() {
    console.log("console status redystate" + xmlReq.status + ' ' + xmlReq.readyState);
    console.log('DENTRO FUNCTION');
    if (xmlReq.status == 200 && xmlReq.readyState == 4) {
        console.log('got response myFunction!');
        console.log(xmlReq.responseText);
        document.getElementById('display-users').innerHTML = xmlReq.responseText;
    }
}

function hideall() {
    $(".jumbotron").toggle();
}