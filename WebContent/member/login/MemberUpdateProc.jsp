<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="mdao" class="myShop.member.action.MemberDAO" />
<jsp:useBean id="memBean" class="myShop.member.db.MemberBean" />
<jsp:setProperty name="memBean" property="*" />
<%
	boolean flag = mdao.memberUpdate(memBean);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		if (flag) {
			out.println("<script>");
			out.println("location.href='MemberUpdate.jsp?upchek=true'");
			out.println("</script>");
		} else {
	%>
	실패
	<%
		}
	%>
</body>
</html>