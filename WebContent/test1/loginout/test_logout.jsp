<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
session.setAttribute("s_email", null);
session.invalidate();
response.sendRedirect("../test_main.jsp");
%>
