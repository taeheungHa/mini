<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"%>
<%@ page import="myShop.qna.db.*" %>
<%
	QnaBean qna = (QnaBean)request.getAttribute("qnadata");
%>

<html>
<head>
	<title>Q&A�Խ���</title>
	<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
	function modifyqna(){
		qnaform.submit();
	}
	</script>
	
</head>

<body>
<%@include file="../../Top.jsp"%>
<!-- �Խ��� ���� -->
<form action="QnaModifyAction.bo" method="post" name="qnaform">
<input type="hidden" name="gb_num" value=<%=qna.getGb_num() %>>

<div id="title">Q&A �Խ���</div>
<table class="viewcss">
<tr>
<td>�� ��</td>
<td><div><input name="gb_title" size="50" maxlength="100" value="<%=qna.getGb_title()%>"></div></td>
</tr>
	
<tr>
<td>�� ��</td>
<td><div class="viewcotents"><textarea name="gb_contents" cols="67" rows="15"><%=qna.getGb_contents() %></textarea></div></td>
</tr>

<%if(!(qna.getGb_file()==null)){ %>
<tr>
<td>���� ÷��</td>
<td><div>&nbsp;&nbsp;<%=qna.getGb_file() %></div></td>
</tr>
<%} %>
<tr>
<td>��й�ȣ</td>
<td><div><input name="gb_passwd" type="password"></div></td>
</tr>
<tr><td></td>
</tr>
	
<tr><td colspan="2">&nbsp;</td></tr>
	
<tr><td colspan="5"><font size=2>
	<a href="javascript:modifyqna()">[����]</a>&nbsp;&nbsp;
	<a href="javascript:history.go(-1)">[�ڷ�]</a>&nbsp;&nbsp;</font>
	</td>
</tr>
</table>
</form>
<!-- �Խ��� ���� -->
<%@include file="../../Bottom.jsp"%>
</body>
</html>