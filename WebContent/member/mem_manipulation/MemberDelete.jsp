<%@ page contentType="text/html;charset=EUC-KR"%>

<%
	if (session.getAttribute("idKey") == null) { // session���κ��� idKey��� �Ӽ��� �� Ȯ���ϴµ� �� ���� ���̸� ,
		response.sendRedirect("../login/Login.jsp"); // 'Login.jsp'page�� �̵��Ѵ�. (foward�� �ٸ��� back��ư�� ������.)
	} else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ȸ��Ż��</title>
<!-- ��<<<<< ȸ��Ż��â>>>>>�� -->
<link href="../style.css" rel="stylesheet" type="text/css">
<!-- ��ü���� �������� style�� style.css �� ������ ������. -->

</head>
<body bgcolor="white">
	<!-- ������ white -->

	<%@ include file="../../Top.jsp"%>
	<!-- Top = >��mainȭ�鿡���� �ߴ� �⺻���� index link�鿡 ���� file�� include�ϰ��ִ�. -->
	<table border="1" width="800" height="100%" align="center"
		bordercolor="#FFFFFF">
		<tr>
			<td width="150" height="100%" rowspan="3" valign="top">
				<p align="center">
					<img src="../images/sidebar_01.gif" width="150" height="209"
						border="0"><img src="../images/sidebar_02.gif" width="150"
						height="300" border="0">
				</p>
			</td>
			<td height="100%" valign="top">
				<form name="myform" action="MemberDeleteProc.jsp" method="post">
					<!-- ȸ��Ż�� ����â�� form�̰� name�� myform �̰� �̺�Ʈ�� ���?�߻��ϸ� intent�Ǿ� �Ѿ â -> MemberDeleteProc.jsp  page�̴�. -->
					<table width="50%" border="1" align="center" bordercolor="#FFFFFF">
						<!--  method�� post����� �Ἥ �ԷµǴ� ȸ�������� ������ �� �ִ�. -->
						<tr>
							<td colspan="2" align="center">ȸ��Ż��</td>
						</tr>
						<tr>
							<td width="47%" align="center">ID</td>
							<td width="53%" align="center"><input type="text"
								name="mem_id">
								</div></td>
						</tr>
						<tr>
							<td align="center">Password</td>
							<td align="center"><input type="password" name="mem_passwd"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="ȸ��Ż��"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="reset" value="���"> <!-- ��� ��ư�� ������ text type�� �Էµ� ���̵�� ��й�ȣ�� �ʱ�ȭ�ȴ�. -->
							</td>
						</tr>
					</table>
				</form>

			</td>
		</tr>
	</table>

	<%@ include file="../../Bottom.jsp"%>
	<!-- 	Bottom = >�� ���� top������ ���������� main�̳� ��ȭ�鿡�� ���̴� �Ʒ��κ�(������ ���̳� shopping
	mall���ӵ��� �˸��� �κ��� moduleȭ�ؼ� include��Ű�� �ִ�.) -->
</body>
</html>
<%
	}
%>