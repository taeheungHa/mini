<%@ page language="java" 
    pageEncoding="EUC-KR" errorPage="notice_error.jsp" import="myShop.notice.db.*"%>
    <%@ page contentType="text/html;charset=EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language=JavaScript>
function check(gb_id) {
	pwd = prompt('����/���� �Ϸ��� ��й�ȣ�� ��������');
	document.location.href="notice_proc.jsp?action=edit&gb_id="+gb_id+"&upasswd="+pwd;
}
	// ���� Ȯ���� ���� �ڹٽ�ũ��Ʈ
	function delcheck() {
		// �޽��� â�� ���� YES/NO Ȯ��
		result = confirm("������ �����Ͻðڽ��ϱ� ?");
		if(result == true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� -������</title>
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
       <center>[<a href=notice_proc.jsp?action=list>�Խù��������</a></center>

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
					<td align=center colspan="2" bgcolor="#FFFFF"><a href=javascript:check('<%=guestbook.getGb_id()%>')>����</a>
						<!-- <input type="button" value="����" onClick="delcheck()"> --></td>
				</tr> --%>

			</table>
			<center><a href=javascript:check('<%=guestbook.getGb_id()%>')>����</a></center>
		</form>
		
		
			 </td> 
			 </tr>
			 
		</table>



<%-- <%@include file="Bottom.jsp" %> --%>
</body>
</html>