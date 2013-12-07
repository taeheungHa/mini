<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="myShop.member.action.*" %>
<%@ page import="myShop.member.db.*" %>
<jsp:useBean id="memDAO" class="myShop.member.action.MemberDAO"/>

<%
   request.setCharacterEncoding("euc-kr");

   String check = request.getParameter("check");
   String area3 = request.getParameter("area3");
   
   Vector zipcodeList = memDAO.zipcodeRead(area3);
   int totalList = zipcodeList.size(); 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script language="JavaScript" src="script.js"></script>
<script>
function dongCheck(){
	if (document.zipform.area3.value == ""){
		alert("동이름을 입력하세요");
		document.zipform.area3.focus();
		return;
	}
	document.zipform.submit();
}

function sendAddress(zipcode,area1,area2,area3,area4){
//	var loc = ["서울","부산","대구","대전","광주","인천","울산","경기","강원","충남","충북","전남","전북","경남","경북","제주"];
	var address =area2+" "+area3;
	//opener : 부모창
	//부모창의 우편번호 글상자에 검색된 우편번호 입력
	opener.document.regform.addnum.value=zipcode;
	//부모창의 주소 글상자에 검색된 주소정보 입력
	switch (area1) {
		case "서울":
			opener.document.regform.addcity.value=area1;
		break;
		case "부산":
			opener.document.regform.addcity.value=area1;
		break;
		case "대구":
			opener.document.regform.addcity.value=area1;
		break;
		case "대전":
			opener.document.regform.addcity.value=area1;
		break;
		case "광주":
			opener.document.regform.addcity.value=area1;
		break;
		case "인천":
			opener.document.regform.addcity.value=area1;
		break;
		case "울산":
			opener.document.regform.addcity.value=area1;
		break;
		case "경기":
			opener.document.regform.addcity.value=area1;
		break;
		case "강원":
			opener.document.regform.addcity.value=area1;
		break;
		case "충남":
			opener.document.regform.addcity.value=area1;
		break;
		case "충북":
			opener.document.regform.addcity.value=area1;
		break;
		case "전남":
			opener.document.regform.addcity.value=area1;
		break;
		case "경남":
			opener.document.regform.addcity.value=area1;
		break;
		case "경북":
			opener.document.regform.addcity.value=area1;
		break;
		case "제주":
			opener.document.regform.addcity.value=area1;
		break;
	}
	opener.document.regform.addtown.value=address;
	self.close();		//현재 팝업창 자신 닫기
}
</script>
</head>
<body>
	<font size="5">우편번호 검색</font>	<p>
	(*)된 필드를 채우세요.	<p>
	지역명을 입력후 검색버튼을 클릭하세요.<p>
	
	<table>
		<form name="zipform" method="post" action="ZipCheck.jsp">
			<tr>
				<td >동(읍/면/리) * </td>
				<td><input type="text" name="area3"> </td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<a onclick="dongCheck();"><font size="5">검색 >></font></a>
				</td>
			</tr>
			<input type="hidden" name="check" value="n">
		</form>
		<%if(check.equals("n")){ %>
			<%if(zipcodeList.isEmpty()){ %>
				<tr><td align="center"><br>검색된 결과가 없습니다.</td></tr>
			<%}else{ %>
				<tr><td align="center"><br>※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td></tr>
				<%for (int i=0;i<totalList;i++) {
					ZipcodeBean zipBean = (ZipcodeBean)zipcodeList.elementAt(i);
					String tempZipcode =zipBean.getZipcode();
					String temptArea1 =zipBean.getArea1();
					String temptArea2 =zipBean.getArea2();
					String temptArea3 =zipBean.getArea3();
					String temptArea4 =zipBean.getArea4();
					%>
					<tr>
						<td>
							<a href="javascript:sendAddress('<%=tempZipcode%>','<%=temptArea1%>','<%=temptArea2%>','<%=temptArea3%>','<%=temptArea4%>')">
       						<%=tempZipcode%>&nbsp;<%=temptArea1%>&nbsp;<%=temptArea2%>&nbsp;
		 					<%=temptArea3%>&nbsp;<%=temptArea4%></a><br>
		 			<%} %>
			<%} %>
		<%} %>
						</td>
					</tr>
	</table>
	
</body>
</html>