<%@page import="myShop.prod.db.ProductBean"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*, myShop.*,java.text.*" %>

<jsp:useBean id="mycg" class="myShop.category.action.CategoryMgr" scope="session"/>
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />



<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>갤럭시노트2</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../script.js"></script>
</head>
</head>

<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">


<%@ include file="../../Top.jsp"   %>

	<%ProductBean product= proMgr.getProduct(request.getParameter("no"));%>
<table border="1" align="center">
    <tr>
        <td width="150" height="100%" rowspan="3" valign="top">
            <p align="center"><img src="../images/sidebar_01.gif" width="150" height="209" border="0"><img src="../images/sidebar_02.gif" width="150" height="300" border="0"></p>
        </td>
        <td width="633" height="40">
            <p align="center">제품 상세 설명</p>
        </td>		
    </tr>
    <tr>
        <td width="633" height="150">
        
        <form name="cart" action="../cart/CartProc.jsp">
            <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="20%"><img src="upload_images/<%=product.getImage()%>" width="150" height="150" border="0"></td>
                    <td width="80%">
                        <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="100%"><%=product.getName() %></td>
                            </tr>
                            <tr>
                                <td width="100%">
                                    <p><%=product.getPrice() %></p>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%">
                                    <p>수량 : <input  name="quantity" size="5" value="1"> 개</p>
                                    <p>&nbsp;<input type="submit" value="장바구니 담기"></p>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
           <input type=hidden name=product_no value=<%=product.getNo()%>>			
			</form>
        </td>
    </tr>
    <tr>
        <td width="635" height="105">
            <p align="center"><img src="../upload_images/<%=product.getDetail() %>"  width="635" height="8435" border="0"></p>
        </td>
    </tr>
</table>


	<%@ include file="../../Bottom.jsp" %>
	
	
<p>&nbsp;</p>
</body>

</html>