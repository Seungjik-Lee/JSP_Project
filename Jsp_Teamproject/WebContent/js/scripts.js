/*!
* Start Bootstrap - Modern Business v4.3.0 (https://startbootstrap.com/template-overviews/modern-business)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-modern-business/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project


function doGraUnit(dataSet){
	d3.select("#myGraph")
	.selectAll("rect")
	.data(dataSet)
	.enter()
	.append("rect")
	.attr("x", 0)
	.attr("y", function(d,i){
		return i * 50;
    })
    .attr("height", "30px")
	.attr("width", "10px")
    .transition()
    .delay(function(d,i){
        return i*500;
    })
    .duration(function(d,i){
        return 2500;
    })
    .attr("width", function(d,i){
        return d+"px";
    })
    
    var xScale = d3.scaleLinear()
        .domain([0, 150])
        .range([0, 150])
        
    d3.select("#myGraph")
        .append("g")
        .attr("transform", "translate(0,210)")
        .call(d3.axisBottom(xScale))
        
    var svg = 
 	       d3.select("span")
 	         .append("svg")
 	         .attr("width", 1000)
 	         .attr("height", 500)
 	         
 	var yScale = d3.scaleLinear()
 	.domain([0, d3.max(dataset)]).range([500, 0]);   
 	
 	var yAxis = d3.axisLeft().scale(yScale);
 	         
 	svg.append("g")
 	   .attr("transform", "translate(0, -50)")
 	   .call(yAxis);
}


function doGraGrp(dataSet){
	var w = 350, h = 350;
	d3.select(".graph")
	    .append("svg")
	    .attr("width", w)
	    .attr("height", h)
	    .attr("id", "graphWrap");
	var color = d3.schemeCategory10;
	// pie 생성
	// var pie = d3.layout.pie(); // d3 v3 버전
	var pie = d3.pie();
	var arc = d3.arc().innerRadius(40).outerRadius(150);
    // 원 그리기
	
	var svg = d3.select(".one-graph")
    	.append("svg")
    	.attr("width", w)
    	.attr("height", h)
    	.attr("id", "graphWrap")
	
    var g = svg.selectAll(".pie")
    	.data(pie(dataSet))
    	.enter()
    	.append("g")
    	.attr("class", "pie")
    	.attr("transform","translate("+w/2+","+h/2+")");
	
	g.append("path")
    	.style("fill", function(d, i) {
    			return color[i];
    	})
	    .transition()
	    .duration(1000)
	    .delay(function(d, i) {
	        return i * 1000;
	    })
	    .attrTween("d", function(d, i) {// 보간처리
	        var interpolate = d3.interpolate(
	            {startAngle : d.startAngle, endAngle : d.startAngle},
	             {startAngle : d.startAngle, endAngle : d.endAngle}
	        );
	        return function(t){
	             return arc(interpolate(t));
	        } 
	    });
	

	g.append("text")
    	.attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
    	.attr("dy", ".35em")
    	.style("text-anchor", "middle")
    	.text(function(d, i) {
    		return dataSet[i] + "개";
    });

	// text 정 중앙에 텍스트 넣기
	svg.append("text")
    	.attr("class", "total")
    	.attr("transform", "translate("+(w/2-35)+", "+(h/2+5)+")")
    	.text("합계:" + d3.sum(dataSet));
}   

function doGraAddr(dataset){
	d3.selectAll("span")
	    .data(dataset)
	    .style("height","5%")
	    .style("left",(d,i)=>(i*80)+"px")
	    .transition().duration(1500)
	    .style("height",(d,i)=>d+"%");
	
	var svg = 
	       d3.select("span")
	         .append("svg")
	         .attr("width", 1000)
	         .attr("height", 500)
	         
	var yScale = d3.scaleLinear()
	.domain([0, d3.max(dataset)]).range([500, 0]);   
	
	var yAxis = d3.axisLeft().scale(yScale);
	         
	svg.append("g")
	   .attr("transform", "translate(0, -50)")
	   .call(yAxis);
	
}