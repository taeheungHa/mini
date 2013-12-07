<%@page import="myShop.notice.db.NoticeBean"%>
<%@ page language="java" pageEncoding="EUC-KR"
	errorPage="notice_error.jsp" import="myShop.*"%>
<!-- 한글포함코딩, error가 날시 notice_error.jsp 파일로 이동, ch.14의 모든내용 import -->
<%@ page contentType="text/html;charset=EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ 게시판 디자인 ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ -->
<!-- /////////////////////////////////////////////////// script /////////////////////////////////// -->
<script language=JavaScript>
    // 해당개인정보가 본인임을 증명하기 위한 password ,Check
	function check(gb_id) {  
		pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');  
		document.location.href = "notice_proc.jsp?action=edit&gb_id=" + gb_id
				+ "&upasswd=" + pwd;           /* 아이디와 password확인후 notice_proc.jsp(요청에 대한 각 요청을 해결해주는 method:여기선 action=edit) page로 이동 */
	}                                          /* 비밀번호가 틀렸을 경우 틀렸다는 프롬프트 후, 이전창으로 이동 맞을경우
	                                            /*  notice_edit_form로 이동 */
	// 삭제 확인을 위한 자바스크립트
	
	
	function delcheck() {
		// 메시지 창을 통해 YES/NO 확인
		result = confirm("정말로 삭제하시겠습니까 ?");
		if (result == true) {
			document.form1.action.value = "delete";
			document.form1.submit();
		} else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지 사항 -디테일</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../script.js"></script>
</head>

<%
	NoticeBean guestbook = (NoticeBean) request.getAttribute("gbook");
%>


///////////////////////////////////////////////////////////////////////////////////
<body>
	<%@include file="../../Top.jsp"%> <!-- top 화면구성 -->

	<table border="1" width="800" height="100%" align="center" valign="top">
		<tr>
			<td width="150" height="100%" rowspan="3" valign="top">
				<p align="center"> <!-- 첫번째행의 첫번째열 :: 문단-두 개의 이미지 삽입: 고객문의,휴대폰 구입 순서-->
					<img src="../images/sidebar_01.gif" width="150" height="209"
						border="0"> <img src="../images/sidebar_02.gif" width="150"
						height="300" border="0">
				</p>
			</td>
			<td valign="top">
				<center>
					[<a href=notice_proc.jsp?action=list>게시물목록으로</a>] <!--notice_proc.jsp의 action=list로 link  -->
				</center>

				<form name=form1 method=post action=notice_proc.jsp>  <!-- action에서 이벤트가 일어날 경우 이동하는 page:notice_proc.jsp (각 받은 action값에 따라 행하는 method다름.) -->
					<input type=hidden name="gb_id" value="<%=guestbook.getGb_id()%>"> 
					<input type=hidden name="action" value="update">


					<table width="633" align="center" bgcolor="#FFFFF" cellpadding="0"
						cellspacing="0" border="1">

						<tr>
							<td bgcolor="yellow" width="20%">제 목</td>
							<td><%=guestbook.getGb_title()%></td>
						</tr>
						<tr>
							<td bgcolor="yellow" width="20%">작 성 자</td>
							<td><%=guestbook.getGb_name()%></td>
						</tr>
						<tr>
							<td bgcolor="yellow" width="20%">작 성 날 짜</td>
							<td><%=guestbook.getGb_date()%></td>
						</tr>

						<tr>
							<td colspan="2"><%=guestbook.getGb_contents()%></td>
						</tr>
						<%-- <tr>
					<td align=center colspan="2" bgcolor="#FFFFF"><a href=javascript:check('<%=guestbook.getGb_id()%>')>수정</a>
						<!-- <input type="button" value="삭제" onClick="delcheck()"> --></td>
				</tr> --%>

					</table>

				</form>


			</td>
		</tr>

	</table>



	<%@include file="../../Bottom.jsp"%> <!-- 밑에 부분  -->
</body>
