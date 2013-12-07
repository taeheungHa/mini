
<%@page import="myShop.prod.db.ProductBean"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*, myShop.*"%>
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />
<!-- ProductMgr class�� proMgr Bean��ü�� �����´�. -->
<%
	request.setCharacterEncoding("euc-kr"); /* �ѱ� ������� ���� */
%>
<html>
<head>
<title>��ǰ���</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<!-- font�����ε� style.css������ ���� ���. -->

<script language="JavaScript" src="../script.js"></script>
</head>
<body bgcolor="white" text="black" link="blue" vlink="purple"
	alink="red">
	<!-- ȭ�� ������ ���� -->

	<%@ include file="../../Top.jsp"%>
	<!-- ȭ�� ������ Moduleȭ �Ǿ��ִ� top.jsp file include -->

	<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<table border="1" width="800" height="100%" align="center">
		<!-- table���� -->

		<tr>
			<td width="150" height="100%" rowspan="3" valign="top">
				<!-- ù���� td�� ���� ���� -->
				<p align="center">
					<!-- p tag :: ���� �±� -->
					<img src="../images/sidebar_01.gif" width="150" height="209"
						border="0">
					<!-- ���ܿ� ���� �ΰ��� img������ ����-->
					<img src="../images/sidebar_02.gif" width="150" height="300"
						border="0">
				</p>
			</td>
			<td width="633" height="150" valign="top">
				<%
					Vector vResult = null; //Vector type vResult����
					String name = request.getParameter("name");

					if (name != null) { //name �� null�� �ƴҰ��
						vResult = proMgr.getProductSearchList(name); //proMgr -> ProductMgr type(��ǰ�˻������ Vector type vResult�� ����)
					} else { //name�� null�� ���
						vResult = proMgr.getProductListBrand(name); //�귻�庰 ��ǰ ������  Vector type vResult�� ����
					}

					// �˻������ ���� ��ǰ���� ::�� �� Vector�� ����.
				%>
				<table width="633" align="center" bgcolor="#FFFFF" cellpadding="0">
					<!-- �ܺ� ���̺� ::ū ���̺�  -->
					cellspacing="0">
					<tr>
						<td align="center" bgcolor="#FFFFF">

							<table width="633" align="center" bgcolor="#FFFFFF"
								cellpadding="0" cellspacing="0" border="1" bordercolor="#efd3d3">
								<!-- ���̺� ���� ���̺�  -->
								<tr align="center">
									<!-- table ������ ����  -->
									<td colspan="6"><br> <font size="4" color="#000000">�˻��Ͻ�
											��ǰ�� ���� �˻� ��� </font>
										<p></td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<!-- ��ǰ���� ���� table -->
									<td align="center"><font color="#000000">��ǰ����</font></td>
									<td align="center"><font color="#000000">�̸�</font></td>
									<td align="center"><font color="#000000">����</font></td>
									<td align="center"><font color="#000000">��¥</font></td>
									<td align="center"><font color="#000000">���</font></td>
									<td align="center"><font color="#ffffff">&nbsp;</td>
								</tr>

								<%
									if (vResult != null) { //�˻� ��� �־ ������ vector������ ����������
										for (int i = 0; i < vResult.size(); i++) {
											ProductBean product = (ProductBean) vResult.get(i);
								%>


								<!-- vector�� ���� ���� �ϳ� �� �����ͼ� ProductBean type (product)�� ���� -->


								<!-- ���࿡ ��ǰ�̹���,�̸�,���� �� ������ �����ش�.  -->
								<tr>
									<td align="center"><img
										src="../upload_images/<%=product.getImage()%>" width="100" height="100"></td>
									<td align="center"><%=product.getName()%></td>
									<td align="center"><%=product.getPrice()%></td>
									<td align="center"><%=product.getDate()%></td>
									<td align="center"><%=product.getStock()%></td>
									<td align="center"><a
										href="../prod/ProductDetail.jsp?no=<%=product.getNo()%>">�󼼺���</a> <%-- 		 <a href="javascript:productDetail('<%=product.getNo()%>')">�󼼺���</a> --%>
									</td>
								</tr>
								<%
									}
									} else {
										//if (vResult == null)�ϰ��
								%>
								<tr align="center">
									<td colspan="6"><font size="4" color="#000000">����
											�˻��Ͻ� ��ǰ�� ���� ��ǰ�� �����ϴ�...... <font color="#000000"></td>
								</tr>
								<%
									}
								%>
							</table>

						</td>
					</tr>
					<form name="ssss" action="#"> <!--��ǰ �˻��� ���� table ,�˻� button Ŭ����javascript:searchProduct() ����.  -->
						<tr bgcolor="#FFFFFF">
							<td colspan="6" align="center">��ǰ �˻� : 
							<input type="text" size="50" name="name"> 
							<input type="button" value="�˻�" onclick="javascript:searchProduct()">
							</td>
					</form>
					</tr>
				</table>
		</td>
		</tr>
	</table>

	<%@ include file="../../Bottom.jsp"%>
	<!--���̺��� �Ʒ��κ��� design?  -->
	<p>&nbsp;</p>
</body>
</html>