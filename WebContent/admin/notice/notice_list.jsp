<%@ page language="java" pageEncoding="EUC-KR"
	errorPage="notice_error.jsp" import="java.util.*, myShop.notice.db.*,myShop.notice.action.*"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="../style.css" rel="stylesheet" type="text/css">

<script language=JavaScript>
	function check(gb_id) {
		pwd = prompt('����/���� �Ϸ��� ��й�ȣ�� ��������');
		document.location.href = "notice_proc.jsp?action=edit&gb_id=" + gb_id
				+ "&upasswd=" + pwd;
	}
	function no_detail(gb_id) {
		document.location.href = "notice_proc.jsp?action=no_detail&gb_id="
				+ gb_id;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����:���ȭ��</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<%
	NoticeMgr gb = new NoticeMgr();
	ArrayList<NoticeBean> datas = gb.getDBList();
%>

<body>
	<%-- <%@include file="Top.jsp" %> --%>

	<td><h2>��������</h2></td>
	<hr>
	<table width="100%" >

		<tr>
			<td colspan="4">
				<form>

					<tr>
						<td bgcolor=#DCDCDC align="center" width="10%">��ȣ</td>
						<td bgcolor="#DCDCDC" align="center" width="2000">����</td>
						<td bgcolor="#DCDCDC" align="center" width="10%">��¥</td>
						<td bgcolor="#DCDCDC" align="center" width="10%">�ۼ���</td>


					</tr>
					<tr>


					</tr>
					<%
						// ArrayList ��ü�� ���� DB���� ������ ����� �����.
						for (NoticeBean guestbook : datas) {
					%>
					<tr>
						<td align="center"><%=guestbook.getGb_id()%></td>
						<td ><a href=javascript:no_detail('<%=guestbook.getGb_id()%>')><%=guestbook.getGb_title()%></a></td>
						<td align="center"><%=guestbook.getGb_date()%></td>
						<td align="center"><%=guestbook.getGb_name()%></td>
					</tr>
					<%
						}
					%>




				</form>
			</td>
		</tr>

	</table>

	<hr>
	<td align="right"><a href="notice_form.jsp" style="text-decoration: none; color: black;">�۾���</a></td>

	<%-- <%@include file="Bottom.jsp" %> --%>
</body>
</html>