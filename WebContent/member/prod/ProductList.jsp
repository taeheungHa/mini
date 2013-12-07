 <%@page import="myShop.prod.db.ProductBean"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*, myShop.*"%>
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />
<% 
request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<title>브랜드별 상품목록 </title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../script.js"></script>

</head>
<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">


<%@ include file="../../Top.jsp"   %>

<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<table border="1" width="800" height="100%" align="center" >

  <tr>
        <td width="150" height="100%" rowspan="3" valign="top">
            <p align="center"><img src="../images/sidebar_01.gif" width="150" height="209" border="0"><img src="../images/sidebar_02.gif" width="150" height="300" border="0"></p>
        </td>        
        <td width="633" height="150" valign="top">
	<%
	Vector vResult=null;
	String pbrand = request.getParameter("pbrand");

	if(pbrand!=null){
		 vResult= proMgr.getProductListBrand(pbrand);	
	}else{
	 vResult= proMgr.getProductListBrand(pbrand);
	}%>
	<table width="633" align="center" bgcolor="#FFFFF"  cellpadding="0" cellspacing="0">
	<tr> 
	<td align="center" bgcolor="#FFFFF" >

		<table width="633" align="center" bgcolor="#FFFFFF"  cellpadding="0" cellspacing="0" border="1"  bordercolor="#efd3d3" >
			<tr align="center" height="40">
			<td  colspan="6" >
		
	 	<%
		if("SAMSUNG".equals(request.getParameter("pbrand")))
		{%>
		SAMSUNG
			<!-- <img src="images/samsung_logo.gif" width="150" height="39" border="0"  >  -->
		

		<%}
		
		else if("LG".equals(request.getParameter("pbrand")))
		{%>
		LG
 		<!-- <img src="images/lg_logo.gif" width="150" height="39" border="0"  > -->
		<%}
	 	
		else if("SKY".equals(request.getParameter("pbrand")))
		{%>
		SKY
 		<!-- <img src="images/sky_logo.gif" width="150" height="39" border="0"  > -->
		<%}
		else if("ETC".equals(request.getParameter("pbrand")))
		{%>
		ETC
 		<!-- <img src="images/sky_logo.gif" width="150" height="39" border="0"  > -->
		<%}
		%> 	
	
	
			</td>
			</tr>
		<tr bgcolor="#FFFFFF"> 
		<td align="center"><font color="#000000">제품사진</font></td>
		<td align="center"><font color="#000000">이름</font></td>
		<td align="center"><font color="#000000">가격</font></td>
		<td align="center"><font color="#000000">날짜</font></td>
		<td align="center"><font color="#000000">재고</td>
		<td align="center">&nbsp;</font></td>
		</tr>
		<% 
		for(int i=0; i<vResult.size(); i++){
		ProductBean product = (ProductBean)vResult.get(i);
		%>
		<tr> 
		<td align="center"><img src="../upload_images/<%=product.getImage()%>"  width="100" height="100"></td>
		<td align="center"><%=product.getName()%></td>
		<td align="center"><%=product.getPrice()%></td>
		<td align="center"><%=product.getDate()%></td>
		<td align="center"><%=product.getStock()%></td>
		<td align="center">
 		<a href="ProductDetail.jsp?no=<%=product.getNo()%>">상세보기</a>
<%-- 		 <a href="javascript:productDetail('<%=product.getNo()%>')">상세보기</a> --%> 
		</td>
		</tr>
		<%}%>
		</table>
		
	</td>
	</tr>
	<form name="ssss" action="Produ_s.jsp">
	<tr bgcolor="#FFFFFF">
		<td colspan="6" align="center" >상품명 검색 : <input type="text" size="50" name="name">
		<input type="button" value="검색" onclick="javascript:searchProduct()">
		</td>
	</form>		
	</tr>
	</table>
        </td>
    </tr>
</table>
	
	<%@ include file="../../Bottom.jsp" %> 
<p>&nbsp;</p>
</body>
</html>