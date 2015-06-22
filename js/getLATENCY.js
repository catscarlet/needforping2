function MyX(whichjson) {

	var MyXA = new Array();
	$.ajaxSettings.async = false;
	$.getJSON("./shell/pingresult/" + whichjson, function(data) {
		$.each(data, function(infoIndex, info) {
			MyXA[infoIndex] = info["TIME"];

		})

	})

	return MyXA;
}

function MyYLATENCY(whichjson) {
	var MyA = new Array();
	var str = new Number;
	$.ajaxSettings.async = false;
	$.getJSON("./shell/pingresult/" + whichjson, function(data) {
		$.each(data, function(infoIndex, info) {
			str = Math.round(info["avg"]);

			MyA[infoIndex] = str;

			//alert(MyA[infoIndex]);
		})

	})

	return MyA;
}


$(function() {
	var json2 = new Array();

	//alert(MyY("server1.catscarlet.com.json"))

	$('#LATENCY_container').highcharts({

		chart: {
			type: 'spline',
			renderTo: "LATENCY_container"
		},

		title: {
			text: '服务器网络延迟',
			x: -20 //center
		},
		subtitle: {
			text: 'Source: pi.catscarlet.com',
			x: -20
		},
		xAxis: {
			categories: MyX("server1.catscarlet.com.json")
			//categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
		},
		yAxis: {
			title: {
				text: '延迟(ms)'
			},

			value: 0,
			width: 1,
			color: '#808080'

		},
		tooltip: {
			valueSuffix: 'ms'
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
				//pointInterval: 3600000, // one hour
				//pointStart: Date.UTC(2009, 9, 6, 0, 0, 0)
			}
		},
		series: [{
				name: 'server1.catscarlet.com',
				//data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]

				data: MyYLATENCY("server1.catscarlet.com.json")
			}, {
				name: 'BudgetVM - Chicago',
				//data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
				//data: MyyAxis
				data: MyYLATENCY("199.231.208.6.json")
			}, {
				name: 'BudgetVM - Dallas',
				//data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
				//data: MyyAxis
				data: MyYLATENCY("192.80.186.135.json")
			}, {
				name: 'BudgetVM - LosAngeles',
				//data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
				//data: MyyAxis
				data: MyYLATENCY("192.157.214.6.json")
			}, {
				name: 'BudgetVM - Miami',
				//data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
				//data: MyyAxis
				data: MyYLATENCY("172.246.125.7.json")
			}, {
				name: 'Bandwagon Host - Phoenix',
				//data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
				//data: MyyAxis
				data: MyYLATENCY("198.35.46.10.json")
			}, {
				name: 'Bandwagon Host - LosAngeles',
				//data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
				//data: MyyAxis
				data: MyYLATENCY("104.194.76.20.json")
			}, {
				name: 'Bandwagon Host - Florida',
				//data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
				//data: MyyAxis
				data: MyYLATENCY("23.252.104.22.json")
			}, {
				name: 'Bandwagon Host - Holland',
				//data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
				//data: MyyAxis
				data: MyYLATENCY("192.243.124.74.json")
			}

		]
	});
});