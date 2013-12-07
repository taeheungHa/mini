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

		<form method="post" action="ProductProc.jsp?flag=update" enctype="multipart/form-data">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td colspan="2" align="center"><font color="#FFFFFF">��ǰ���</font></td>
		</tr>
		<tr> 
		<td width="31%" align="center">��ǰ�̸�</td>
		<td width="69%" align="left"> 
		<input type="text" name="name" value="<%=product.getName()%>">
		</td>
		</tr>
		<tr> 
		<td height="21" align="center">���̸�</td>
		<td align="left"> 
		 <input type="text" name="model" size="20" value="<%=product.getModel()%>"></td>
		</tr>		
		<tr> 
		<td height="21" align="center">��ǰ����</td>
		<td align="left"> 
		<input type="text" name="price" size="20" value="<%=product.getPrice()%>">��</td>
		</tr>
		<tr> 
		<td align="center">��ǰ����</td>
		<td><textarea rows="10" cols="45" name="detail"><%=product.getDetail()%></textarea>
		</td>
		</tr>
		<tr> 
		<td align="center">��ǰ�԰�����</td>
		<td align="left"> 
		<input type="text" name="stock" size="10" value="<%=product.getStock()%>">��</td>
		</tr>
		<tr> 
		<td align="center">��ǰ�̹���</td>
		<td align="left"><img src="../images/<%=product.getImage()%>">
		<input type="file" name="image"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center"> 
		<input type="submit" value="��ǰ����">&nbsp;&nbsp;&nbsp;
		<input type="reset" value="�ٽþ���">
		</td>
		</tr>
		</table>
		<input type=hidden name="no" value="<%=product.getNo()%>">
		<%
		//session.setAttribute("no", new Integer(product.getNO()));
		//response.encodeUrl(arg0);
		//response.encodeRedirectUrl(arg0);	//�����̷�Ʈ ���
		%>
		
		</form>

	</td>
	</tr>
	</table>

	<%@ include file="../mainPage/Bottom.jsp" %>


</body>
</html>