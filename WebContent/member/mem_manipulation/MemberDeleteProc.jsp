<%@page import="myShop.member.action.MemberDAO"%>
<%@ page language="java" pageEncoding="EUC-KR"
	errorPage="notice_error.jsp" import="java.util.*, myShop.*"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<%
	//�α����� �Ǿ��̾��  ���������� ����    
	if (session.getAttribute("idKey") == null) { //  ����, idKey���� null�̸�(�α����� �Ǿ����� �������)
		response.sendRedirect("../login/Login.jsp"); // �ٽ� �α���â���� ��������.
	} else {
%>
<%
	String id = request.getParameter("mem_id"); // �ƴ� ��쿣, �Ӽ� mem_id (���̵�)���� mem_passwd(��й�ȣ)���� 
		String passwd = request.getParameter("mem_passwd"); //  �����ͼ� id/passwd String ������ �����Ѵ�.

		MemberDAO manager = MemberDAO.getInstance();
		//////////////////////////////////��ü ������ getInstance();�� ����ϴ� ����
		/* getInstance()�� ���� Ư�� �޼ҵ带 ���ؼ� �ν��Ͻ��� �����ϴ¹���� 
		 ���� �̱��� ������ ������ ��� ���� �� �� �ֽ��ϴ�. 

		 ��������, ��û�ø��� ������ ��ü�� �Ź� �������� �ʰ�, 
		 ���� ȣ��� jvm�� static�ϰ� �����ϰ��� �ϴ� Ŭ������ �ν��Ͻ��� 
		 �����ؼ� ����ϰ��� ���� �����Դϴ�. 

		 �ռ� ����� �̱��� ������ �� �� �ڼ��� ã�� ���ñ� �ٶ󱸿�... 

		 �Ϲ����� �̱��� ������ ���ٸ� 

		 public class Test { 
		 static Test instance; 
		 private Test{}  //�ܺο��� ������ ���ϵ��� Default�����ڴ� private���� �����մϴ�. 
		 //Ư���� �޼ҵ���� getInstance�� �ƴϾ�� ��������ϴ�. 
		 //getInstance�� ��ũ�γ�����(����ȭ) ó���ϴ� ��쵵 ���� �ֽ��ϴ�. 
		 public static Test getInstance() { /instance�� null�� ��쿡�� ��ü�� �����մϴ�. 
		 if (instance == null) { 
		 instance = new Test(); 
		 } 
		 return instance; 
		 } 
		 } 

		 ��,=> ���ʿ��� �޸� ���� ���� ���԰�, 
		 jvm���� �����ϰ� ��ü������ �� �� ����ؾ� �ϴ� ��쿡  �̱��� ������ ����ϰ�  �����Ͻ� ������
		 �Ϲ����� ��ü������ �̱��� ������ ���� ��ü������ �������̶� �� �� �ֽ��ϴ�. */
		////////////////////////////////////////////////////////////////////////////////////

		boolean check = manager.loginCheck(id, passwd); //MemberDAO type ��ü�� manager�� 

		if (check == true) {
			manager.memberDelete(id); //id�� �����Ѵ�.
			session.invalidate(); // ������ ���´�.
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� Ż��</title>
<link href="../style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h4>ȸ�� ���� ����</h4>
	<div align="center">
		ȸ�������� �����Ǿ����ϴ�.<br /> <input type="button" value="Ȯ��"
			onClick="location.href='../mainPage/Index.jsp'"> //Ȯ�ι�ư�� ������
		index.jspȭ������ ��ġ�� �̵� ��Ų��.
	</div>
</body>
</html>
<%
	} else {
%>

<script>
	alert("id �Ǵ� ��й�ȣ�� ���� �ʽ��ϴ�."); //id�� promptâ���� �����ش�.

	history.go(-1);
</script>
<%
	}
	}
%>



<!-- JSP ������ ::DBConnectionMgr.java -----��--- Connection 1 ---��
                                                                  ��                              �� 
                                                                  ��--- Connection 2 ---��--- DataBase
                                                                  ��                              ��
                                                                   ��--- Connection 3 ---               
 -->

