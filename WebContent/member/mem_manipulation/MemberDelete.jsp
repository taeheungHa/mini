<%@ page contentType="text/html;charset=EUC-KR"%>

<%
	if (session.getAttribute("idKey") == null) { // session으로부터 idKey라는 속성을 얻어서 확인하는데 그 값이 널이면 ,
		response.sendRedirect("../login/Login.jsp"); // 'Login.jsp'page로 이동한다. (foward랑 다르게 back버튼이 먹힌다.)
	} else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원탈퇴</title>
<!-- ▶<<<<< 회원탈퇴창>>>>>◀ -->
<link href="../style.css" rel="stylesheet" type="text/css">
<!-- 전체적인 디자인은 style은 style.css 의 내용을 따른다. -->

</head>
<body bgcolor="white">
	<!-- 배경색은 white -->

	<%@ include file="../../Top.jsp"%>
	<!-- Top = >★main화면에서도 뜨는 기본적인 index link들에 대한 file을 include하고있다. -->
	<table border="1" width="800" height="100%" align="center"
		bordercolor="#FFFFFF">
		<tr>
			<td width="150" height="100%" rowspan="3" valign="top">
				<p align="center">
					<img src="../images/sidebar_01.gif" width="150" height="209"
						border="0"><img src="../images/sidebar_02.gif" width="150"
						height="300" border="0">
				</p>
			</td>
			<td height="100%" valign="top">
				<form name="myform" action="MemberDeleteProc.jsp" method="post">
					<!-- 회원탈퇴 구성창의 form이고 name은 myform 이고 이벤트나 사건?발생하면 intent되어 넘어갈 창 -> MemberDeleteProc.jsp  page이다. -->
					<table width="50%" border="1" align="center" bordercolor="#FFFFFF">
						<!--  method는 post방식을 써서 입력되는 회원정보를 보안할 수 있다. -->
						<tr>
							<td colspan="2" align="center">회원탈퇴</td>
						</tr>
						<tr>
							<td width="47%" align="center">ID</td>
							<td width="53%" align="center"><input type="text"
								name="mem_id">
								</div></td>
						</tr>
						<tr>
							<td align="center">Password</td>
							<td align="center"><input type="password" name="mem_passwd"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="회원탈퇴"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="reset" value="취소"> <!-- 취소 버튼을 누를시 text type에 입력된 아이디와 비밀번호가 초기화된다. -->
							</td>
						</tr>
					</table>
				</form>

			</td>
		</tr>
	</table>

	<%@ include file="../../Bottom.jsp"%>
	<!-- 	Bottom = >★ 위의 top에서와 마찬가지로 main이나 각화면에서 보이는 아랫부분(관리자 단이나 shopping
	mall접속등을 알리는 부분을 module화해서 include시키고 있다.) -->
</body>
</html>
<%
	}
%>