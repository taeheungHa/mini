<%@page import="myShop.member.action.MemberDAO"%>
<%@ page language="java" pageEncoding="EUC-KR"
	errorPage="notice_error.jsp" import="java.util.*, myShop.*"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<%
	//로그인이 되었이어야  보여지도록 검증    
	if (session.getAttribute("idKey") == null) { //  만약, idKey값이 null이면(로그인이 되어있지 않은경우)
		response.sendRedirect("../login/Login.jsp"); // 다시 로그인창으로 보내진다.
	} else {
%>
<%
	String id = request.getParameter("mem_id"); // 아닐 경우엔, 속성 mem_id (아이디)값과 mem_passwd(비밀번호)값을 
		String passwd = request.getParameter("mem_passwd"); //  가져와서 id/passwd String 변수에 저장한다.

		MemberDAO manager = MemberDAO.getInstance();
		//////////////////////////////////객체 생성시 getInstance();를 사용하는 이유
		/* getInstance()와 같이 특정 메소드를 통해서 인스턴스를 생성하는방법은 
		 보통 싱글톤 패턴을 적용한 경우 많이 볼 수 있습니다. 

		 이유인즉, 요청시마다 동일한 객체를 매번 생성하지 않고, 
		 최초 호출시 jvm에 static하게 생성하고자 하는 클래스의 인스턴스를 
		 생성해서 사용하고자 함이 이유입니다. 

		 앞서 언급한 싱글톤 패턴은 좀 더 자세히 찾아 보시길 바라구요... 

		 일반적인 싱글톤 패턴을 본다면 

		 public class Test { 
		 static Test instance; 
		 private Test{}  //외부에서 생성을 못하도록 Default생성자는 private으로 선언합니다. 
		 //특별히 메소드명이 getInstance가 아니어두 상관없습니다. 
		 //getInstance를 싱크로나이즈(동기화) 처리하는 경우도 많이 있습니다. 
		 public static Test getInstance() { /instance가 null인 경우에만 객체를 생성합니다. 
		 if (instance == null) { 
		 instance = new Test(); 
		 } 
		 return instance; 
		 } 
		 } 

		 즉,=> 불필요한 메모리 낭비를 막기 위함과, 
		 jvm내에 유일하게 객체생성을 한 후 사용해야 하는 경우에  싱글톤 패턴을 사용하고  질문하신 내용은
		 일반적인 객체생성과 싱글톤 패턴을 통한 객체생성의 차이점이라 볼 수 있습니다. */
		////////////////////////////////////////////////////////////////////////////////////

		boolean check = manager.loginCheck(id, passwd); //MemberDAO type 객체인 manager의 

		if (check == true) {
			manager.memberDelete(id); //id를 삭제한다.
			session.invalidate(); // 세션을 끊는다.
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 탈퇴</title>
<link href="../style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h4>회원 정보 삭제</h4>
	<div align="center">
		회원정보가 삭제되었습니다.<br /> <input type="button" value="확인"
			onClick="location.href='../mainPage/Index.jsp'"> //확인버튼을 누를시
		index.jsp화면으로 위치를 이동 시킨다.
	</div>
</body>
</html>
<%
	} else {
%>

<script>
	alert("id 또는 비밀번호가 맞지 않습니다."); //id를 prompt창으로 보여준다.

	history.go(-1);
</script>
<%
	}
	}
%>



<!-- JSP 페이지 ::DBConnectionMgr.java -----┬--- Connection 1 ---┐
                                                                  │                              │ 
                                                                  ├--- Connection 2 ---┼--- DataBase
                                                                  │                              │
                                                                   └--- Connection 3 ---               
 -->

