<%@page import="myShop.delivery.db.DeliveryBean"%>
<%@page import="myShop.prod.db.ProductBean"%>
<%@page import="myShop.order.db.OrderBean"%>
<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, myShop.*"%>
<jsp:useBean id="orderMgr" class="myShop.order.action.OrderMgr" />
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />

<%
//기본주문정보
OrderBean order = orderMgr.getOrderDetail(request.getParameter("no"));
//상품정보
ProductBean product = proMgr.getProduct(order.getProduct_no());
//결제 배송정보
DeliveryBean delivery = orderMgr.getDelivery(order.getDno()); 
%>

<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
 
<body bgcolor="#996600" topmargin="100">

	<%@ include file="../mainPage/Top.jsp" %>
 
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<form method=post name="order" action="OrderProc.jsp">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td colspan="2" align="center"><font color="#FFFFFF">주문 상세내역</font></td>
		</tr>
		<tr> 
		<td align="center">고객아이디</td>
		<td align="center"><%=order.getId()%></td>
		</tr>
		<tr> 
		<td align="center">주문번호</td>
		<td align="center"><%=order.getNo()%></td>
		</tr>
		<tr> 
		<td align="center">제품번호</td>
		<td align="center"><%=product.getNo()%></td>
		</tr>				
		<tr> 
		<td align="center">제품이름</td>
		<td align="center"><%=product.getName()%></td>
		</tr>
		<tr> 
		<td align="center">제품가격</td>
		<td align="center"><%=product.getPrice()%>원</td>
		</tr>
		<tr> 
		<td align="center">주문수량</td>
		<td align="center"><%=order.getQuantity()+""%>개</td>
		</tr>
		<tr> 
		<td align="center">재고수량</td>
		<td align="center"><%=product.getStock()%>개</td>
		</tr>		
		<tr> 
		<td align="center">주문날짜</td>
		<td align="center"><%=order.getDate()%></td>
		</tr>
		<td align="center">결제계좌</td>
		<td align="center"><%=delivery.getAccount()%></td>
		</tr>
		<td align="center">배송지주소</td>
		<td align="center"><%=delivery.getDeliveryAddress()%></td>
		</tr>
		<tr> 
		<td align="center">금액</td>
		<td align="center"><%=order.getQuantity()*Integer.parseInt(product.getPrice())%>원</td>
		</tr>
		<tr> 
		<td align="center">주문상태</td>
		<td align="center">
		<select name="state">
		<option value="1">접수중</option>
		<option value="2">접수</option>
		<option value="3">입금확인</option>
		<option value="4">배송준비</option>
		<option value="5">배송중</option>
		<option value="6">완료</option>
		</select>
		<script>document.order.state.value=<%=order.getState()%></script>
		</td>
		</tr>
		<tr> 
		<td colspan="2" align="center">
		<input type="button" value="수정" size="3" onclick="javascript:orderUpdate(this.form)"> / 
		<input type="button" value="삭제" size="3" onclick="javascript:orderDelete(this.form)">
		</td>
		</tr>
		</table>
		<input type="hidden" name="no" value="<%=order.getNo()%>">
		<input type="hidden" name="flag">
		</form>		
			
	</td>
	</tr>
	</table>
	
	<%@ include file="../mainPage/Bottom.jsp" %>	
	
</body>
</html>

