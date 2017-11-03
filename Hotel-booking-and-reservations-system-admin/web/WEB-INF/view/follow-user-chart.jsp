<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="common/sub-content.jspf"%>

<!-- Styles -->
<style>
    #chartdiv {
        width: 100%;
        height: 500px;
    }

    .amcharts-export-menu-top-right {
        top: 10px;
        right: 0;
    }
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<!-- Chart code -->
<script>
    var data = ${jsonchart};
    
    for (var i = 0; i < data.length; i++) {
        var element = data[i];
        if (element.visits > 40)
            element.color = "#FF0F00";
        else if (element.visits > 30)
            element.color = "#FF6600";
        else if (element.visits > 20)
            element.color = "#FF9E01";
        else if (element.visits > 11)
            element.color = "#FCD202";
        else if (element.visits > 10)
            element.color = "#F8FF01";
        else if (element.visits > 9)
            element.color = "#B0DE09";
        else if (element.visits > 8)
            element.color = "#04D215";
        else if (element.visits > 7)
            element.color = "#0D8ECF";
        else if (element.visits > 6)
            element.color = "#0D52D1";
        else if (element.visits > 5)
            element.color = "#2A0CD0";
        else if (element.visits > 4)
            element.color = "#8A0CCF";
        else 
            element.color = "#CD0D74";
    }

    var chart = AmCharts.makeChart("chartdiv", {
        "type": "serial",
        "theme": "light",
        "marginRight": 70,
        "dataProvider": data,
        "valueAxes": [{
                "axisAlpha": 0,
                "position": "left",
                "title": "Visitors from country"
            }],
        "startDuration": 1,
        "graphs": [{
                "balloonText": "<b>[[category]]: [[value]]</b>",
                "fillColorsField": "color",
                "fillAlphas": 0.9,
                "lineAlpha": 0.2,
                "type": "column",
                "valueField": "visits"
            }],
        "chartCursor": {
            "categoryBalloonEnabled": false,
            "cursorAlpha": 0,
            "zoomable": false
        },
        "categoryField": "country",
        "categoryAxis": {
            "gridPosition": "start",
            "labelRotation": 45
        },
        "export": {
            "enabled": true
        }

    });
</script>




<div class="row">
    <div class="col-xs-12">
        <div class="panel">
            <header class="panel-heading">
                IP Address Statistics

            </header>
            <div id="chartdiv"></div>
        </div>
    </div>            
</div>
<%@ include file="common/footer.jspf"%>