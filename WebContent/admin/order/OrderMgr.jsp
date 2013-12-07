<%@page import="myShop.prod.db.ProductBean"%>
<%@page import="myShop.order.db.OrderBean"%>
<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, myShop.*"%>
<jsp:useBean id="orderMgr" class="myShop.order.action.OrderMgr" />
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />
<jsp:useBean id="mycg" class="myShop.category.action.CategoryMgr" scope="session"/>
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
 
<body bgcolor="#996600" topmargin="100">

	<%@ include file="../mainPage/Top.jsp" %>   <!-- ���κ�, moduleȭ �Ǿ��ִ� ��� ���� list  -->
 
	<table width="75%" align="center" bgcolor="#FFFF99">    <!-- ���̺� ������ ::�ܺ� ���̺� -->
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1"> <!-- ���̺� ������ ::�������̺�  -->
		<tr bgcolor="#996600"> 
		<!--�� ���� �� ���� ��ǰ�� �ֹ���ȣ, �ֹ��� ���� ����� ��ġ  -->
		<td align="center"><font color="#FFFFFF">�ֹ���ȣ</font></td>
		<td align="center"><font color="#FFFFFF">�ֹ���</font></td>
		<td align="center"><font color="#FFFFFF">��ǰ</font></td>
		<td align="center"><font color="#FFFFFF">�ֹ�����</font></td>
		<td align="center"><font color="#FFFFFF">�ֹ���¥</font></td>
		<td align="center"><font color="#FFFFFF">�ֹ�����</font></td>
		<td>&nbsp;</td>
		</tr>
		<%
		Vector vResult = orderMgr.getOrderList(); //�ֹ������ Vector type�� ���� vResult�� ����
		if(vResult.size() ==0){  // �ֹ������ ������,
		%>
		<tr> 
			<td align="center" colspan="7">�ֹ� ������ �����ϴ�</td>  <!-- �ι�° �࿡ ���  -->
		</tr>
		</tr>
		<%}else{ //�ֹ� ����� ���� ���,
			for(int i=0; i< vResult.size(); i++){  /* �ֹ������ ������ �ִ� Vector������ �����ŭ  */
			OrderBean order = (OrderBean)vResult.get(i);
			//�ֹ� ��� ������ OrderBean(�ֹ� ��� class) bean(data)��ü(order)�� ����

			ProductBean product = proMgr.getProduct(order.getProduct_no());
			//�ֹ��� ��ǰ�� ���� ��ǰ������ ��ǰ���� Bean(data����)class ::product �� ����.
			%>
		<tr> 
		<td align="center"><%=order.getNo()%></td> <!--   //�ֹ��� ������ �Ӽ� ������ ������. -->
		<td align="center"><%=order.getId()%></td>
		<td align="center"><%=order.getProduct_no()%></td>
		<td align="center"><%=order.getQuantity()%></td>
		<td align="center"><%=order.getDate()%></td>
		<td align="center">
		<%
		switch(Integer.parseInt(order.getState())){/* �������� ���¿� ���� */
		case 1 : out.println("������");//���
		break;
		case 2 : out.println("����");
		break;
		case 3 : out.println("�Ա�Ȯ��");
		break;
		case 4 : out.println("����غ�");
		break;
		case 5 : out.println("�����");
		break;
		default : out.println("�Ϸ�");
		}%>
		</td>
		<td align="center"><a href="javascript:orderDetail('<%=order.getNo()%>')">�󼼺���</a></td>
		</tr><!--(���:�ֹ���ǰ ��ȣ) �󼼺��� -->
		<%}
		}%>
		</table>
	
	</td>
	</tr>
	</table>
	
	<%@ include file="../mainPage/Bottom.jsp" %> <!-- �Ʒ��κ�  -->

	<form name="detail" method="post" action="OrderDetail.jsp" >
	<input type="hidden" name="no">
	</form>

</body>
</html>
