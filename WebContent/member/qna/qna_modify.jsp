<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"%>
<%@ page import="myShop.qna.db.*" %>
<%
	QnaBean qna = (QnaBean)request.getAttribute("qnadata");
%>

<html>
<head>
	<title>Q&A게시판</title>
	<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
	function modifyqna(){
		qnaform.submit();
	}
	</script>
	
</head>

<body>
<%@include file="../../Top.jsp"%>
<!-- 게시판 수정 -->
<form action="QnaModifyAction.bo" method="post" name="qnaform">
<input type="hidden" name="gb_num" value=<%=qna.getGb_num() %>>

<div id="title">Q&A 게시판</div>
<table class="viewcss">
<tr>
<td>제 목</td>
<td><div><input name="gb_title" size="50" maxlength="100" value="<%=qna.getGb_title()%>"></div></td>
</tr>
	
<tr>
<td>내 용</td>
<td><div class="viewcotents"><textarea name="gb_contents" cols="67" rows="15"><%=qna.getGb_contents() %></textarea></div></td>
</tr>

<%if(!(qna.getGb_file()==null)){ %>
<tr>
<td>파일 첨부</td>
<td><div>&nbsp;&nbsp;<%=qna.getGb_file() %></div></td>
</tr>
<%} %>
<tr>
<td>비밀번호</td>
<td><div><input name="gb_passwd" type="password"></div></td>
</tr>
<tr><td></td>
</tr>
	
<tr><td colspan="2">&nbsp;</td></tr>
	
<tr><td colspan="5"><font size=2>
	<a href="javascript:modifyqna()">[수정]</a>&nbsp;&nbsp;
	<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;</font>
	</td>
</tr>
</table>
</form>
<!-- 게시판 수정 -->
<%@include file="../../Bottom.jsp"%>
</body>
</html>