<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"%>
<html>
<head>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
	<title>Q&A 게시판</title>
	
	<script language="javascript">
	function addqna(){
		qnaform.submit();
	}
	</script>
	
</head>
<body>
<%@include file="../../Top.jsp"%>
<!-- 게시판 등록 -->
<form action="./QnaWriteAction.bo" method="post" 
	enctype="multipart/form-data" name="qnaform">
<div id="title">Q&A게시판</div>	
<table>
	<tr>
		<td><div align="center">글쓴이</div></td>
		<td align="left"><input name="gb_name" type="text" size="10" maxlength="10" value=""/></td>
	</tr>
	<tr>
		<td><div align="center">비밀번호</div></td>
		<td align="left"><input name="gb_passwd" type="password" size="10" maxlength="10" value=""/></td>
	</tr>
	<tr>
		<td><div align="center">제 목</div></td>
		<td align="left"><input name="gb_title" type="text" size="50" maxlength="100" value=""/></td>
	</tr>
	<tr>
		<td><div align="center">내 용</div></td>
		<td align="left"><textarea name="gb_contents" cols="67" rows="15"></textarea></td>
	</tr>
	<tr>
		<td><div align="center">파일 첨부</div></td>
		<td align="left"><input name="gb_file" type="file"/></td>
	</tr>
	<tr>
		<td colspan="2"></td>
	</tr>
	<tr>
	    <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="5">
			<a href="javascript:addqna()">[등록]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 등록 -->
<%@include file="../../Bottom.jsp"%>
</body>
</html>