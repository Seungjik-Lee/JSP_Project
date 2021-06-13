/*!
* Start Bootstrap - Modern Business v4.3.0 (https://startbootstrap.com/template-overviews/modern-business)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-modern-business/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project


function doGraGrp(dataSet){
	var w = 350, h = 350;
	d3.select(".graph")
	    .append("svg")
	    .attr("width", w)
	    .attr("height", h)
	    .attr("id", "graphWrap");
	var color = d3.schemeCategory10;//d3에서 제공하는 10가지 색깔 활용
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
    	.append("g")//객체에 g라는 태그 붙임
    	.attr("class", "pie")//클래스명 pie
    	.attr("transform","translate("+w/2+","+h/2+")");
	
	g.append("path")//path태그로 차트에 색 넣음
    	.style("fill", function(d, i) {
    			return color[i];
    	})
	    .transition()
	    .duration(50)
	    .delay(function(d, i) {
	        return i * 50;
	    })
	    .attrTween("d", function(d, i) {// 보간처리
	        var interpolate = d3.interpolate(
	            {startAngle : d.startAngle, endAngle : d.startAngle},//각 부분의 시작각도
	             {startAngle : d.startAngle, endAngle : d.endAngle}//각 부분의 종료 각도
	        );
	        return function(t){
	             return arc(interpolate(t));//시간에 따라 처리
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
	    .data(dataset)//data값은 dataset
	    .style("height","5%")//높이가 5%일때부터
	    .style("left",(d,i)=>(i*80)+"px")//index i값만큼 막대의 left위치 계산
	    .transition().duration(500)//0.5초동안
	    .style("height",(d,i)=>d+"%")//data 값 만큼 커진다.
	
	var svg = 
	       d3.select("span")
	         .append("svg")//svg판 생성
	         .attr("width", 1000)
	         .attr("height", 500)
	         
}