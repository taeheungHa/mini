<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import ="java.util.*,myShop.member.db.*" %> 
<%
	String upchek = request.getParameter("upchek");
%>
<jsp:useBean id="mdao" class="myShop.member.action.MemberDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="../../Top.jsp"   %>
	<%MemberBean memBean= mdao.getMember(mem_id);%>
	<form name="memform" action="MemberUpdateProc.jsp" method="post">
		<input type="hidden" name="no" value="<%=memBean.getNo() %>">
		<font size="5">������</font><p>
		<%if(upchek!=null){
					if(upchek.equals("true")){%>
						<hr><font color="green" size="4"><b>������ ���� ������ �����Ǿ����ϴ�.<br>
						</b></font><hr><p>
						<%
					}
			}%>
		<table>
			<tr>
				<td colspan="2">
					<font size="3"><b>�α����� ���� �� ���� (�α��� ID)/��й�ȣ ����</b></font><p>
						�̸��� �ּҰ� ������ ���ο� �α��� ID�� ���˴ϴ�. ������ ���Ͽ�, �̸��� �ּҴ� ��й�ȣ�� �Բ� ����Ǿ�� �մϴ�.<p>
						(*) �Ǿ� �ִ� ĭ�� ä�� �ּ���.
				</td>
			</tr>
			
			<tr>
				<td width="40%" align="right">�̸����ּ�</td>
				<td  align="left"><%=memBean.getEmail() %></td>
			</tr>
			
			<!-- <tr>
				<td width="20%" align="right">���ο� �̸����ּ�*</td>
				<td><input type="text" name="email"></td>
			</tr>
			
			<tr>
				<td width="20%" align="right">�̸����ּ� Ȯ��*</td>
				<td><input type="text" name="emailchk"></td>
			</tr> -->
			
			<tr>
				<td width="40%" align="right">���� ��й�ȣ*</td>
				<td align="left"><input type="password" name="oldpass"></td>
			</tr>
			
			<tr>
				<td width="40%" align="right">���ο� ��й�ȣ*</td>
				<td align="left"><input type="password" name="pass"></td>
			</tr>
			
			<tr>
				<td width="40%" align="right">��й�ȣ Ȯ��*</td>
				<td align="left"><input type="password" name="passchk"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
				<a href="javascript:memform.submit()" ><font size="5">����� ���� ����>></font></a>
				</td>
			</tr>	
		</table>
		<table>
			<tr>
				<td colspan="2">
					<font size="3"><b>�ּҸ� �����Ͻð�, �������� ������ ��û�ϼ���.</b></font><p>
						(*) �Ǿ� �ִ� ĭ�� ä�� �ּ���.
				</td>
			</tr>
			<tr>
				<td width="40%" align="right"><b>Last name(��) *</b></td>
				<td align="left"><input type="text" name="lastname"  value="<%=memBean.getLastname() %>"></td>
			</tr>
			<tr>
				<td width="40%" align="right"><b>First name(��) *</b></td>
				<td align="left"><input type="text" name="firstname"  value="<%=memBean.getFirstname() %>"></td>
			</tr>
			<tr>
				<td width="40%" align="right">�����ȣ *</td>
				<td align="left"><input type="text" name="addnum"  value="<%=memBean.getAddnum() %>"></td>
			</tr>
			<tr>
				<td width="40%" align="right">��/�� *</td>
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
					</select><br>
				<script>document.memform.addcity.value="<%=memBean.getAddcity()%>"</script>
				</td>
			</tr>
			<tr>
				<td width="40%" align="right">��/��/��/�� *</td>
				<td align="left"><input type="text" name="addtown"  value="<%=memBean.getAddtown() %>"></td>
			</tr>
			<tr>
				<td width="40%" align="right">���ּ� *</td>
				<td align="left"><input type="text" name="adddetail"  value="<%=memBean.getAdddetail() %>"></td>
			</tr>
			<tr>
				<td  width="40%" align="right">�ڵ�����ȣ *</td>
				<td align="left"><input type="text" name="phon"  value="<%=memBean.getPhon() %>"></td>
			</tr>
			<tr>
				<td width="40%" align="right">
					��ȭ��ȣ * <br>
				</td>
				<td align="left">
					<input type="text" name="tell"><br>
				</td>
			</tr>
			<tr>
				<td width="40%" align="right">
					������� <br>
				</td>
				<td align="left">
					<input type="text" name="birdate" value="DD" size="5">
					<input type="text" name="birmonth" value="MM" size="5">
					<input type="text" name="biryear" value="YYYY" size="5"><br>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<a href="javascript:memform.submit()" ><font size="5">����� ���� ����>></font></a>
				</td>
			</tr>	
		</table>
	</form>
</body>
</html>