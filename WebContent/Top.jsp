<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"%>
<%	
	String mem_id = (String)session.getAttribute("login_email");
	
	String log="";
	if(mem_id == null) log ="<a href=/miniProject_v1.1/member/login/Login.jsp>| 로그인  |</a>";
	else{
		log = "님 즐거운 시간 되세요~! <a href=/miniProject_v1.1/member/login/LogOut.jsp>로그아웃  |</a>";
		log=mem_id+log;
	}

	String mem="";
	if(mem_id == null) mem ="<a href=/miniProject_v1.1/member/login/Register.jsp> 회원가입  |</a>";
	else mem = "<a href=/miniProject_v1.1/member/login/MemberUpdate.jsp> 회원수정 |</a>";
%>

<div id="wrap">
<div id="header">
		<span class="logo"><a href="/miniProject_v1.1/index.jsp" ><img src="<%=request.getContextPath() %>/img/logo.png" alt="logo"></a></span>
		<span class="search"><form name="ssss" action="Produ_s.jsp">상품검색 <input type="text" size="50" name="name"><input type="button" value="검색" onclick="javascript:searchProduct()"></form></span>
		<dl class="top">
			<dt class="blind">Top Menu</dt>
			<dd><%=log %></dd>
			<dd><%=mem %></dd>
			<dd><a href="CartList.jsp"> 장바구니 | </a></dd>
			<dd><a href="OrderList.jsp"> 구매목록  |</a></dd>	
			<dd><a href="<%=request.getContextPath()%>/QnaList.bo"> Q&A |</a></dd>	
			<dd><a href="/miniProject_v1.1/admin/notice/notice_list.jsp"> 공지사항 |</a></dd>			
		</dl>
		<h6 class="blind">Main Menu</h6>
		<ul class="nav">
			<li><a href="ProductList.jsp?pbrand=Jewelry" id="menu1">쥬얼리</a></li>			
			<li><a href="ProductList.jsp?pbrand=Charm" id="menu2">참</a></li>			
			<li><a href="ProductList.jsp?pbrand=FashionAcc" id="menu3">패션 액세서리</a></li>			
			<li><a href="ProductList.jsp?pbrand=Sunglass" id="menu4">썬글라스</a></li>			
			<li><a href="ProductList.jsp?pbrand=Watch" id="menu5">위치</a></li>			
			<li><a href="ProductList.jsp?pbrand=Tchotchke" id="menu6">크리스탈 소품</a></li>	
		</ul>
	</div><!-- //header -->    

    <div id="container">
    <div id="contents">