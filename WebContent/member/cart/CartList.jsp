<%@page import="myShop.prod.db.ProductBean"%>
<%@page import="myShop.order.db.OrderBean"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*, myShop.*" %>
<jsp:useBean id="cartMgr" class="myShop.cart.action.CartMgr" scope="session"/>
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />
<%
	if(session.getAttribute("idKey") == null) {	//�α��� ��ġ�� ���� ���
		response.sendRedirect("Login.jsp");
	}else{
%>	 
<html>
<head>
<title>Simple Shopping Mall</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="#FFFFFF" >

	<%@ include file="../../Top.jsp" %>

	<table width="800" align="center" bgcolor="#FFFFFF" border="1">
	<tr>
	
	 <td width="150" height="100%" rowspan="3" valign="top">
            <p align="center"><img src="../images/sidebar_01.gif" width="150" height="209" border="0"><img src="../images/sidebar_02.gif" width="150" height="300" border="0"></p>
        </td>
        
	<td align="center" bgcolor="#FFFFFF" valign="top">

		<table width="633" align="center" bgcolor="#FFFFFF" border="1"  cellpadding="0" cellspacing="0">
		<tr bgcolor="#FFFFFF">
		<td align="center"><font color="#000000">��ǰ</font></td>
		<td align="center"><font color="#000000">����</font></td>
		<td align="center"><font color="#000000">����</font></td>
		<td align="center"><font color="#000000">����/����</font></td>
		<td align="center"><font color="#000000">��ȸ</font></td>
		</tr>
		<%
		int totalPrice =0 ;		
		Hashtable hCart = cartMgr.getCartList();
		if(hCart.size() == 0){
		%>
		<tr><td colspan="5" align="center">�����Ͻ� ��ǰ�� �����ϴ�.</td></tr>	

		<%
		}else{
		Enumeration hCartKey=hCart.keys();
			while(hCartKey.hasMoreElements()){
				//�ֹ�����
				OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
				//��ǰ����
			ProductBean product = proMgr.getProduct(order.getProduct_no());
			int price = Integer.parseInt(product.getPrice());
			int quantity = order.getQuantity();
			int subTotal = price*quantity;
			totalPrice += price*quantity;		//�ѱݾ�
			
		%>
		<form method="post"action="CartProc.jsp">
		<input type="hidden" name="product_no" value="<%=product.getNo()%>">
		<input type="hidden" name="flag">
		<tr> 
		<td align="center">	<%=product.getName()%></td>
		<td align="center"><input type=text name=quantity value="<%=order.getQuantity()%>" size=5 >��</td>
		<td align="center"><%=subTotal+""%></td>
		<td align="center">
		<input type="botton" value="����" size="3" onclick="javascript:cartUpdate(this.form)"> /
		<input type="botton" value="����" size="3" onclick="javascript:cartDelete(this.form)">
		</td>
		<td align="center"><a href="javascript:productDetail('<%=product.getNo()%>')">�󼼺���</a></td>
		</tr>
		</form>
		<%}%>
		<tr> 
		<td colspan="4" align="right">�� �ݾ� : <%=totalPrice%>��</td>
		<td align="center"><a href="../order/OrderForm.jsp">�ֹ��ϱ�</a></td>
		</tr>
		<%
		}
		%>			
			
		</table>

	
	</td>
	</tr>
	</table>
	
	<%@ include file="../../Bottom.jsp" %>
	<form name="detail" method="post" action="../prod/ProductDetail.jsp" >
	<input type="hidden" name="no">
	</form>	
		
</body>
</html>
<%}%>