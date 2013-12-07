<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body>
<%@ include file="../../Top.jsp" %>
	<form action="PasswordProc.jsp" name="passform" method="post">
		<font size="5">로그인정보 찾기</font><br> (*)되어 있는 칸을 채워 주세요.
		<p>
			<font size="3">비밀번호 찾기
				<hr>
			</font> 고객님의 이메일 주소를 입력해 주시면, 비밀번호를 전송해 드립니다.
		<p>
			<div id=err_passemail></div><p>
			이메일 * <input type="text" name="email">
		<p>
			<a onclick="passemailCheck()"><font size="5">보내기>></font></a>
	</form>
	<%@ include file="../../Bottom.jsp" %>
</body>
</html>