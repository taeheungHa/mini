<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body >
<%@ include file="../../Top.jsp"   %>

<form name="regform" action="RegisterProc.jsp" method="post" >
	<font size="5">���ο� �α��� ID ����</font><p>
	<font size="3">û��/��� �ּ�</font><hr><p>
	(*)�Ǿ� �ִ� ĭ�� ä���ּ���.<p>
	<div id=err_msg></div><p>
	<div id=err_firstname></div>
	<div id=err_lastname></div>
	<div id=err_adddetail></div>
	<div id=err_addnum></div>
	<div id=err_addtown></div>
	<div id=err_addcity></div>
	<div id=err_email></div>
	<div id=err_phon></div>
	<div id=err_emailmacth></div><p>
	<table align="center">
		<tr>
			<td width="20%" align="right">
				Last name(��) * <br>
			</td>
			<td align="left">
				<input type="text" name="lastname"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				First name(��) * <br>
			</td>
			<td align="left">
				<input type="text" name="firstname"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				�����ȣ * <br>
			</td>
			<td align="left">
				<input type="text" name="addnum">
				<input type="button" value="�����ȣ" onclick="zipCheck()"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				��/�� *<br>
			</td>
			<td align="left">
				<select name="addcity" >
					<option value="����">����
					<option value="�λ�">�λ�
					<option value="�뱸">�뱸
					<option value="����">����
					<option value="����">����
					<option value="��õ">��õ
					<option value="���">���
					<option value="���">���
					<option value="����">����
					<option value="�泲">�泲
					<option value="����">����
					<option value="����">����
					<option value="�泲">�泲
					<option value="���">���
					<option value="����">����
					<option selected>�����ϼ���
				</select><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				��/��/��/�� * <br>
			</td>
			<td align="left">
				<input type="text" name="addtown"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				���ּ� * <br>
			</td>
			<td align="left">
				<input type="text" name="adddetail"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				�̸��� * <br>
			</td>
			<td align="left">
				<input type="text" name="email" onkeydown="emailcheck()"><br>
				
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				�̸��� Ȯ�� * <br>
			</td>
			<td align="left">
				<input type="text" name="emailchk"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				�ڵ�����ȣ * <br>
			</td>
			<td align="left">
				<input type="text" name="phon"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				��ȭ��ȣ * <br>
			</td>
			<td align="left">
				<input type="text" name="tell"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				������� <br>
			</td>
			<td align="left">
				<input type="text" name="birdate" value="DD" size="5">
				<input type="text" name="birmonth" value="MM" size="5">
				<input type="text" name="biryear" value="YYYY" size="5"><br>
			</td>
		</tr>
	</table>
	<font size="3">�α���</font><hr><p>
	
	<div id=err_msg2></div><p>
	<div id=err_pass></div>
	<div id=err_passchk></div>
	<div id=err_passmacth></div><p>
	
	<table align="center">
		<tr>
			<td width="20%" align="right">
				�̸��� * <br>
			</td>
			<td align="left">
				<div id=copyemail></div>
				
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				��й�ȣ * <br>
			</td>
			<td align="left">
				<input type="password" name="pass">
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				��й�ȣ Ȯ�� * <br>
			</td>
			<td align="left">
				<input type="password" name="passchk">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<a onclick="inputCheck()" ><font size="5">�α��� ID ����>></font></a>
			</td>
		</tr>
	</table>
</form>
<%@ include file="../../Bottom.jsp"   %>
</body>
</html>