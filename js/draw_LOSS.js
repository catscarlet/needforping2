function MyX(whichjson) {

    var MyXA = new Array();
    $.ajaxSettings.async = false;
    $.getJSON('./shell/pingresult/' + whichjson, function (data) {
        $.each(data, function (infoIndex, info) {
            MyXA[infoIndex] = info.TIME;
        });
    });
    return MyXA;
}

function MyYLOSS(whichjson) {
    var MyA = new Array();
    var str = new Number;
    $.ajaxSettings.async = false;
    $.getJSON('./shell/pingresult/' + whichjson, function (data) {
        $.each(data, function (infoIndex, info) {
            str = info.LOSS.replace(/%/, '');
            MyA[infoIndex] = 100 - Number(str);
        });
    });
    return MyA;
}

function draw_LOSS() {
//document.getElementById("ajax_test").innerHTML = testarray;
    $('#LOSS_container').highcharts({

        chart: {
            type: 'spline',
            renderTo: 'LOSS_container'
        },

        title: {
            text: '服务器网络连通率',
            x: -20 // center
        },
        subtitle: {
            text: 'Source: pi.catscarlet.com',
            x: -20
        },
        xAxis: {
            categories: obj.DATETIME
            //categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: '连通率 (%)'
            },

            value: 0,
            width: 1,
            color: '#808080'

        },
        tooltip: {
            valueSuffix: '%'
        },
        legend: {
            enabled: true,
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        plotOptions: {
            spline: {
                lineWidth: 2,
                states: {
                    hover: {
                        lineWidth: 5
                    }
                },
                marker: {
                    enabled: false
                },
                // pointInterval: 3600000, // one hour
                // pointStart: Date.UTC(2009, 9, 6, 0, 0, 0)
            }
        },
        series: [{
                //name: 'Tokyo',
                name: obj.server_name ,
                data: obj.loss_percent
                //data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                //data: window.obj[1].loss_percent
            }
/*
            ,

            {
                name: 'BudgetVM - Chicago',
                data: MyYLOSS('199.231.208.6.json')
            },

            {
                name: 'BudgetVM - Dallas',
                data: MyYLOSS('192.80.186.135.json')
            },

            {
                name: 'BudgetVM - LosAngeles',
                data: MyYLOSS('192.157.214.6.json')
            },

            {
                name: 'BudgetVM - Miami',
                data: MyYLOSS('172.246.125.7.json')
            },

            {
                name: 'Bandwagon Host - Phoenix',
                data: MyYLOSS('198.35.46.10.json')
            },

            {
                name: 'Bandwagon Host - LosAngeles',
                data: MyYLOSS('104.194.76.20.json')
            },

            {
                name: 'Bandwagon Host - Florida',
                data: MyYLOSS('23.252.104.22.json')
            },

            {
                name: 'Bandwagon Host - Holland',
                data: MyYLOSS('192.243.124.74.json')
            },

            {
                name: 'Bandwagon Host - Arizona',
                data: MyYLOSS('198.35.46.1.json')
            }
            */
        ]
    });
};
