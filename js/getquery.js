var xmlHttp
//$.ajaxSettings.async = false;

function getquery() {
    xmlHttp = GetXmlHttpObject()
    if (xmlHttp == null) {
        alert("Browser does not support HTTP Request")
        return
    }

    var url = "query.php"
    var query_server = "server2.catscarlet.com"
    url = url + "?q=" + query_server + "&sid=" + Math.random()
    xmlHttp.onreadystatechange = stateChanged
    xmlHttp.open("GET", url, true)
    xmlHttp.send(null)
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


function stateChanged() {
    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
        //var mycars = new Array();
        //mycars = xmlHttp.responseText.concat();
        window.obj = eval ("(" + xmlHttp.responseText + ")");
        //window.ajax_change_txt = "VAR!!!";
        //document.getElementById("ajax_test").innerHTML = obj.server_name +  window.obj[1].loss_percent;
/*
        window.testarray = new Array();
        testarray[0] = obj.loss_percent[0];
        testarray[1] = obj.loss_percent[1];
        testarray[2] = obj.loss_percent[2];
*/
        //document.getElementById("ajax_test").innerHTML = testarray[2];
        //ajax_test_change();
        draw_LOSS();
        draw_LATENCY();

    }
}
