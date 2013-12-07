<%@page import="myShop.notice.db.NoticeBean"%>
<%@page import="myShop.notice.action.NoticeMgr"%>
<%@ page language="java" 
    pageEncoding="EUC-KR" errorPage="notice_error.jsp" import="java.util.*, myShop.*"%>
    <%@ page contentType="text/html;charset=EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- script안의 두개의 함수 check, no_detail -->
<script language=JavaScript>
	function check(gb_id) {
		pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');  //prompt창 
		document.location.href="notice_proc.jsp?action=edit&gb_id="+gb_id+"&upasswd="+pwd; //입력한값들을 가지고 notice_proc.jsp로 이동
	}
	function no_detail(gb_id) {
		document.location.href="notice_proc.jsp?action=no_detail&gb_id="+gb_id;  
	}	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록:목록화면</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"> <!-- style은 style.css에 선언한 정보 참조-->
<script language="JavaScript" src="../script.js"></script>
</head>

  <%
  	if(session.getAttribute("idKey")==null){
        		response.sendRedirect("../login/Login.jsp");         //idKey가 null이면 Login.jsp page로 이동.
        	}
        	
  			NoticeMgr gb = new NoticeMgr();   //NoticeMgr객체 생성(참조변수 gb)
          	ArrayList<NoticeBean> datas = gb.getDBList();
          	
  %>

<body>
<%@include file="../../Top.jsp" %>     <!-- 윗부분-->
<table border="1" width="800" height="100%" align="center" valign="top"> <!-- table 속성 -->
    <tr>
    <!-- 첫번째 열  -->
        <td width="150" height="100%" rowspan="3" valign="top"> 
            <p align="center"> <!-- p tag :문단 태그 => 정렬 :가운데 -->
            <img src="../images/sidebar_01.gif" width="150" height="209" border="0">
            <img src="../images/sidebar_02.gif" width="150" height="300" border="0">
            </p>
            <!-- p tag안에 들어가는 두개의 이미지(그림)에 대한 기타(높이,넓이 등)설정  -->
        </td>
        
        <!- 두번째 열  -->
        <td valign="top" >	  
        <form>
        <table width="633" align="center" bgcolor="#FFFFFF" cellpadding="0" 
        cellspacing="0" border="1" bordercolor="#efd3d3">
			<!--두번째 테이블의 첫번째행 -->
			<tr align="center" height="40">
			<td  colspan="6" >
                  공지사항
			</td>
			</tr>
			<!-- 두번째 테이블의 두번째행 -->
			<tr bgcolor="FFFFFF" align="center" >
			<td>번호</td>
			<td>제목</td>
			<td>작성날짜</td>
			<td>작성자</td>
			</tr>
			
			
			
			<%
				// ArrayList 객체를 통해 DB에서 가져온 목록을 출력함.
						for(NoticeBean  guestbook : datas) {
			%>
			
			<!-- 두번째 테이블의 세번재행 -->
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
	  <!-- 바깥 table의 두번째 열안에 들어가는 form 과 작은 table -->
		</table>



<%@include file="../../Bottom.jsp" %>
</body>
</html>