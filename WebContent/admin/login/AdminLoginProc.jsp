<%@ page contentType="text/html;charset=EUC-KR" %>
<jsp:useBean id="memMgr" class="myShop.member.action.MemberDAO" />

<%
//----- �Է�-------------
	String admin_id = request.getParameter("admin_id");
	String admin_passwd = request.getParameter("admin_passwd");
%>

<%
//-----����ó�� : �����Ͻ� �޼ҵ� �Լ� ȣ��-----
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
   alert("�Է��� ������ ��Ȯ���� �ʽ��ϴ�.");
   location.href="AdminLogin.jsp";
 </script>

 <%
 }
 %>
