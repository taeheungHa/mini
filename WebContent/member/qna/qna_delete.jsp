<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
%>
<html>
<head>
<title>Q&A �Խ���</title>
</head>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<body>
<%@include file="../../Top.jsp"%>
<form name="deleteForm" action="./QnaDeleteAction.bo?num=<%=num %>" 
	method="post">
<div id="title">Q&A �Խ���</div>
<table class="viewcss">
<tr>
	<td><font size=2>�� ��й�ȣ : </font></td>
	<td><div><input name="gb_passwd" type="password"></div></td>
</tr>
<tr>
	<div><td colspan=2 align=center><a href="javascript:deleteForm.submit()">����</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">���ư���</a></div></td>
</tr>
</table>
</form>
<%@include file="../../Bottom.jsp"%>
</body>
</html>