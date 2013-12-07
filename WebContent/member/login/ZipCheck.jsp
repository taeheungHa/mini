<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="myShop.member.action.*" %>
<%@ page import="myShop.member.db.*" %>
<jsp:useBean id="memDAO" class="myShop.member.action.MemberDAO"/>

<%
   request.setCharacterEncoding("euc-kr");

   String check = request.getParameter("check");
   String area3 = request.getParameter("area3");
   
   Vector zipcodeList = memDAO.zipcodeRead(area3);
   int totalList = zipcodeList.size(); 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script language="JavaScript" src="script.js"></script>
<script>
function dongCheck(){
	if (document.zipform.area3.value == ""){
		alert("���̸��� �Է��ϼ���");
		document.zipform.area3.focus();
		return;
	}
	document.zipform.submit();
}

function sendAddress(zipcode,area1,area2,area3,area4){
//	var loc = ["����","�λ�","�뱸","����","����","��õ","���","���","����","�泲","���","����","����","�泲","���","����"];
	var address =area2+" "+area3;
	//opener : �θ�â
	//�θ�â�� �����ȣ �ۻ��ڿ� �˻��� �����ȣ �Է�
	opener.document.regform.addnum.value=zipcode;
	//�θ�â�� �ּ� �ۻ��ڿ� �˻��� �ּ����� �Է�
	switch (area1) {
		case "����":
			opener.document.regform.addcity.value=area1;
		break;
		case "�λ�":
			opener.document.regform.addcity.value=area1;
		break;
		case "�뱸":
			opener.document.regform.addcity.value=area1;
		break;
		case "����":
			opener.document.regform.addcity.value=area1;
		break;
		case "����":
			opener.document.regform.addcity.value=area1;
		break;
		case "��õ":
			opener.document.regform.addcity.value=area1;
		break;
		case "���":
			opener.document.regform.addcity.value=area1;
		break;
		case "���":
			opener.document.regform.addcity.value=area1;
		break;
		case "����":
			opener.document.regform.addcity.value=area1;
		break;
		case "�泲":
			opener.document.regform.addcity.value=area1;
		break;
		case "���":
			opener.document.regform.addcity.value=area1;
		break;
		case "����":
			opener.document.regform.addcity.value=area1;
		break;
		case "�泲":
			opener.document.regform.addcity.value=area1;
		break;
		case "���":
			opener.document.regform.addcity.value=area1;
		break;
		case "����":
			opener.document.regform.addcity.value=area1;
		break;
	}
	opener.document.regform.addtown.value=address;
	self.close();		//���� �˾�â �ڽ� �ݱ�
}
</script>
</head>
<body>
	<font size="5">�����ȣ �˻�</font>	<p>
	(*)�� �ʵ带 ä�켼��.	<p>
	�������� �Է��� �˻���ư�� Ŭ���ϼ���.<p>
	
	<table>
		<form name="zipform" method="post" action="ZipCheck.jsp">
			<tr>
				<td >��(��/��/��) * </td>
				<td><input type="text" name="area3"> </td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<a onclick="dongCheck();"><font size="5">�˻� >></font></a>
				</td>
			</tr>
			<input type="hidden" name="check" value="n">
		</form>
		<%if(check.equals("n")){ %>
			<%if(zipcodeList.isEmpty()){ %>
				<tr><td align="center"><br>�˻��� ����� �����ϴ�.</td></tr>
			<%}else{ %>
				<tr><td align="center"><br>�ذ˻� ��, �Ʒ� �����ȣ�� Ŭ���ϸ� �ڵ����� �Էµ˴ϴ�.</td></tr>
				<%for (int i=0;i<totalList;i++) {
					ZipcodeBean zipBean = (ZipcodeBean)zipcodeList.elementAt(i);
					String tempZipcode =zipBean.getZipcode();
					String temptArea1 =zipBean.getArea1();
					String temptArea2 =zipBean.getArea2();
					String temptArea3 =zipBean.getArea3();
					String temptArea4 =zipBean.getArea4();
					%>
					<tr>
						<td>
							<a href="javascript:sendAddress('<%=tempZipcode%>','<%=temptArea1%>','<%=temptArea2%>','<%=temptArea3%>','<%=temptArea4%>')">
       						<%=tempZipcode%>&nbsp;<%=temptArea1%>&nbsp;<%=temptArea2%>&nbsp;
		 					<%=temptArea3%>&nbsp;<%=temptArea4%></a><br>
		 			<%} %>
			<%} %>
		<%} %>
						</td>
					</tr>
	</table>
	
</body>
</html>