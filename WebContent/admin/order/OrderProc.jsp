<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, myShop.*"%>
<jsp:useBean id="orderMgr" class="myShop.order.action.OrderMgr" />

<%
	request.setCharacterEncoding("euc-kr");
    String flag = request.getParameter("flag");
    String no = request.getParameter("no");
	String state = request.getParameter("state");
	boolean result = false;
	
	if(flag.equals("update")){
    	result=orderMgr.updateOrder(no, state);
    }else if(flag.equals("delete")){
		result=orderMgr.deleteOrder(no);
	}else{
		response.sendRedirect("OrderMgr.jsp");
	}

    if(result){
%>
	<script>
		alert("���������� ó���Ͽ����ϴ�.");
		location.href="OrderMgr.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("������ �߻��Ͽ����ϴ�.");
		location.href="OrderMgr.jsp";
	</script>
<%
	}
%>

