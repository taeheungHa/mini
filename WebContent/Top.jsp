<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"%>
<%	
	String mem_id = (String)session.getAttribute("login_email");
	
	String log="";
	if(mem_id == null) log ="<a href=/miniProject_v1.1/member/login/Login.jsp>| �α���  |</a>";
	else{
		log = "�� ��ſ� �ð� �Ǽ���~! <a href=/miniProject_v1.1/member/login/LogOut.jsp>�α׾ƿ�  |</a>";
		log=mem_id+log;
	}

	String mem="";
	if(mem_id == null) mem ="<a href=/miniProject_v1.1/member/login/Register.jsp> ȸ������  |</a>";
	else mem = "<a href=/miniProject_v1.1/member/login/MemberUpdate.jsp> ȸ������ |</a>";
%>

<div id="wrap">
<div id="header">
		<span class="logo"><a href="/miniProject_v1.1/index.jsp" ><img src="<%=request.getContextPath() %>/img/logo.png" alt="logo"></a></span>
		<span class="search"><form name="ssss" action="Produ_s.jsp">��ǰ�˻� <input type="text" size="50" name="name"><input type="button" value="�˻�" onclick="javascript:searchProduct()"></form></span>
		<dl class="top">
			<dt class="blind">Top Menu</dt>
			<dd><%=log %></dd>
			<dd><%=mem %></dd>
			<dd><a href="CartList.jsp"> ��ٱ��� | </a></dd>
			<dd><a href="OrderList.jsp"> ���Ÿ��  |</a></dd>	
			<dd><a href="<%=request.getContextPath()%>/QnaList.bo"> Q&A |</a></dd>	
			<dd><a href="/miniProject_v1.1/admin/notice/notice_list.jsp"> �������� |</a></dd>			
		</dl>
		<h6 class="blind">Main Menu</h6>
		<ul class="nav">
			<li><a href="ProductList.jsp?pbrand=Jewelry" id="menu1">���</a></li>			
			<li><a href="ProductList.jsp?pbrand=Charm" id="menu2">��</a></li>			
			<li><a href="ProductList.jsp?pbrand=FashionAcc" id="menu3">�м� �׼�����</a></li>			
			<li><a href="ProductList.jsp?pbrand=Sunglass" id="menu4">��۶�</a></li>			
			<li><a href="ProductList.jsp?pbrand=Watch" id="menu5">��ġ</a></li>			
			<li><a href="ProductList.jsp?pbrand=Tchotchke" id="menu6">ũ����Ż ��ǰ</a></li>	
		</ul>
	</div><!-- //header -->    

    <div id="container">
    <div id="contents">