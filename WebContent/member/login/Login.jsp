<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<% String email = request.getParameter("email");
		String passchek = request.getParameter("passchek");
		String loginchek = request.getParameter("loginchek");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body>
<%@ include file="../../Top.jsp"   %>
<form name="loginform" action="LoginProc.jsp" method="post">
	<table  width="900px">
		<tr>
			<td colspan="2"><font size="5">로그인</font><p>
			<%if(passchek!=null){
					if(passchek.equals("true")){%>
						<hr><font color="green" size="4"><b>새로운 로그인 정보를 다음주소 전송했습니다.<br>
						<%=email %>
						</b></font><hr><p>
						<%
					}
			}%>
			  이곳에서 개인정보 변경, 주문 관리, 위시리스트 확인이 가능합니다. 온라인
				기프트 카드 사용 확인은 보안을 위하여 온라인 등록이 필요합니다. 로그인을 하시거나 새로운 로그인 ID를 생성하세요.
			</td>
		</tr>
		<tr>
			<td>기존 로그인 ID사용<hr><p></td>
			<td>새로운 로그인 ID 생성 <hr><p></td>
		</tr>

		<tr>
			<td>
				<table id="logintable" width="100%">
					<tr>
						<td colspan="2">
							이메일 주소와 비밀번호를 입력하세요. <p>
							<div id=err_login></div><p>
							<%
							if(loginchek!=null && loginchek.equals("false")){
								%>
								<font color='red'><b>일치하는로그인 등록 정보가 없습니다. 다시 시도하세요.	</b></font>
							<%
								loginchek=null;
							}%>
						</td>
					</tr>
					<tr>
						<td width="35%" align="right">
							이메일 * <br>
							비밀번호 * <br><br>
						</td>
						<td align="left">
							<input type="text" name="email"><br>
							<input type="password" name="pass"><br>
							<a href="Password.jsp">>비밀번호 찾기<br></a>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<a onclick="loginCheck()" ><font size="5">로그인>></font></a>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							내 정보는 안전하게 보호되고 있나요?<br>
							네. 모든 정보는 암호화되므로 제 3자가 개인 정보를 볼 수 없습니다. (  ) 이러한 보안 방법은 브라우저 코너부분에 기호화되어 표시됩니다.
						</td>
					</tr>
				</table>
			 </td>
			<td>
				<table id="registertable" width="100%">
					<tr>
						<td>
							편리한 온라인 쇼핑을 위한 로그인 ID가 없으시면, 이곳에서 등록해 주시기 바랍니다.<p>
						</td>
					</tr>
					<tr>
						<td align="right">
							<a href="Register.jsp" ><font size="5">로그인 ID 생성>></font></a>
						</td>
					</tr>
					<tr>
						<td>
							가입 후 즉시 다양한 혜택을 즐겨보세요.
							<ul>
								<li>온라인 샵에 등록하여, 보다 빠른 쇼핑을 즐기세요. 보다 자세한 사항은 스와로브스키 개인정보 취급방침을 확인하세요.. <br>
								<li>위시리스트에 원하는 제품을 저장하세요. 위시리스트를 가족과 친구에게 전송할 수 있습니다. <br>
								<li>언제든지 주문 현황을 보실 수 있습니다. <br>
							</ul>
						</td>
					</tr>
					
				</table>
			
			</td>
		</tr>

	</table>
</form>
<%@ include file="../../Bottom.jsp"   %>
</body>
</html>