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
	<font size="5">�� ������ Ȯ���ϼ���.</font>
	<hr><p>
	<font color="green"><b>�̸����� �� Ȯ���Ͻð�, ����� �Ϸ��� �ּ���. ���� �̸����� ã�� �� ���ٸ�, �����Ե��� Ȯ���ϼ���.</b></font>
	<hr><p>
	<font size="3">�ڼ��� �������<hr></font>
	�̸��� <%=email %>
	<%@ include file="../../Bottom.jsp"   %>
</body>
</html>