<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%
   request.setCharacterEncoding("euc-kr");

   String email = request.getParameter("email");
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="../../Top.jsp"   %>
	<font size="5">이 메일을 확인하세요.</font>
	<hr><p>
	<font color="green"><b>이메일을 꼭 확인하시고, 등록을 완료해 주세요. 만약 이메일을 찾을 수 없다면, 스펨함등을 확인하세요.</b></font>
	<hr><p>
	<font size="3">자세한 등록정보<hr></font>
	이메일 <%=email %>
	<%@ include file="../../Bottom.jsp"   %>
</body>
</html>