<%@ page contentType="text/html;charset=EUC-KR" %>
<jsp:useBean id="memMgr" class="myShop.member.action.MemberDAO" />

<%
//----- 입력-------------
	String admin_id = request.getParameter("admin_id");
	String admin_passwd = request.getParameter("admin_passwd");
%>

<%
//-----연산처리 : 비지니스 메소드 함수 호출-----
	boolean adminCheck = memMgr.adminCheck(admin_id, admin_passwd);
	if(adminCheck){
		session.setAttribute("adminKey", admin_id);
%>

 <script>
   location.href="../mainPage/Index.jsp";
 </script>
 
<% 
 }else{ 
%>

 <script>
   alert("입력한 정보가 정확하지 않습니다.");
   location.href="AdminLogin.jsp";
 </script>

 <%
 }
 %>
