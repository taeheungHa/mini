<%@ page language="java" pageEncoding="EUC-KR"
	errorPage="notice_error.jsp" import="myShop.notice.db.*"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language=JavaScript>
	// ���� Ȯ���� ���� �ڹٽ�ũ��Ʈ
	function delcheck() {
		// �޽��� â�� ���� YES/NO Ȯ��
		result = confirm("������ �����Ͻðڽ��ϱ� ?");
		if (result == true) {
			document.form1.action.value = "delete";
			document.form1.submit();
		} else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� ����</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<%
	NoticeBean guestbook = (NoticeBean) request.getAttribute("gbook");
%>

<body>
	<%-- <%@include file="Top.jsp" %> --%>
	<h2>����&����</h2>
	<hr>

	<table width="100%" >
		<tr>




			<form name=form1 method=post action=notice_proc.jsp>
				<input type=hidden name="gb_id" value="<%=guestbook.getGb_id()%>">
				<input type=hidden name="action" value="update">
		</tr>

		<tr>

			<td>NAME 
		<input type="text" name="gb_name" size="20"
				value="<%=guestbook.getGb_name()%>"></td>
		</tr>
		<tr>

			<td>TITLE
			<input type="text" name="gb_title" size="20"
				value="<%=guestbook.getGb_title()%>"></td>
		</tr>

		<tr>

			<td>PASSWORD
			<input type="password" name="gb_passwd" size="21"
				value="<%=guestbook.getGb_passwd()%>"></td>
				
		</tr>
		<tr>
			<td><textarea rows="20" name="gb_contents" cols="95"><%=guestbook.getGb_contents()%></textarea></td>
		</tr>
		<tr>
			<td align="left"><input type=submit value="����"><input
				type=reset value="���"><input type="button" value="����"
				onClick="delcheck()"></td>

		</tr>
		<tr>
			<td><a href=notice_proc.jsp?action=list
				style="text-decoration: none; color: black;">�������</a></td>
		</tr>


		</form>
	</table>



	<%-- <%@include file="Bottom.jsp" %> --%>
</body>
</html>