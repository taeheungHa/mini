<%@page import="myShop.notice.db.NoticeBean"%>
<%@ page language="java" pageEncoding="EUC-KR"
	errorPage="notice_error.jsp" import="myShop.*"%>
<!-- �ѱ������ڵ�, error�� ���� notice_error.jsp ���Ϸ� �̵�, ch.14�� ��系�� import -->
<%@ page contentType="text/html;charset=EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- �� �� �� �� �� �� �� �� �� �� �� �� �� �� �Խ��� ������ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� -->
<!-- /////////////////////////////////////////////////// script /////////////////////////////////// -->
<script language=JavaScript>
    // �ش簳�������� �������� �����ϱ� ���� password ,Check
	function check(gb_id) {  
		pwd = prompt('����/���� �Ϸ��� ��й�ȣ�� ��������');  
		document.location.href = "notice_proc.jsp?action=edit&gb_id=" + gb_id
				+ "&upasswd=" + pwd;           /* ���̵�� passwordȮ���� notice_proc.jsp(��û�� ���� �� ��û�� �ذ����ִ� method:���⼱ action=edit) page�� �̵� */
	}                                          /* ��й�ȣ�� Ʋ���� ��� Ʋ�ȴٴ� ������Ʈ ��, ����â���� �̵� �������
	                                            /*  notice_edit_form�� �̵� */
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
<title>���� ���� -������</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../script.js"></script>
</head>

<%
	NoticeBean guestbook = (NoticeBean) request.getAttribute("gbook");
%>


///////////////////////////////////////////////////////////////////////////////////
<body>
	<%@include file="../../Top.jsp"%> <!-- top ȭ�鱸�� -->

	<table border="1" width="800" height="100%" align="center" valign="top">
		<tr>
			<td width="150" height="100%" rowspan="3" valign="top">
				<p align="center"> <!-- ù��°���� ù��°�� :: ����-�� ���� �̹��� ����: ������,�޴��� ���� ����-->
					<img src="../images/sidebar_01.gif" width="150" height="209"
						border="0"> <img src="../images/sidebar_02.gif" width="150"
						height="300" border="0">
				</p>
			</td>
			<td valign="top">
				<center>
					[<a href=notice_proc.jsp?action=list>�Խù��������</a>] <!--notice_proc.jsp�� action=list�� link  -->
				</center>

				<form name=form1 method=post action=notice_proc.jsp>  <!-- action���� �̺�Ʈ�� �Ͼ ��� �̵��ϴ� page:notice_proc.jsp (�� ���� action���� ���� ���ϴ� method�ٸ�.) -->
					<input type=hidden name="gb_id" value="<%=guestbook.getGb_id()%>"> 
					<input type=hidden name="action" value="update">


					<table width="633" align="center" bgcolor="#FFFFF" cellpadding="0"
						cellspacing="0" border="1">

						<tr>
							<td bgcolor="yellow" width="20%">�� ��</td>
							<td><%=guestbook.getGb_title()%></td>
						</tr>
						<tr>
							<td bgcolor="yellow" width="20%">�� �� ��</td>
							<td><%=guestbook.getGb_name()%></td>
						</tr>
						<tr>
							<td bgcolor="yellow" width="20%">�� �� �� ¥</td>
							<td><%=guestbook.getGb_date()%></td>
						</tr>

						<tr>
							<td colspan="2"><%=guestbook.getGb_contents()%></td>
						</tr>
						<%-- <tr>
					<td align=center colspan="2" bgcolor="#FFFFF"><a href=javascript:check('<%=guestbook.getGb_id()%>')>����</a>
						<!-- <input type="button" value="����" onClick="delcheck()"> --></td>
				</tr> --%>

					</table>

				</form>


			</td>
		</tr>

	</table>



	<%@include file="../../Bottom.jsp"%> <!-- �ؿ� �κ�  -->
</body>
