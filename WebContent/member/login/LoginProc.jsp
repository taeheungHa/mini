<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="mdao" class="myShop.member.action.MemberDAO" />
<%
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");

	boolean loginCheck = mdao.loginCheck(email, pass);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		if (loginCheck){
			session.setAttribute("login_email",email);
			response.sendRedirect("LoginSucc.jsp");
		}else{
			response.sendRedirect("Login.jsp?loginchek=false");
		}
	%>

</body>
</html>