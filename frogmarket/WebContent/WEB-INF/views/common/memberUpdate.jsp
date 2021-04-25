<%@page import="notice.model.vo.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Notice> noticeList = (List<Notice>)request.getAttribute("noticeList");
%>
<!DOCTYPE html>
<html>
<head>
<title>Frog Market</title>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/style.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>
<body>
<h1 class="mini-title">Update Profile</h1>
    <div class="acount-container">
        <form class="acount-form" action="">
            <label for="">이름</label><input type="text" name="" id="">
            <label for="">별명</label><input type="text" name="" id="">
            <label for="">비밀번호</label><input type="password" name="" id="">
            <label for="">비밀번호 확인</label><input type="password" name="" id="">
            <label for="">이메일</label><input type="email" name="" id="">
            <label for="">전화번호호호호호호호호호호호호홓호</label><input type="tel" name="" id="">
        </form>
        <hr>
        <div class="btns">
            <input type="button" name="" id="" value="cancel">
            <input type="button" name="" id="" value="submit">
        </div>
    </div>
    <div class="notice-container">
    	<ul>
    		<li>테스트1</li>
    		<li>테스트2</li>
    	</ul>
    </div>
</body>
</html>