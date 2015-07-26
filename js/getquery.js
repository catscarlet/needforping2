var xmlHttp

function getecho() {
    xmlHttp = GetXmlHttpObject()
    if (xmlHttp == null) {
        alert("Browser does not support HTTP Request")
        return
    }

    var url = "query.php"
    url = url + "?q=" + "server2.catscarlet.com" + "&sid=" + Math.random()
    xmlHttp.onreadystatechange = stateChanged
    xmlHttp.open("GET", url, true)
    xmlHttp.send(null)
}

function stateChanged() {
    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {

        var mycars=new Array() ;
        mycars = xmlHttp.responseText.concat();

        document.getElementById("ajax_test").innerHTML = xmlHttp.responseText;
    }
}

function GetXmlHttpObject() {
    var xmlHttp = null;
    try {
        // Firefox, Opera 8.0+, Safari
        xmlHttp = new XMLHttpRequest();
    } catch (e) {
        //Internet Explorer
        try {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlHttp;
}
