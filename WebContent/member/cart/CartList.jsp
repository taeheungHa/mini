<%@page import="myShop.prod.db.ProductBean"%>
<%@page import="myShop.order.db.OrderBean"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*, myShop.*" %>
<jsp:useBean id="cartMgr" class="myShop.cart.action.CartMgr" scope="session"/>
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />
<%
	if(session.getAttribute("idKey") == null) {	//로그인 거치지 않은 경우
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
		<td align="center"><font color="#000000">제품</font></td>
		<td align="center"><font color="#000000">수량</font></td>
		<td align="center"><font color="#000000">가격</font></td>
		<td align="center"><font color="#000000">수정/삭제</font></td>
		<td align="center"><font color="#000000">조회</font></td>
		</tr>
		<%
		int totalPrice =0 ;		
		Hashtable hCart = cartMgr.getCartList();
		if(hCart.size() == 0){
		%>
		<tr><td colspan="5" align="center">선택하신 물품이 없습니다.</td></tr>	

		<%
		}else{
		Enumeration hCartKey=hCart.keys();
			while(hCartKey.hasMoreElements()){
				//주문정보
				OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
				//상품정보
			ProductBean product = proMgr.getProduct(order.getProduct_no());
			int price = Integer.parseInt(product.getPrice());
			int quantity = order.getQuantity();
			int subTotal = price*quantity;
			totalPrice += price*quantity;		//총금액
			
		%>
		<form method="post"action="CartProc.jsp">
		<input type="hidden" name="product_no" value="<%=product.getNo()%>">
		<input type="hidden" name="flag">
		<tr> 
		<td align="center">	<%=product.getName()%></td>
		<td align="center"><input type=text name=quantity value="<%=order.getQuantity()%>" size=5 >개</td>
		<td align="center"><%=subTotal+""%></td>
		<td align="center">
		<input type="botton" value="수정" size="3" onclick="javascript:cartUpdate(this.form)"> /
		<input type="botton" value="삭제" size="3" onclick="javascript:cartDelete(this.form)">
		</td>
		<td align="center"><a href="javascript:productDetail('<%=product.getNo()%>')">상세보기</a></td>
		</tr>
		</form>
		<%}%>
		<tr> 
		<td colspan="4" align="right">총 금액 : <%=totalPrice%>원</td>
		<td align="center"><a href="../order/OrderForm.jsp">주문하기</a></td>
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