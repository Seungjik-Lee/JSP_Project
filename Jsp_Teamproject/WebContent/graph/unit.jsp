<%@page import="JspTeam.grp_entity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="JspTeam.BroadDBM"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 	BroadDBM bdbm = new BroadDBM();
	String ret = bdbm.selectUnit();
	String retName = bdbm.selectUnitName();
	ArrayList<grp_entity> list = bdbm.selectUnit2();
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<!-- Font Awesome icons-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>
<script src="https://d3js.org/d3.v6.min.js"></script>
<title>기수별 지정 병원 현황</title>
<style type="text/css">
rect {
	fill: rgb(0, 1, 0)
}

rectColor {
	stroke: rgb(255, 100, 0);
	width: 3px;
	fill: rgb(0, 255, 0);
}
</style>
</head>
<body>
	<div class="jumbotron">
		<p>기수별 지정 병원 현황</p>
	</div>
	<div class="container">
		<svg id="myGraph" width="500" height="300">
    	</svg>
		<p>심평원이 지정한 기수별 기간 현황</p>
		<p>(1기) 2011.11월 ~ 2014.10월</p>
		<p>(2기) 2015~2017년</p>
		<p>(3기) 2018~2020년</p>
		<p>(4기) 2021~2023년</p>
	</div>
</body>
</html>
<script type="text/javascript">
	<%-- doGra(<%=ret%>) --%>
	var dataSet = <%=ret%> /*out.print(str);과 같은애*/
// 	Integer.parseInt(String문자)
	/*리스트만 사용 가능*/

	var dataSets =<%=retName%>
	<%-- var dataSets = <%=list.get(i).getunitName()%> --%>
	for(i=0; i<dataSet.length; i++){		
	d3.select("#myGraph")
		.append("rect")/*네모넣음*/
		.attr("class","rectColor")
		.attr("x",0)
		.attr("y",(i+1)*50)
		.attr("width",dataSet[i])
		.attr("height",30)
		
	d3.select("#myGraph")
		.append("text")/*글자넣음*/
		.text(dataSets[i])
		.attr("x", dataSet[i]+50)
		.attr("y", (i+1)*50+15)
		.attr("font-family","sans-serif")
		.attr("font-size","12px")
		.attr("fill","black")
		.attr("text-anchor","middle")
	}
	 var xScale = d3.scaleLinear()
        .domain([0, 200])
        .range([0, 200])
        
    d3.select("#myGraph")
        .append("g")
        .attr("transform", "translate(0,250)")
        .call(d3.axisBottom(xScale))
	
</script>