var xmlReq = new XMLHttpRequest();

function sendQuery() {
    console.log('send query()');
    xmlReq.open('get', '/controller?subject=' + document.getElementById('subject-input').value + '&action=query', true);
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

        document.getElementById('display-lessons').innerHTML = xmlReq.responseText;
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