<%@page import="myShop.order.db.OrderBean"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*, myShop.*" %>
<%request.setCharacterEncoding("euc-kr"); %> <%-- ��۰��� �ѱ� ���� --%>
<jsp:useBean id="cartMgr" class="myShop.cart.action.CartMgr" scope="session"/>
<jsp:useBean id="orderMgr" class="myShop.order.action.OrderMgr" />
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />
<jsp:useBean id="order2" class="myShop.delivery.db.DeliveryBean"/>

<jsp:setProperty property="*" name="order2"/>

 
<!-- ���ſϷᰡ �Ǳ� ���ؼ��� : ������ ����, ��ٱ��� ���� ���� -->
<%//�ֹ��ϱ�
	Hashtable hCart = cartMgr.getCartList();
	Enumeration hCartKey=hCart.keys();
	if(hCart.size() !=0){
		while(hCartKey.hasMoreElements()){
		OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
		orderMgr.insertOrder(order,order2); 
		proMgr.reduceProduct(order);		//�� �ּ��� �Ǳ� ���ؼ� �̰�
		cartMgr.deleteCart(order); 			//�̰� 
		}
%>
	<script>
	   alert("�ֹ�ó�� �Ͽ����ϴ�");
	   location.href="OrderList.jsp";
	</script>
<%}else{ %>
	<script>
		alert("��ٱ��ϰ� ����ֽ��ϴ�.");
		location.href="OrderList.jsp";
	</script>
<%}%>

