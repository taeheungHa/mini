<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<%
	session.removeAttribute("login_email"); 
/* session.invalidate(); */
%>
</head>
<body>
	<%@ include file="../../Top.jsp"   %>

	<font size="5">고객관리.</font>
	<hr><p>
	<font color="green"><b>정상적으로 로그아웃되었습니다. 다음에 또 방문해 주세요!</b></font>
	<hr>
	<p>
		개인정보를 변경할 수 있으며, 주문현황을 확인하고 위시리스트를 관리하실 수 있습니다.
	<p>
<%@ include file="../../Bottom.jsp"   %>
</body>
</html>