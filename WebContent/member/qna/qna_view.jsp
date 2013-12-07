<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="myShop.qna.db.*" %>
<%
	QnaBean qna = (QnaBean)request.getAttribute("qnadata");
%>

<html>
<head>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
	<title>Q&A 게시판</title>
	
</head>

<body>
<%@include file="../../Top.jsp"%>
<!-- 게시판 수정 -->
<div id="title">Q&A 게시판</div>
<table width="100%" class="viewcss">
<tr>
<td width="20%">제 목&nbsp;&nbsp;</td>
<td><div><%=qna.getGb_title()%></div></td>
</tr>
	
<tr>
<td></td>
</tr>

<tr>
<td>내 용</td>
<td>
	<div class="viewcotents"><%=qna.getGb_contents() %></div>
</td>
</tr>
<tr>
<td>첨부파일</td>
<td><div>
		<%if(!(qna.getGb_file()==null)){ %>
		<a href="./qnaupload/<%=qna.getGb_file()%>">
			<%=qna.getGb_file() %>
		</a>
		<%} %>
		</div></td>
	</tr>
	
	<tr>
		<td></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr>
		<td colspan="5">
			<font>
			<a href="./QnaReplyView.bo?num=<%=qna.getGb_num() %>">
			[답변]
			</a>&nbsp;&nbsp;
			<a href="./QnaModify.bo?num=<%=qna.getGb_num() %>">
			[수정]
			</a>&nbsp;&nbsp;
			<a href="./QnaDelete.bo?num=<%=qna.getGb_num() %>">
			[삭제]
			</a>&nbsp;&nbsp;
			<a href="./QnaList.bo">[목록]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
<!-- 게시판 수정 -->
<%@include file="../../Bottom.jsp"%>
</body>
</html>