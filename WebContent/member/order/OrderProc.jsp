<%@page import="myShop.order.db.OrderBean"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*, myShop.*" %>
<%request.setCharacterEncoding("euc-kr"); %> <%-- 배송결제 한글 정보 --%>
<jsp:useBean id="cartMgr" class="myShop.cart.action.CartMgr" scope="session"/>
<jsp:useBean id="orderMgr" class="myShop.order.action.OrderMgr" />
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />
<jsp:useBean id="order2" class="myShop.delivery.db.DeliveryBean"/>

<jsp:setProperty property="*" name="order2"/>

 
<!-- 구매완료가 되기 위해서는 : 재고수량 변경, 장바구니 비우기 포함 -->
<%//주문하기
	Hashtable hCart = cartMgr.getCartList();
	Enumeration hCartKey=hCart.keys();
	if(hCart.size() !=0){
		while(hCartKey.hasMoreElements()){
		OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
		orderMgr.insertOrder(order,order2); 
		proMgr.reduceProduct(order);		//위 주석이 되기 위해서 이거
		cartMgr.deleteCart(order); 			//이거 
		}
%>
	<script>
	   alert("주문처리 하였습니다");
	   location.href="OrderList.jsp";
	</script>
<%}else{ %>
	<script>
		alert("장바구니가 비어있습니다.");
		location.href="OrderList.jsp";
	</script>
<%}%>

