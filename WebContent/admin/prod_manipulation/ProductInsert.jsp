<%@ page language="java" contentType="text/html;charset=EUC-KR" %>
    <%@ page import="java.util.*, myShop.*"%>
<jsp:useBean id="proMgr" class="myShop.prod.action.ProductMgr" />

<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="#996600" topmargin="100">

	<%@ include file="../mainPage/Top.jsp" %>

	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">
								<!-- flag�� insert��� ��� -->
		<form method="post" action="ProductProc.jsp?flag=insert" enctype="multipart/form-data">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td colspan="2" align="center"><font color="#FFFFFF">��ǰ ���</font></td>
		</tr>
		<tr> 
		<td align="center">��ǰ�̸�</td>
		<td align="left"><input type="text" name="name" size="20"></td>
		</tr>
		<tr> 
		<td align="center">��ǰ�ڵ�</td>
		<td align="left"><input type="text" name="code" size="20"></td>
		</tr>		
		<tr> 
		<td align="center">��ǰ��</td>
		<td align="left"><input type="text" name="model" size="20"></td>
		</tr>		
		<tr> 
		<td align="center">��ǰ����</td>
		<td align="left"><input type="text" name="price" size="20">��</td>
		</tr>
		<tr>
		<td align="center">��ǰ ����</td>
		<td>
			<select name="pspec">
			<option value="none" SELECTED>
			::NORMAL::</option>
			<option value="HIT">HIT</option>
			<option value="NEW">NEW</option>
			<option value="BEST">BEST</option>
			</select>
		</td>
	</tr>
		<tr>
		<td align="center">��ǰ������</td>
		<td>
			<select name="pbrand">
			<option value="none" SELECTED>
			::NORMAL::</option>
			<option value="SAMSUNG">SAMSUNG</option>
			<option value="LG">LG</option>
			<option value="SKY">SKY</option>
			<option value="ETC">ETC</option>			
			</select>
		</td>
	</tr>	
		<tr> 
		<td align="center">��ǰ����</td>
		<td><textarea rows="10" cols="45" name="detail"></textarea></td>
		</tr>
		<tr> 
		<td align="center">��ǰ����</td>
		<td><input type="text" name="stock" size="10">��</td>
		</tr>
		<tr> 
		<td align="center">��ǰ�̹���</td>
		<td><input type="file" name="image"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center"> 
		<input type="submit" value="��ǰ���">&nbsp;&nbsp;&nbsp;
		<input type="reset" value="�ٽþ���">
		</td>
		</tr>
		</table>
		</form>
	
	</td>
	</tr>
	</table>

	<%@ include file="../mainPage/Bottom.jsp" %>

</body>
</html>

