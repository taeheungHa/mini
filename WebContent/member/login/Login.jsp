<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<% String email = request.getParameter("email");
		String passchek = request.getParameter("passchek");
		String loginchek = request.getParameter("loginchek");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body>
<%@ include file="../../Top.jsp"   %>
<form name="loginform" action="LoginProc.jsp" method="post">
	<table  width="900px">
		<tr>
			<td colspan="2"><font size="5">�α���</font><p>
			<%if(passchek!=null){
					if(passchek.equals("true")){%>
						<hr><font color="green" size="4"><b>���ο� �α��� ������ �����ּ� �����߽��ϴ�.<br>
						<%=email %>
						</b></font><hr><p>
						<%
					}
			}%>
			  �̰����� �������� ����, �ֹ� ����, ���ø���Ʈ Ȯ���� �����մϴ�. �¶���
				����Ʈ ī�� ��� Ȯ���� ������ ���Ͽ� �¶��� ����� �ʿ��մϴ�. �α����� �Ͻðų� ���ο� �α��� ID�� �����ϼ���.
			</td>
		</tr>
		<tr>
			<td>���� �α��� ID���<hr><p></td>
			<td>���ο� �α��� ID ���� <hr><p></td>
		</tr>

		<tr>
			<td>
				<table id="logintable" width="100%">
					<tr>
						<td colspan="2">
							�̸��� �ּҿ� ��й�ȣ�� �Է��ϼ���. <p>
							<div id=err_login></div><p>
							<%
							if(loginchek!=null && loginchek.equals("false")){
								%>
								<font color='red'><b>��ġ�ϴ·α��� ��� ������ �����ϴ�. �ٽ� �õ��ϼ���.	</b></font>
							<%
								loginchek=null;
							}%>
						</td>
					</tr>
					<tr>
						<td width="35%" align="right">
							�̸��� * <br>
							��й�ȣ * <br><br>
						</td>
						<td align="left">
							<input type="text" name="email"><br>
							<input type="password" name="pass"><br>
							<a href="Password.jsp">>��й�ȣ ã��<br></a>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<a onclick="loginCheck()" ><font size="5">�α���>></font></a>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							�� ������ �����ϰ� ��ȣ�ǰ� �ֳ���?<br>
							��. ��� ������ ��ȣȭ�ǹǷ� �� 3�ڰ� ���� ������ �� �� �����ϴ�. (  ) �̷��� ���� ����� ������ �ڳʺκп� ��ȣȭ�Ǿ� ǥ�õ˴ϴ�.
						</td>
					</tr>
				</table>
			 </td>
			<td>
				<table id="registertable" width="100%">
					<tr>
						<td>
							���� �¶��� ������ ���� �α��� ID�� �����ø�, �̰����� ����� �ֽñ� �ٶ��ϴ�.<p>
						</td>
					</tr>
					<tr>
						<td align="right">
							<a href="Register.jsp" ><font size="5">�α��� ID ����>></font></a>
						</td>
					</tr>
					<tr>
						<td>
							���� �� ��� �پ��� ������ ��ܺ�����.
							<ul>
								<li>�¶��� ���� ����Ͽ�, ���� ���� ������ ��⼼��. ���� �ڼ��� ������ ���ͷκ꽺Ű �������� ��޹�ħ�� Ȯ���ϼ���.. <br>
								<li>���ø���Ʈ�� ���ϴ� ��ǰ�� �����ϼ���. ���ø���Ʈ�� ������ ģ������ ������ �� �ֽ��ϴ�. <br>
								<li>�������� �ֹ� ��Ȳ�� ���� �� �ֽ��ϴ�. <br>
							</ul>
						</td>
					</tr>
					
				</table>
			
			</td>
		</tr>

	</table>
</form>
<%@ include file="../../Bottom.jsp"   %>
</body>
</html>