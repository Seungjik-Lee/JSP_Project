<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="JspTeam.CaptCha"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
try{
	out.clear();
	pageContext.pushBody();
	new CaptCha().getCaptCha(request, response);	
} catch(Exception e){
	e.printStackTrace();
}
%> 