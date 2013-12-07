<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body >
<%@ include file="../../Top.jsp"   %>

<form name="regform" action="RegisterProc.jsp" method="post" >
	<font size="5">새로운 로그인 ID 생성</font><p>
	<font size="3">청구/배송 주소</font><hr><p>
	(*)되어 있는 칸을 채워주세요.<p>
	<div id=err_msg></div><p>
	<div id=err_firstname></div>
	<div id=err_lastname></div>
	<div id=err_adddetail></div>
	<div id=err_addnum></div>
	<div id=err_addtown></div>
	<div id=err_addcity></div>
	<div id=err_email></div>
	<div id=err_phon></div>
	<div id=err_emailmacth></div><p>
	<table align="center">
		<tr>
			<td width="20%" align="right">
				Last name(성) * <br>
			</td>
			<td align="left">
				<input type="text" name="lastname"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				First name(명) * <br>
			</td>
			<td align="left">
				<input type="text" name="firstname"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				우편번호 * <br>
			</td>
			<td align="left">
				<input type="text" name="addnum">
				<input type="button" value="우편번호" onclick="zipCheck()"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				시/도 *<br>
			</td>
			<td align="left">
				<select name="addcity" >
					<option value="서울">서울
					<option value="부산">부산
					<option value="대구">대구
					<option value="대전">대전
					<option value="광주">광주
					<option value="인천">인천
					<option value="울산">울산
					<option value="경기">경기
					<option value="강원">강원
					<option value="충남">충남
					<option value="전남">전남
					<option value="전북">전북
					<option value="경남">경남
					<option value="경북">경북
					<option value="제주">제주
					<option selected>선택하세요
				</select><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				시/군/구/동 * <br>
			</td>
			<td align="left">
				<input type="text" name="addtown"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				상세주소 * <br>
			</td>
			<td align="left">
				<input type="text" name="adddetail"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				이메일 * <br>
			</td>
			<td align="left">
				<input type="text" name="email" onkeydown="emailcheck()"><br>
				
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				이메일 확인 * <br>
			</td>
			<td align="left">
				<input type="text" name="emailchk"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				핸드폰번호 * <br>
			</td>
			<td align="left">
				<input type="text" name="phon"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				전화번호 * <br>
			</td>
			<td align="left">
				<input type="text" name="tell"><br>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				생년월일 <br>
			</td>
			<td align="left">
				<input type="text" name="birdate" value="DD" size="5">
				<input type="text" name="birmonth" value="MM" size="5">
				<input type="text" name="biryear" value="YYYY" size="5"><br>
			</td>
		</tr>
	</table>
	<font size="3">로그인</font><hr><p>
	
	<div id=err_msg2></div><p>
	<div id=err_pass></div>
	<div id=err_passchk></div>
	<div id=err_passmacth></div><p>
	
	<table align="center">
		<tr>
			<td width="20%" align="right">
				이메일 * <br>
			</td>
			<td align="left">
				<div id=copyemail></div>
				
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				비밀번호 * <br>
			</td>
			<td align="left">
				<input type="password" name="pass">
			</td>
		</tr>
		<tr>
			<td width="20%" align="right">
				비밀번호 확인 * <br>
			</td>
			<td align="left">
				<input type="password" name="passchk">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<a onclick="inputCheck()" ><font size="5">로그인 ID 생성>></font></a>
			</td>
		</tr>
	</table>
</form>
<%@ include file="../../Bottom.jsp"   %>
</body>
</html>