<%@page import="myShop.member.db.MemberBean"%>
<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import ="java.util.*,myShop.*" %> 
<% 
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="memMgr" class="myShop.member.action.MemberDAO" />


<html>
<head>
<title>회원수정</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<script language="javascript">
function move()
{
   var frm = document.regForm;
   frm.action = "MemberDelete.jsp";
   frm.submit();
}
</script>


<script language="JavaScript" src="../script.js"></script>
</head>
<body bgcolor="#FFFFFF" topmargin="0">
<br>

	<%@ include file="../../Top.jsp" %>
	<%MemberBean regBean= memMgr.getMember(mem_id);%>
<table border="1" width="800" height="100%" align="center">
    <tr>
        <!-- <td width="150" height="100%" rowspan="3" valign="top">
            <p align="center"><img src="../images/sidebar_01.gif" width="150" height="209" border="0">
            <img src="../images/sidebar_02.gif" width="150" height="300" border="0"></p>
        </td> -->
        <td valign="top" >	
	<table width="633" align="center" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">
	<tr> 
	<td align="cneter" bgcolor="#FFFFFF">

		<table width="633" align="center" bgcolor="#FFFFFF" border="1">
		<form name="regForm" method="post" action="MemberUpdateProc.jsp">
		<tr align="center" bgcolor="#FFFFFF"> 
		<td colspan="3"><font color="#000000"><b> 
		<%=%>
		회원님의 정보를 수정합니다.</b></font> </td>
		</tr>
		<tr> 
		<td>아이디</td>
		<td><%=%></td>
		</tr>
		<tr> 
		<td>패스워드</td>
		<td><input type="text" name="mem_passwd" value="<%=%>"></td>
		</tr>
		<tr> 
		<td>이름</td>
		<td><input type="text" name="mem_name" value="<%=%>"></td>
		</tr>
		<tr> 
		<td>주민등록번호</td>
		<td><input type="text" name="mem_num1" size="6" value="<%=%>">-
		<input type="text" name="mem_num2" size="7"	value="<%=%>"></td>
		</tr>
		<tr> 
		<td>이메일</td>
		<td><input type="text" name="mem_email"  size="30" value="<%=%>"></td>
		</tr>
		<tr> 
		<td>전화번호</td>
		<td><input type="text" name="mem_phone" value="<%=%>"></td>
		</tr>
		<tr> 
		<td>우편번호</td>
		<td><input type="text" name="mem_zipcode" value="<%=%>">
		<input type="button" value="우편번호찾기" onClick="../register/zipCheck()">
		</td>
		</tr>
		<tr> 
		<td>주소</td>
		<td><input type="text" name="mem_address" size="50" value="<%=%>"></td>
		</tr>
		<tr> 
		<td>직업</td>
		<td><select name=mem_job>
		<option value="0">선택하세요.
		<option value="회사원">회사원
		<option value="연구전문직">연구전문직
		<option value="교수학생">교수학생
		<option value="일반자영업">일반자영업
		<option value="공무원">공무원
		<option value="의료인">의료인
		<option value="법조인">법조인
		<option value="종교,언론,에술인">종교.언론/예술인
		<option value="농,축,수산,광업인">농/축/수산/광업인
		<option value="주부">주부
		<option value="무직">무직
		<option value="기타">기타
		</select>
		<script>document.regForm.mem_job.value="<%=%>"</script>
		</td>
		</tr>
		<tr> 
		<td colspan="2" align="center"><input type="submit" value="수정완료"> 
		&nbsp; &nbsp; &nbsp;<input type="button" value="회원탈퇴" onclick="move()"> &nbsp; &nbsp; &nbsp; 
		<input type="reset" value="다시쓰기"> 
		</td>
		</tr>
		<input type="hidden" name="mem_id" value="<%=mem_id%>">
		</form>
		</table>

	</td>
	</tr>
	</table>
</td>
</tr>
</table>	
	<%@ include file="../../Bottom.jsp" %>
		
</body>
</html>
