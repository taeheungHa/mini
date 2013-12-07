<%@page import="myShop.prod.db.ProductBean"%>
<%@page import="myShop.order.db.OrderBean"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*, myShop.*" %>
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />
<jsp:useBean id="orderMgr" class="myShop.order.action.OrderMgr" />
<%
	if(session.getAttribute("idKey") == null) {
		response.sendRedirect("../login/Login.jsp");
	}else{
%>

<html>
<head>
<title>Simple Shopping Mall</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../script.js"></script>
</head>

<body bgcolor="#FFFFFF" >

	<%@ include file="../../Top.jsp" %>
	
	<table width="800" align="center" bgcolor="#FFFFFF"  border="1">
	<tr> 
	        <td width="150" height="100%" rowspan="3" valign="top">
            <p align="center"><img src="../images/sidebar_01.gif" width="150" height="209" border="0"><img src="../images/sidebar_02.gif" width="150" height="300" border="0"></p>
        </td>
        
     
	<td  width="633" align="center" bgcolor="#FFFFFF" valign="top">

		<table width="633" align="center" bgcolor="#FFFFFF" border="1"   cellpadding="0" cellspacing="0">
		<tr bgcolor="#FFFFFF"> 
		<td align="center"><font color="#000000">주문번호</font></td>
		<td align="center"><font color="#000000">제품</font></td>
		<td align="center"><font color="#000000">주문수량</font></td>
		<td align="center"><font color="#000000">주문날짜</font></td>
		<td align="center"><font color="#000000">주문상태</font></td>
		</tr>
		<%
		Vector vResult = orderMgr.getOrder(mem_id);
		if(vResult.size() ==0){
		%>
		<tr> 
		<td align="center" colspan="5">주문하신 물품이 없습니다.</td>
		</tr>		
		<%}else{
			for(int i=0; i< vResult.size(); i++){
			OrderBean order = (OrderBean)vResult.get(i);
			ProductBean product = proMgr.getProduct(order.getProduct_no());
		%> 
		<tr> 
		<td align="center"><%=order.getNo()%></td>
		<td align="center"><a href="javascript:productDetail('<%=order.getProduct_no()%>')"><%=product.getName()%></a></td>
		<td align="center"><%=order.getQuantity()%></td>
		<td align="center"><%=order.getDate()%></td>
		<td align="center">
		<%
		switch(Integer.parseInt(order.getState())){
		case 1 : out.println("접수중");
		break;
		case 2 : out.println("접수");
		break;
		case 3 : out.println("입금확인");
		break;
		case 4 : out.println("배송준비");
		break;
		case 5 : out.println("배송중");
		break;
		default : out.println("완료");
		}
		%> 
		</td>
		</tr>
		<%}
		}%>
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


