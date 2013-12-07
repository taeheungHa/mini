<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="mdao" class="myShop.member.action.MemberDAO" />
    <%
    	String email = request.getParameter("email");
    
    	boolean passCheck = mdao.passCheck(email);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		if(passCheck){
			out.println("<script>");
			out.println("location.href='Login.jsp?email="+email+"&passchek=true'");
			out.println("</script>");
	
	}else{ %>
		실패
	<%} 
	
	/* out.println("<script>");
	out.println("location.href='RegSucc.jsp?email=" +memBean.getEmail()+"'");
	out.println("</script>"); */
	%>

</body>
</html>