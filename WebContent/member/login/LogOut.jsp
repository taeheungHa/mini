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

	<font size="5">������.</font>
	<hr><p>
	<font color="green"><b>���������� �α׾ƿ��Ǿ����ϴ�. ������ �� �湮�� �ּ���!</b></font>
	<hr>
	<p>
		���������� ������ �� ������, �ֹ���Ȳ�� Ȯ���ϰ� ���ø���Ʈ�� �����Ͻ� �� �ֽ��ϴ�.
	<p>
<%@ include file="../../Bottom.jsp"   %>
</body>
</html>