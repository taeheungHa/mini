<%@page import="myShop.member.db.MemberBean"%>
<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import ="java.util.*,myShop.*" %> 
<% 
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="memMgr" class="myShop.member.action.MemberDAO" />


<html>
<head>
<title>ȸ������</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<script language="javascript">
function move()
{
   var frm = document.regForm;
   frm.action = "MemberDelete.jsp";
   frm.submit();
}
</script>


<script language="JavaScript" src="../script.js"></script>
</head>
<body bgcolor="#FFFFFF" topmargin="0">
<br>

	<%@ include file="../../Top.jsp" %>
	<%MemberBean regBean= memMgr.getMember(mem_id);%>
<table border="1" width="800" height="100%" align="center">
    <tr>
        <!-- <td width="150" height="100%" rowspan="3" valign="top">
            <p align="center"><img src="../images/sidebar_01.gif" width="150" height="209" border="0">
            <img src="../images/sidebar_02.gif" width="150" height="300" border="0"></p>
        </td> -->
        <td valign="top" >	
	<table width="633" align="center" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">
	<tr> 
	<td align="cneter" bgcolor="#FFFFFF">

		<table width="633" align="center" bgcolor="#FFFFFF" border="1">
		<form name="regForm" method="post" action="MemberUpdateProc.jsp">
		<tr align="center" bgcolor="#FFFFFF"> 
		<td colspan="3"><font color="#000000"><b> 
		<%=%>
		ȸ������ ������ �����մϴ�.</b></font> </td>
		</tr>
		<tr> 
		<td>���̵�</td>
		<td><%=%></td>
		</tr>
		<tr> 
		<td>�н�����</td>
		<td><input type="text" name="mem_passwd" value="<%=%>"></td>
		</tr>
		<tr> 
		<td>�̸�</td>
		<td><input type="text" name="mem_name" value="<%=%>"></td>
		</tr>
		<tr> 
		<td>�ֹε�Ϲ�ȣ</td>
		<td><input type="text" name="mem_num1" size="6" value="<%=%>">-
		<input type="text" name="mem_num2" size="7"	value="<%=%>"></td>
		</tr>
		<tr> 
		<td>�̸���</td>
		<td><input type="text" name="mem_email"  size="30" value="<%=%>"></td>
		</tr>
		<tr> 
		<td>��ȭ��ȣ</td>
		<td><input type="text" name="mem_phone" value="<%=%>"></td>
		</tr>
		<tr> 
		<td>�����ȣ</td>
		<td><input type="text" name="mem_zipcode" value="<%=%>">
		<input type="button" value="�����ȣã��" onClick="../register/zipCheck()">
		</td>
		</tr>
		<tr> 
		<td>�ּ�</td>
		<td><input type="text" name="mem_address" size="50" value="<%=%>"></td>
		</tr>
		<tr> 
		<td>����</td>
		<td><select name=mem_job>
		<option value="0">�����ϼ���.
		<option value="ȸ���">ȸ���
		<option value="����������">����������
		<option value="�����л�">�����л�
		<option value="�Ϲ��ڿ���">�Ϲ��ڿ���
		<option value="������">������
		<option value="�Ƿ���">�Ƿ���
		<option value="������">������
		<option value="����,���,������">����.���/������
		<option value="��,��,����,������">��/��/����/������
		<option value="�ֺ�">�ֺ�
		<option value="����">����
		<option value="��Ÿ">��Ÿ
		</select>
		<script>document.regForm.mem_job.value="<%=%>"</script>
		</td>
		</tr>
		<tr> 
		<td colspan="2" align="center"><input type="submit" value="�����Ϸ�"> 
		&nbsp; &nbsp; &nbsp;<input type="button" value="ȸ��Ż��" onclick="move()"> &nbsp; &nbsp; &nbsp; 
		<input type="reset" value="�ٽþ���"> 
		</td>
		</tr>
		<input type="hidden" name="mem_id" value="<%=mem_id%>">
		</form>
		</table>

	</td>
	</tr>
	</table>
</td>
</tr>
</table>	
	<%@ include file="../../Bottom.jsp" %>
		
</body>
</html>
