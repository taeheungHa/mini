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
		<font size="5">�α������� ã��</font><br> (*)�Ǿ� �ִ� ĭ�� ä�� �ּ���.
		<p>
			<font size="3">��й�ȣ ã��
				<hr>
			</font> ������ �̸��� �ּҸ� �Է��� �ֽø�, ��й�ȣ�� ������ �帳�ϴ�.
		<p>
			<div id=err_passemail></div><p>
			�̸��� * <input type="text" name="email">
		<p>
			<a onclick="passemailCheck()"><font size="5">������>></font></a>
	</form>
	<%@ include file="../../Bottom.jsp" %>
</body>
</html>