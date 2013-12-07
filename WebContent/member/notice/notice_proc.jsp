<%@page import="myShop.notice.db.NoticeBean"%>
<%@ page contentType="text/html;charset=EUC-KR"  errorPage="notice_error.jsp" import="myShop.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="gb" class="myShop.notice.action.NoticeMgr"/>       <!-- ������ Ŭ������ ������ id���� �ش��ϴ� bean��ü ���� -->
<jsp:useBean id="guestbook" class="myShop.notice.db.NoticeBean"/> <!-- -->
<jsp:setProperty name="guestbook" property="*"/>   <!-- guestbook bean��ü�� ���Ӽ� set -->
<%
	// ����� ��û�� �����ϱ� ���� �Ķ���͸� ������ ����
	String action = request.getParameter("action"); 
	
	


    // �Խù� ��� ��û�� ��� 
	if(action.equals("list")) {
		response.sendRedirect("notice_list.jsp");
	}
	
	
	
	
	// �Խù� ��� ��û�� ���
	else if(action.equals("insert")) {		
		if(gb.insertDB(guestbook)) {
	response.sendRedirect("notice_list.jsp");
		}
		else
	throw new Exception("DB �Է¿���");
	}
	
	
	
	
	
	
	// �Խù� ����ȭ�� ��û�� ���
	else if(action.equals("edit")) {
		NoticeBean gbook = gb.getDB(guestbook.getGb_id());
		if(!gbook.getGb_passwd().equals(request.getParameter("upasswd"))) {
	out.println("<script>alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.!!');history.go(-1);</script>");
		}
		else {
	request.setAttribute("gbook",gbook);
	pageContext.forward("notice_edit_form.jsp");
	
		}
	}
	
    
    //---������ ������ ����
	else if(action.equals("no_detail")) {
		NoticeBean gbook = gb.getDB(guestbook.getGb_id());
	request.setAttribute("gbook",gbook);
	pageContext.forward("notice_detail_form.jsp");
		}
	
	
	// �Խù� ���� ó���� ���
	else if(action.equals("update")) {
	if(gb.updateDB(guestbook)) {
		response.sendRedirect("notice_list.jsp");
	}
	else
		throw new Exception("DB ���ſ���");
	}
	
    
    
    // �Խù� ��ü ��û�� ���
	else if(action.equals("delete")) {
		if(gb.deleteDB(guestbook.getGb_id())) {
	response.sendRedirect("notice_list.jsp");
		}
		else
	throw new Exception("DB ���� ����");
	}
	else {
		out.println("<script>alert('action �Ķ���͸� Ȯ���� �ּ���!!!')</script>");
	}
%>

</body>
</html>