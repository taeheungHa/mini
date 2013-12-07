
<%@page import="myShop.prod.db.ProductBean"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*, myShop.*"%>
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />
<!-- ProductMgr class를 proMgr Bean객체로 가져온다. -->
<%
	request.setCharacterEncoding("euc-kr"); /* 한글 입출력을 위해 */
%>
<html>
<head>
<title>상품목록</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<!-- font디자인등 style.css선언한 것을 사용. -->

<script language="JavaScript" src="../script.js"></script>
</head>
<body bgcolor="white" text="black" link="blue" vlink="purple"
	alink="red">
	<!-- 화면 디자인 설정 -->

	<%@ include file="../../Top.jsp"%>
	<!-- 화면 윗구성 Module화 되어있던 top.jsp file include -->

	<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<table border="1" width="800" height="100%" align="center">
		<!-- table설정 -->

		<tr>
			<td width="150" height="100%" rowspan="3" valign="top">
				<!-- 첫번재 td에 대한 설정 -->
				<p align="center">
					<!-- p tag :: 문단 태그 -->
					<img src="../images/sidebar_01.gif" width="150" height="209"
						border="0">
					<!-- 문단에 들어가는 두개의 img에대한 설정-->
					<img src="../images/sidebar_02.gif" width="150" height="300"
						border="0">
				</p>
			</td>
			<td width="633" height="150" valign="top">
				<%
					Vector vResult = null; //Vector type vResult선언
					String name = request.getParameter("name");

					if (name != null) { //name 이 null이 아닐경우
						vResult = proMgr.getProductSearchList(name); //proMgr -> ProductMgr type(상품검색결과를 Vector type vResult에 대입)
					} else { //name이 null일 경우
						vResult = proMgr.getProductListBrand(name); //브렌드별 상품 정보를  Vector type vResult에 대입
					}

					// 검색결과에 대한 상품정보 ::둘 다 Vector로 받음.
				%>
				<table width="633" align="center" bgcolor="#FFFFF" cellpadding="0">
					<!-- 외부 테이블 ::큰 테이블  -->
					cellspacing="0">
					<tr>
						<td align="center" bgcolor="#FFFFF">

							<table width="633" align="center" bgcolor="#FFFFFF"
								cellpadding="0" cellspacing="0" border="1" bordercolor="#efd3d3">
								<!-- 테이블 내의 테이블  -->
								<tr align="center">
									<!-- table 디자인 설정  -->
									<td colspan="6"><br> <font size="4" color="#000000">검색하신
											상품명에 대한 검색 결과 </font>
										<p></td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<!-- 제품정보 관련 table -->
									<td align="center"><font color="#000000">제품사진</font></td>
									<td align="center"><font color="#000000">이름</font></td>
									<td align="center"><font color="#000000">가격</font></td>
									<td align="center"><font color="#000000">날짜</font></td>
									<td align="center"><font color="#000000">재고</font></td>
									<td align="center"><font color="#ffffff">&nbsp;</td>
								</tr>

								<%
									if (vResult != null) { //검색 결과 있어서 정보를 vector형으로 가져왔으면
										for (int i = 0; i < vResult.size(); i++) {
											ProductBean product = (ProductBean) vResult.get(i);
								%>


								<!-- vector로 부터 값을 하나 씩 가져와서 ProductBean type (product)로 받음 -->


								<!-- 한행에 상품이미지,이름,가격 등 정보를 보여준다.  -->
								<tr>
									<td align="center"><img
										src="../upload_images/<%=product.getImage()%>" width="100" height="100"></td>
									<td align="center"><%=product.getName()%></td>
									<td align="center"><%=product.getPrice()%></td>
									<td align="center"><%=product.getDate()%></td>
									<td align="center"><%=product.getStock()%></td>
									<td align="center"><a
										href="../prod/ProductDetail.jsp?no=<%=product.getNo()%>">상세보기</a> <%-- 		 <a href="javascript:productDetail('<%=product.getNo()%>')">상세보기</a> --%>
									</td>
								</tr>
								<%
									}
									} else {
										//if (vResult == null)일경우
								%>
								<tr align="center">
									<td colspan="6"><font size="4" color="#000000">고객이
											검색하신 상품명에 대한 상품이 없습니다...... <font color="#000000"></td>
								</tr>
								<%
									}
								%>
							</table>

						</td>
					</tr>
					<form name="ssss" action="#"> <!--상품 검색에 관한 table ,검색 button 클릭시javascript:searchProduct() 수행.  -->
						<tr bgcolor="#FFFFFF">
							<td colspan="6" align="center">상품 검색 : 
							<input type="text" size="50" name="name"> 
							<input type="button" value="검색" onclick="javascript:searchProduct()">
							</td>
					</form>
					</tr>
				</table>
		</td>
		</tr>
	</table>

	<%@ include file="../../Bottom.jsp"%>
	<!--테이블의 아랫부분을 design?  -->
	<p>&nbsp;</p>
</body>
</html>