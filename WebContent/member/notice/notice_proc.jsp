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

<jsp:useBean id="gb" class="myShop.notice.action.NoticeMgr"/>       <!-- 각각의 클래스를 가지고 id값에 해당하는 bean객체 생성 -->
<jsp:useBean id="guestbook" class="myShop.notice.db.NoticeBean"/> <!-- -->
<jsp:setProperty name="guestbook" property="*"/>   <!-- guestbook bean객체의 모든속성 set -->
<%
	// 사용자 요청을 구분하기 위한 파라미터를 저장할 변수
	String action = request.getParameter("action"); 
	
	


    // 게시물 목록 요청인 경우 
	if(action.equals("list")) {
		response.sendRedirect("notice_list.jsp");
	}
	
	
	
	
	// 게시물 등록 요청인 경우
	else if(action.equals("insert")) {		
		if(gb.insertDB(guestbook)) {
	response.sendRedirect("notice_list.jsp");
		}
		else
	throw new Exception("DB 입력오류");
	}
	
	
	
	
	
	
	// 게시물 수정화면 요청인 경우
	else if(action.equals("edit")) {
		NoticeBean gbook = gb.getDB(guestbook.getGb_id());
		if(!gbook.getGb_passwd().equals(request.getParameter("upasswd"))) {
	out.println("<script>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}
		else {
	request.setAttribute("gbook",gbook);
	pageContext.forward("notice_edit_form.jsp");
	
		}
	}
	
    
    //---디페일 폼으로 가기
	else if(action.equals("no_detail")) {
		NoticeBean gbook = gb.getDB(guestbook.getGb_id());
	request.setAttribute("gbook",gbook);
	pageContext.forward("notice_detail_form.jsp");
		}
	
	
	// 게시물 수정 처리인 경우
	else if(action.equals("update")) {
	if(gb.updateDB(guestbook)) {
		response.sendRedirect("notice_list.jsp");
	}
	else
		throw new Exception("DB 갱신오류");
	}
	
    
    
    // 게시물 삭체 요청인 경우
	else if(action.equals("delete")) {
		if(gb.deleteDB(guestbook.getGb_id())) {
	response.sendRedirect("notice_list.jsp");
		}
		else
	throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>

</body>
</html>