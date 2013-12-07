<%@page import="myShop.prod.db.ProductBean"%>
<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, myShop.*"%>
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />

<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="#996600" topmargin="100">

	<%@ include file="../mainPage/Top.jsp" %>
	
	<%ProductBean product= proMgr.getProduct(request.getParameter("no"));%>

	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td colspan="3" align="center"><font color="#FFFFFF"><%=product.getName()%></font></td>
		</tr>
		<tr> 
		<td width="20%">
		<img src="<%=request.getContextPath()%>/upload_images<%=product.getImage()%>" height="150" width="150">
		</td>
		<td width="30%" valign="top">

			<table border="1" width="100%" heigth="100%">
			<tr>
			<td><b>상품이름 : </b><%=product.getName()%></td>
			</tr>		
			<tr>
			 <td><b>모델이름 : </b><%=product.getModel()%></td>
			</tr>
			<tr>
			<td><b>브랜드명 : </b><%=product.getPbrand()%></td>
			</tr>	
			<tr>
			<td><b>가    격 : </b><%=product.getPrice()%></td>
			</tr>
			<tr>
			<td><b>입고날짜 : </b><%=product.getDate()%></td>
			</tr>
			<tr>
			<td><b>재    고 : </b><%=product.getStock()%></td>
			</tr>
			<tr>
			<td>		<!-- 상품 번호 (param) 전달을 폼베이스 포스트 방식으로 전달 -->
		<a href="javascript:productUpdate('<%=product.getNo()%>')">수정하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:productDelete('<%=product.getNo()%>')">삭제하기</a>	</td>
			</tr>	
			</table>
		
		</td>
		</tr>
		<tr>
		<td  colspan="3" width="100%" valign="top"><b>상세설명</b><br><pre><%=product.getDetail()%></pre></td>
		</tr>

		</table>

	</td>
	</tr>
	</table>

	<%@ include file="../mainPage/Bottom.jsp" %>

	<form name="update" method="post" action="ProductUpdate.jsp">
	<input type=hidden name=no>
	</form>
	
	<form name="del" method="post" action="ProductProc.jsp?flag=delete">
	<input type=hidden name=no>
	</form>


</body>
</html>


