<%@ page language="java" 
    pageEncoding="EUC-KR" errorPage="notice_error.jsp" import="myShop.notice.db.*"%>
    <%@ page contentType="text/html;charset=EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language=JavaScript>
function check(gb_id) {
	pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');
	document.location.href="notice_proc.jsp?action=edit&gb_id="+gb_id+"&upasswd="+pwd;
}
	// 삭제 확인을 위한 자바스크립트
	function delcheck() {
		// 메시지 창을 통해 YES/NO 확인
		result = confirm("정말로 삭제하시겠습니까 ?");
		if(result == true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지 사항 -디테일</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<%
	NoticeBean guestbook = (NoticeBean)request.getAttribute("gbook");
%>

<body >
<%-- <%@include file="Top.jsp" %> --%>
 <center>
<table border="1">
	<tr> 
	<td align="center">	
       <center>[<a href=notice_proc.jsp?action=list>게시물목록으로</a></center>

<form name=form1 method=post action=notice_proc.jsp>
<input type=hidden name="gb_id" value="<%=guestbook.getGb_id()%>">
<input type=hidden name="action" value="update">

			
			<table width="100%" border="1">

				<tr>
					<td width="350">TITLE</td>
					<td><%=guestbook.getGb_title()%></td>
				</tr>
				<tr>
					<td width="20%">NAME</td>
					<td><%=guestbook.getGb_name()%></td>
				</tr>
				<tr>
					<td width="20%">DATE</td>
					<td><%=guestbook.getGb_date()%></td>
				</tr>

				<tr>
					<td colspan="2" ><%=guestbook.getGb_contents()%></td>
				</tr>
				<%-- <tr>
					<td align=center colspan="2" bgcolor="#FFFFF"><a href=javascript:check('<%=guestbook.getGb_id()%>')>수정</a>
						<!-- <input type="button" value="삭제" onClick="delcheck()"> --></td>
				</tr> --%>

			</table>
			<center><a href=javascript:check('<%=guestbook.getGb_id()%>')>수정</a></center>
		</form>
		
		
			 </td> 
			 </tr>
			 
		</table>



<%-- <%@include file="Bottom.jsp" %> --%>
</body>
</html>