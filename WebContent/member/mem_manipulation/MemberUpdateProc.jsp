<%@ page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="memMgr" class="myShop.member.action.MemberDAO" />    <!-- ch14.MemberMgr클래스를 id->memMgr의 bean객체로 사용. -->
<jsp:useBean id="regBean" class="myShop.member.db.MemberBean" /> <!--  ch14.RegisterBean클래스를 id->regBean의 bean객체로 사용. ::  -->
<!-- registerbean은 회원의 개인신상정보에 대한 속성 및 getter와 setter를 가지고 있는  class이다. -->
<jsp:setProperty name="regBean" property="*" />   <!--Bean::(regBean:RegisterBean)의 모든 속성을  지정-->
<%
    boolean flag = memMgr.memberUpdate(regBean);  // 개인정보수정 여부를 flag로 받음 (true, false)
%>

<%
if(flag){ 
%>
		<script>
		alert("성공적으로 수정하였습니다");  //성공적으로 수정되었을 경우.
		location.href="../mainPage/Index.jsp"; //index.jsp page로 화면 이동 (로그인 환영제목(배너),카테고리,상품목록)
		</script>
<%
	}else{
%>
		<script>
		alert("수정도중 에러가 발생하였습니다."); //실패하였을 경우
		history.back(); //이전창으로 이동
		</script>

<%
	  }
%>


