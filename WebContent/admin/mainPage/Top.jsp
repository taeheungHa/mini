<%@ page contentType="text/html;charset=EUC-KR" %>
<%

    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("../login/AdminLogin.jsp");
	}
%>
<table width="75%" align="center" bgcolor="#FFFF99">
  <tr bgcolor="#FFCC00"> 
    <td align="center"><b><a href="Index.jsp">权</a></b></td>
    <td align="center"><b><a href="../login/AdminLogout.jsp">肺弊酒眶</a></b></td>
    <td align="center"><b><a href="../member/MemberMgr.jsp">雀盔包府</a></b></td>
    <td align="center"><b><a href="../prod_manipulation/ProductMgr.jsp">惑前格废</a></b></td>
    <td align="center"><b><a href="../order/OrderMgr.jsp">林巩包府</a></b></td>
  	<td align="center"><b><a href="../qna/qna_list.jsp">QnA包府</a></b></td>
    <td align="center"><b><a href="../notice/notice_list.jsp">傍瘤荤亲 包府</a></b></td>
  </tr>
</table> 