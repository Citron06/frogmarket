<<<<<<< Updated upstream
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
=======
<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String msg = (String) session.getAttribute("msg");
	if (msg != null)
		session.removeAttribute("msg");
	
	Member loginMember = (Member) session.getAttribute("loginMember");
	
	String keyword = (String) session.getAttribute("searchKeyword");
	String gKeyword = (String) session.getAttribute("graphKeyword");
%>
>>>>>>> Stashed changes
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< Updated upstream
<title>Frog Market</title>
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
=======
<title>Main Page</title>
>>>>>>> Stashed changes
>>>>>>> 1e4bd583052f1a5332a3ee54a4db057f52317737
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/style.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
=======
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script>
	<% if(msg != null) { %> 
		alert("<%= msg %>"); 
	<% } %>
</script>
>>>>>>> Stashed changes
</head>
<body>
	<!-- header시작 -->
	<header>
		<div class="header-container">
			<div class="head main-title">
<<<<<<< Updated upstream
				<img src="<%= request.getContextPath() %>/img/frog (1).png"
					class="header-img" alt="">
				<h1>깨꿀마켓</h1>
			</div>
			<div class="head search">
				<input type="text" name="header-search" id="header-search">
			</div>
			<div class="head menu">
				<div class="head market">
					<a href="<%= request.getContextPath() %>/market/marketList"><h1>마켓 게시판</h1></a>
=======
				<img src="<%= request.getContextPath() %>/img/frog (1).png" class="header-img" alt="">
				<a href="<%= request.getContextPath() %>"><h1>깨꿀마켓</h1></a>
			</div>
			<div class="head search">
			<%if(request.getRequestURI().equals("/frog/WEB-INF/views/graph/graph.jsp")) {%>
				<form action="<%=request.getContextPath()%>/graph/graphView" method="get">
				<input type="text" placeholder="검색어를 입력" name="header-search" id="header-search" value="<%=gKeyword != null ? gKeyword : ""%>">
				</form>
			<%} else { %>
				<form action="<%=request.getContextPath()%>/market/marketFinder" method="get">
				<input type="text" placeholder="검색어를 입력" name="header-search" id="header-search" value="<%=keyword != null ? keyword : ""%>">
				<%} %>
				</form>
			</div>
			<div class="head menu">
				<div class="head market">
				<%if(keyword!=null){ %>
					<a href="<%= request.getContextPath() %>/market/marketFinder?header-search=<%=keyword %>"><h1>마켓 게시판</h1></a>
				<%} else { %>
					<a href="<%= request.getContextPath() %>/market/marketList"><h1>마켓 게시판</h1></a>
				<%} %>
>>>>>>> Stashed changes
				</div>
				<div class="head graph">
					<a href="<%= request.getContextPath() %>/graph/graphView"><h1>한눈 그래프</h1></a>
				</div>
				<div class="head black-list">
					<a href="<%= request.getContextPath() %>/report/reportList"><h1>신고 게시판</h1></a>
				</div>
				<div class="head login">
<<<<<<< Updated upstream
					<input type="button" value="Login" onclick="location.href='<%= request.getContextPath() %>/member/login';">
					<!-- <input type="button" value="My Page" onclick="location.href='<%= request.getContextPath() %>';"> -->
=======
<<<<<<< HEAD
					<% if(loginMember == null) { %>
=======
<<<<<<<< Updated upstream:WebContent/WEB-INF/views/common/header.jsp
					<% if(session.getAttribute("loginUser") == null) { %>
>>>>>>> 1e4bd583052f1a5332a3ee54a4db057f52317737
					<input type="button" value="Login" onclick="location.href='<%= request.getContextPath() %>/member/login';">
					<% } else { %>
					<input type="button" value="My Page" onclick="location.href='<%= request.getContextPath() %>/member/memberView';">
					<% } %>
<<<<<<< HEAD
=======
========
					<input type="button" value="Login" onclick="location.href='<%= request.getContextPath() %>/member/login';">
>>>>>>>> Stashed changes:frogmarket/WebContent/WEB-INF/views/common/header.jsp
>>>>>>> 1e4bd583052f1a5332a3ee54a4db057f52317737
>>>>>>> Stashed changes
				</div>
			</div>
		</div>
	</header>
	<!-- header끝 -->