<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"%>
<html>
<head>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
	<title>Q&A �Խ���</title>
	
	<script language="javascript">
	function addqna(){
		qnaform.submit();
	}
	</script>
	
</head>
<body>
<%@include file="../../Top.jsp"%>
<!-- �Խ��� ��� -->
<form action="./QnaWriteAction.bo" method="post" 
	enctype="multipart/form-data" name="qnaform">
<div id="title">Q&A�Խ���</div>	
<table>
	<tr>
		<td><div align="center">�۾���</div></td>
		<td align="left"><input name="gb_name" type="text" size="10" maxlength="10" value=""/></td>
	</tr>
	<tr>
		<td><div align="center">��й�ȣ</div></td>
		<td align="left"><input name="gb_passwd" type="password" size="10" maxlength="10" value=""/></td>
	</tr>
	<tr>
		<td><div align="center">�� ��</div></td>
		<td align="left"><input name="gb_title" type="text" size="50" maxlength="100" value=""/></td>
	</tr>
	<tr>
		<td><div align="center">�� ��</div></td>
		<td align="left"><textarea name="gb_contents" cols="67" rows="15"></textarea></td>
	</tr>
	<tr>
		<td><div align="center">���� ÷��</div></td>
		<td align="left"><input name="gb_file" type="file"/></td>
	</tr>
	<tr>
		<td colspan="2"></td>
	</tr>
	<tr>
	    <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="5">
			<a href="javascript:addqna()">[���]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[�ڷ�]</a>
		</td>
	</tr>
</table>
</form>
<!-- �Խ��� ��� -->
<%@include file="../../Bottom.jsp"%>
</body>
</html>