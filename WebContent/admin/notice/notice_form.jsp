<%@ page contentType="text/html;charset=EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록:작성화면</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="Script_01.js"></script>
</head>
<body>
	<%-- 	<%@include file="Top.jsp"%> --%>
	<div id="err_title"></div>
	<div id="err_name"></div>
	<div id="err_pass"></div>


	<H2>공지사항 글쓰기</H2>
	<HR>

	<!-- 		[<a href=notice_proc.jsp?action=list>게시물목록으로</a>
 -->
	<form name=form1 method=post action=notice_proc.jsp>

		<input type=hidden name="action" value="insert">
		<table width="100%" border="1">
			<tr>
				<td width="50" style="width: 160px;">TITLE</td>
				<td><input type="text" name="gb_title" size="60"
					style="width: 595px;"></td>

			</tr>
			<tr>

				<td align="left" width="50" colspan="1">NAME</td>
				<td><input type="text" name="gb_name" size="20"></td>


			</tr>
			<tr>
				<td width="50">PASSWORD</td>
				<td align="left" width="40"><input type="password"
					name="gb_passwd" size="21">
			</tr>
			<tr>
				<td colspan="2"><textarea rows="20" name="gb_contents"
						cols="95"></textarea></td>
			</tr>
			<tr>
				<td colspan=2 align="left"><input type="button" value="저장"
					onclick="notice_form()"><input type=reset value="취소"></td>
			</tr>
		</table>

	</form>






	<%-- 		<%@include file="Bottom.jsp"%> --%>
</body>
</html>