<%@ page contentType="text/html;charset=EUC-KR" %>
<%

    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("../login/AdminLogin.jsp");
	}
%>
<table width="75%" align="center" bgcolor="#FFFF99">
  <tr bgcolor="#FFCC00"> 
    <td align="center"><b><a href="Index.jsp">Ȩ</a></b></td>
    <td align="center"><b><a href="../login/AdminLogout.jsp">�α׾ƿ�</a></b></td>
    <td align="center"><b><a href="../member/MemberMgr.jsp">ȸ������</a></b></td>
    <td align="center"><b><a href="../prod_manipulation/ProductMgr.jsp">��ǰ���</a></b></td>
    <td align="center"><b><a href="../order/OrderMgr.jsp">�ֹ�����</a></b></td>
  	<td align="center"><b><a href="../qna/qna_list.jsp">QnA����</a></b></td>
    <td align="center"><b><a href="../notice/notice_list.jsp">�������� ����</a></b></td>
  </tr>
</table> 