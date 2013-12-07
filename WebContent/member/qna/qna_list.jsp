<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="myShop.qna.db.*" %>
<%

	List qnaList = (List) request.getAttribute("qnalist");
	int listcount = 0;
	int maxpage = 0;
	int nowpage = 0;
	int startpage = 0;
	int endpage = 0;
	if (qnaList != null) {

		listcount = ((Integer) request.getAttribute("listcount"))
				.intValue();

		nowpage = ((Integer) request.getAttribute("page")).intValue();
		maxpage = ((Integer) request.getAttribute("maxpage"))
				.intValue();
		startpage = ((Integer) request.getAttribute("startpage"))
				.intValue();
		endpage = ((Integer) request.getAttribute("endpage"))
				.intValue();
	}

	QnaBean qna = new QnaBean();
%>

<html>
<head>
<title>Q&A</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<%@include file="../../Top.jsp"%>
	<!-- �Խ��� ����Ʈ -->
<div id="title">Q&A �Խ���</div>
	<table width="100%">
		<%
			if (listcount > 0) {
		%>
		<tr>
			<td colspan="5"><font size=2>�� ���� :${listcount}</font></td>
		</tr>
		<tr>
			<td width="8%" height="26">��ȣ</td>
			<td width="50%">����</td>
			<td width="14%">�ۼ���</td>
			<td width="17%">��¥</td>
			<td width="11%">��ȸ��</td>
		</tr>

		<%
			for (int i = 0; i < qnaList.size(); i++) {
					QnaBean bl = (QnaBean) qnaList.get(i);
		%>
		<tr onmouseover="this.style.backgroundColor='F8F8F8'" onmouseout="this.style.backgroundColor=''">
			<td><%=bl.getGb_num()%></td> 
			<td>
				<div align="left">
					<%
						if (bl.getGb_re_lev() != 0) {
					%>
					<%
						for (int a = 0; a <= bl.getGb_re_lev() * 2; a++) {
					%>
					&nbsp;
					<%
						}
					%>
					
					<%
						} else {
					%>
					
					<%
						}
					%>
					<a href="./QnaDetailAction.bo?num=<%=bl.getGb_num()%>"> <%=bl.getGb_title()%>
					</a>
				</div>
			</td>

			<td>
				<div align="center"><%=bl.getGb_name()%></div>
			</td>
			<td>
				<div align="center"><%=bl.getGb_date()%></div>
			</td>
			<td>
				<div align="center"><%=bl.getGb_readcnt()%></div>
			</td>
		</tr> <!-- ������� �۳���ҷ����� -->
		<%
			}
		%>
		<tr> <!-- ����¡ó�� -->
			<td colspan=5>
				<%
					if (nowpage <= 1) {
				%> [����]&nbsp; <%
 	} else {
 %> <a href="./QnaList.bo?page=<%=nowpage - 1%>">[����]</a>&nbsp; <%
 	}
 %> <%
 	for (int a = startpage; a <= endpage; a++) {
 			if (a == nowpage) {
 %> [<%=a%>] <%
 	} else {
 %> <a href="./QnaList.bo?page=<%=a%>">[<%=a%>]</a>&nbsp; <%
 	}
 %> <%
 	}
 %> <%
 	if (nowpage >= maxpage) {
 %> [����] <%
 	} else {
 %> <a href="./QnaList.bo?page=<%=nowpage + 1%>">[����]</a> <%
 	}
 %>
	</td>
</tr>
		<%
			} else {
		%>
		<tr>
			<td align=center>
				<%
					if (listcount == 0) {
				%><font size=2>��ϵ� ���� �����ϴ�.</font>
				<%
					} else {
				%> <%=qna.getGb_num()%> <%
 	}
 		;
 %>
			</td>
		</tr>
		<%
			}
		%>
		<tr align="right">
			<td colspan="5"><a href="/miniProject_v1.1/QnaWrite.bo">[�۾���]</a></td>
		</tr>
	</table>
<%@include file="../../Bottom.jsp"%>
</body>
</html>