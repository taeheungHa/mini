<%@page import="myShop.notice.db.NoticeBean"%>
<%@page import="myShop.notice.action.NoticeMgr"%>
<%@ page language="java" 
    pageEncoding="EUC-KR" errorPage="notice_error.jsp" import="java.util.*, myShop.*"%>
    <%@ page contentType="text/html;charset=EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- script���� �ΰ��� �Լ� check, no_detail -->
<script language=JavaScript>
	function check(gb_id) {
		pwd = prompt('����/���� �Ϸ��� ��й�ȣ�� ��������');  //promptâ 
		document.location.href="notice_proc.jsp?action=edit&gb_id="+gb_id+"&upasswd="+pwd; //�Է��Ѱ����� ������ notice_proc.jsp�� �̵�
	}
	function no_detail(gb_id) {
		document.location.href="notice_proc.jsp?action=no_detail&gb_id="+gb_id;  
	}	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����:���ȭ��</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"> <!-- style�� style.css�� ������ ���� ����-->
<script language="JavaScript" src="../script.js"></script>
</head>

  <%
  	if(session.getAttribute("idKey")==null){
        		response.sendRedirect("../login/Login.jsp");         //idKey�� null�̸� Login.jsp page�� �̵�.
        	}
        	
  			NoticeMgr gb = new NoticeMgr();   //NoticeMgr��ü ����(�������� gb)
          	ArrayList<NoticeBean> datas = gb.getDBList();
          	
  %>

<body>
<%@include file="../../Top.jsp" %>     <!-- ���κ�-->
<table border="1" width="800" height="100%" align="center" valign="top"> <!-- table �Ӽ� -->
    <tr>
    <!-- ù��° ��  -->
        <td width="150" height="100%" rowspan="3" valign="top"> 
            <p align="center"> <!-- p tag :���� �±� => ���� :��� -->
            <img src="../images/sidebar_01.gif" width="150" height="209" border="0">
            <img src="../images/sidebar_02.gif" width="150" height="300" border="0">
            </p>
            <!-- p tag�ȿ� ���� �ΰ��� �̹���(�׸�)�� ���� ��Ÿ(����,���� ��)����  -->
        </td>
        
        <!- �ι�° ��  -->
        <td valign="top" >	  
        <form>
        <table width="633" align="center" bgcolor="#FFFFFF" cellpadding="0" 
        cellspacing="0" border="1" bordercolor="#efd3d3">
			<!--�ι�° ���̺��� ù��°�� -->
			<tr align="center" height="40">
			<td  colspan="6" >
                  ��������
			</td>
			</tr>
			<!-- �ι�° ���̺��� �ι�°�� -->
			<tr bgcolor="FFFFFF" align="center" >
			<td>��ȣ</td>
			<td>����</td>
			<td>�ۼ���¥</td>
			<td>�ۼ���</td>
			</tr>
			
			
			
			<%
				// ArrayList ��ü�� ���� DB���� ������ ����� �����.
						for(NoticeBean  guestbook : datas) {
			%>
			
			<!-- �ι�° ���̺��� �������� -->
			  <tr>
			   <td><%=guestbook.getGb_id() %></td>
				<td><a href=javascript:no_detail('<%=guestbook.getGb_id() %>')><%=guestbook.getGb_title() %></a></td>
				<td><%=guestbook.getGb_date()%></td>
				<td> <%=guestbook.getGb_name() %></td>		
			  </tr>
			 
			 
			 <%
				}
			 %>
			 </table>
			 </center>
			 </form>
			 </td> 
			 </tr>
	  <!-- �ٱ� table�� �ι�° ���ȿ� ���� form �� ���� table -->
		</table>



<%@include file="../../Bottom.jsp" %>
</body>
</html>