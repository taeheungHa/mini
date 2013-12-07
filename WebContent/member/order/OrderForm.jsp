<%@page import="myShop.member.db.MemberBean"%>
<%@page import="myShop.prod.db.ProductBean"%>
<%@page import="myShop.order.db.OrderBean"%>
<%@ page import="myShop.delivery.db.DeliveryBean" %>
<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*, myShop.*" %>
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />
<jsp:useBean id="orderMgr" class="myShop.order.action.OrderMgr" />
<jsp:useBean id="memMgr" class="myShop.member.action.MemberDAO" />
<<jsp:useBean id="deliBean" class="myShop.delivery.db.DeliveryBean"/>
<jsp:useBean id="cartMgr" class="myShop.cart.action.CartMgr" scope="session"/>
<%
	
    if(session.getAttribute("idKey") == null) {
		response.sendRedirect("../login/Login.jsp");
	}else{
%> 

<html>
<head>
<title>Simple Shopping Mall</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../script.js"></script>
</head>

<body bgcolor="FFFFFF" >

	<%@ include file="../../Top.jsp" %>
	<table border="1" width="800" height="100%" align="center" >

  <tr>
        <td width="150" height="100%" rowspan="3" valign="top">
            <p align="center"><img src="../images/sidebar_01.gif" width="150" height="209" border="0"><img src="../images/sidebar_02.gif" width="150" height="300" border="0"></p>
        </td>        

<td valign="top" width="633">
	
		<table align="center" bgcolor="#FFFFFF"  cellpadding="0" cellspacing="0">
	<tr>
	<td align="center" bgcolor="#FFFFFF" width="633">

		<table border="1"   width="100%" align="center" bgcolor="#FFFFFF" border="1" cellpadding="0" cellspacing="0">
		
		<tr bgcolor="#FFFFFF">

  		<td align="center"><font color="#000000">제품</font></td>
		<td align="center"><font color="#000000">수량</font></td>
		<td align="center"><font color="#000000">가격</font></td>
		<td align="center"><font color="#000000">조회</font></td>
		</tr>
		<%
		int totalPrice =0 ;		
		Hashtable hCart = cartMgr.getCartList();
		Enumeration hCartKey=hCart.keys();
			while(hCartKey.hasMoreElements()){
				OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
			ProductBean product = proMgr.getProduct(order.getProduct_no());
			int price = Integer.parseInt(product.getPrice());
			int quantity = order.getQuantity();
			int subTotal = price*quantity;
			totalPrice += price*quantity;
			
		%>
		<tr>
	 
		 <td align="center"><%=product.getName()%></td>
		<td align="center"><%=order.getQuantity()%>개</td>
		<td align="center"><%=subTotal+""%></td>
		
		<td align="center"><a href="javascript:productDetail('<%=product.getNo()%>')">상세보기</a></td>
		</tr>
		
		<%}%>
		<tr> 
		<td colspan="4" align="right">총 금액 : <%=totalPrice%>원</td>
		</tr>
			
			
		</table>

	
	</td>
	</tr>
	
	<%
	String  buyer =(String)session.getAttribute("idKey");
	MemberBean member =memMgr.getMember(buyer);
	
	%>
	<tr>
	<td bgcolor="#FFFFFF">
	<form method="post" action="OrderProc.jsp" >
   <table width="633"  border="1"   width="633" align="center" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">
      <tr > 
       <td  colspan="2" align="center"><font size="+1" ><b>주문자 정보</b></font></td>
     </tr>
     <tr> 
       <td  width="200">성명</td>
       <td  width="400"><%=deliBean.getDeliveryName()%></td>
     </tr>
     <tr> 
       <td  width="200">전화번호</td>
       <td  width="400"><%=deliBean.getDeliveryTel()%></td>
     </tr>
     <tr> 
       <td  width="200">주소</td>
       <td  width="400"><%=deliBean.getDeliveryAddress()%></td>
     </tr>
     <tr> 
       <td  width="200">결제계좌</td>
       <td  width="400">
         <select name="account">
          <%
         
         Vector  accountLists = orderMgr.getAccount();
          for(int i=0;i<accountLists.size();i++){
            	  String accountList = (String)accountLists.elementAt(i);
          %>
                  <option value="<%=accountList %>"><%=accountList %></option>
         <%}%>
         </select>
       </td>
    </tr>
  </table>
  </td>
  </tr>
  <tr>
  <td bgcolor="#FFFFFF">  
   <table border="1"   width="633" align="center" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">
      <tr > 
       <td  colspan="2" align="center"><font size="+1" ><b>배송지 정보</b></font></td>
     </tr>
     <tr> 
       <td  width="200">성명</td>
       <td  width="400">
          <input type="text" name="deliveryName" value="<%=deliBean.getDeliveryName() %>">
       </td>
     </tr>
     <tr> 
       <td  width="200">전화번호</td>
       <td  width="400">
         <input type="text" name="deliveryTel" value="<%=deliBean.getDeliveryTel()%>">
       </td>
     </tr>
     <tr> 
       <td  width="200">주소</td>
       <td  width="400">
         <input type="text" name="deliveryAddress" value="<%=deliBean.getDeliveryAddress()%>">
       </td>
     </tr>
     <tr> 
       <td colspan="2" align="center" >
         <input type="submit" value="확인" >
         <input type="button" value="취소" onclick="javascript:window.location='../login/Index.jsp'">      
       </td>
    </tr>
  </table>
  </td>
  </tr>
  </form>
  
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


