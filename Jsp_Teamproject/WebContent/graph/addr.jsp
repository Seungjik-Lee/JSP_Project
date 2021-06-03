<%@page import="java.util.List"%>
<%@page import="JspTeam.grp_entity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="JspTeam.BroadDBM"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BroadDBM bdbm = new BroadDBM();
	String ret = bdbm.selectAddr();
	ArrayList<grp_entity> list = bdbm.selectAddr2();
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>지역별 지정 병원 현황</title>
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
<style type="text/css">

.blue   { background: #5abae6; }
.red    { background: #d34e4e; }
.green  { background: #9dbb19; }
.yellow { background: #f7b358; }

span{
    position: absolute;
    display: inline-block;
    width: 60px;
    bottom: 0;
    font-size: 15px;
    line-height: 1.8em;
    /* color: #FFF; */
    text-align: center;
    border-radius: 15px;	
}

.grdiv{
    position: relative;
    height: 450px;
    top:10%;
    left:10%;
}

</style>
</head>
<body>
<%
	int count = 0;
	int sum=0;
   	String color[] = {"blue","red","green","yellow"};
   	ArrayList<String> color1 = new ArrayList<String>();
	for(int i=0; i<list.size(); i++){
		color1.add(i,color[count]);
		count++;
		
		if(count>3){
	count=0;
		}
		//System.out.println(count);
		//System.out.println(color1);
	}
%>
	<div class="jumbotron">
		<p>전국 시,도 지역별 지정 병원 현황</p>
	</div>
	<div class="grdiv ml-3">
	<%
		for(int i =0; i<11;i++){
			grp_entity ct = list.get(i);
	%>
	<span class="<%out.println(color1.get(i));%>"><%=ct.getCityName()%><br/><%=ct.getCityNum()%> </span>
	<%} %>	
	</div>
	<p></p>
	<div class="container">
	 <table class = "table table-hover">
			<thead>
				<tr>
					<th>지역이름</th>
					<th>지정병원 수</th>
				</tr>
			</thead>
			<tbody>
			<% for (int i=0; i<list.size(); i++){ %>
				<tr>
					<td><%=list.get(i).getCityName()%></td>
					<td><%=list.get(i).getCityNum()%></td>
				</tr>
			<% } %>
			</tbody>
	</table>
   	<p>
   	총 지정병원 수 : 420개
   	</p>
	</div>
</body>
</html>
<script type="text/javascript">
	doGraAddr(<%=ret%>)
</script>