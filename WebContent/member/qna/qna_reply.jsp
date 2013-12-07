<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"%>
<%@ page import="myShop.qna.db.*" %>
<%
	QnaBean qna=(QnaBean)request.getAttribute("qnadata");
%>

<html>
<head>
	<title>Q&A 게시판</title>
	<script language="javascript">
	function replyqna(){
		qnaform.submit();
	}
	</script>
	<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="../../Top.jsp"%>
<!-- 게시판 답변 -->
<form action="./QnaReplyAction.bo" method="post" name="qnaform">
<input type="hidden" name="gb_num" value="<%=qna.getGb_num() %>">
<input type="hidden" name="gb_re_ref" value="<%=qna.getGb_re_ref() %>">
<input type="hidden" name="gb_re_lev" value="<%=qna.getGb_re_lev() %>">
<input type="hidden" name="gb_re_seq" value="<%=qna.getGb_re_seq()%>">

<div id="title">Q&A 게시판</div>
<table class="viewcss">
<tr>
<td>글쓴이</td>
<td><div><input name="gb_name" type="text"/></div></td>
</tr>

<tr>
<td>제 목</td>
<td><div><input name="gb_title" type="text" size="50" maxlength="100" value="Re: <%=qna.getGb_title() %>"/></div></td>
</tr>

<tr>
<td>내 용</td>
<td><div class="viewcotents"><textarea name="gb_contents" cols="67" rows="15"></textarea></div></td>
</tr>

<tr>
<td>비밀번호</td>
<td><div><input name="gb_passwd" type="password"></div></td>
</tr>
	
<tr><td colspan="2"></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>

<tr>
<td colspan="5"><a href="javascript:replyqna()">[등록]</a>&nbsp;&nbsp;
<a href="javascript:history.go(-1)">[뒤로]</a>
</td>
</tr>
</table>
</form>
<!-- 게시판 답변 -->
<%@include file="../../Bottom.jsp"%>
</body>
</html>