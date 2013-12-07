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

	<%@ include file="../mainPage/Top.jsp" %>   <!-- 윗부분, module화 되어있는 목록 나열 list  -->
 
	<table width="75%" align="center" bgcolor="#FFFF99">    <!-- 테이블 디자인 ::외부 테이블 -->
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1"> <!-- 테이블 디자인 ::내부테이블  -->
		<tr bgcolor="#996600"> 
		<!--한 행의 각 열에 제품의 주문번호, 주문자 등의 기록을 배치  -->
		<td align="center"><font color="#FFFFFF">주문번호</font></td>
		<td align="center"><font color="#FFFFFF">주문자</font></td>
		<td align="center"><font color="#FFFFFF">제품</font></td>
		<td align="center"><font color="#FFFFFF">주문수량</font></td>
		<td align="center"><font color="#FFFFFF">주문날짜</font></td>
		<td align="center"><font color="#FFFFFF">주문상태</font></td>
		<td>&nbsp;</td>
		</tr>
		<%
		Vector vResult = orderMgr.getOrderList(); //주문기록을 Vector type의 변수 vResult로 받음
		if(vResult.size() ==0){  // 주문기록이 없으면,
		%>
		<tr> 
			<td align="center" colspan="7">주문 내역이 없습니다</td>  <!-- 두번째 행에 출력  -->
		</tr>
		</tr>
		<%}else{ //주문 기록이 있을 경우,
			for(int i=0; i< vResult.size(); i++){  /* 주문기록을 가지고 있는 Vector변수의 사이즈만큼  */
			OrderBean order = (OrderBean)vResult.get(i);
			//주문 기록 정보를 OrderBean(주문 기록 class) bean(data)객체(order)에 저장

			ProductBean product = proMgr.getProduct(order.getProduct_no());
			//주문한 상품에 대한 상품정보를 상품정보 Bean(data저장)class ::product 에 저장.
			%>
		<tr> 
		<td align="center"><%=order.getNo()%></td> <!--   //주문한 정보의 속성 값들을 가져옴. -->
		<td align="center"><%=order.getId()%></td>
		<td align="center"><%=order.getProduct_no()%></td>
		<td align="center"><%=order.getQuantity()%></td>
		<td align="center"><%=order.getDate()%></td>
		<td align="center">
		<%
		switch(Integer.parseInt(order.getState())){/* 쓰레드의 상태에 따라 */
		case 1 : out.println("접수중");//출력
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
		}%>
		</td>
		<td align="center"><a href="javascript:orderDetail('<%=order.getNo()%>')">상세보기</a></td>
		</tr><!--(출력:주문상품 번호) 상세보기 -->
		<%}
		}%>
		</table>
	
	</td>
	</tr>
	</table>
	
	<%@ include file="../mainPage/Bottom.jsp" %> <!-- 아랫부분  -->

	<form name="detail" method="post" action="OrderDetail.jsp" >
	<input type="hidden" name="no">
	</form>

</body>
</html>
