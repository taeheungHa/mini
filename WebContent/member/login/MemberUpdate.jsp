<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import ="java.util.*,myShop.member.db.*" %> 
<%
	String upchek = request.getParameter("upchek");
%>
<jsp:useBean id="mdao" class="myShop.member.action.MemberDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="../../Top.jsp"   %>
	<%MemberBean memBean= mdao.getMember(mem_id);%>
	<form name="memform" action="MemberUpdateProc.jsp" method="post">
		<input type="hidden" name="no" value="<%=memBean.getNo() %>">
		<font size="5">프로필</font><p>
		<%if(upchek!=null){
					if(upchek.equals("true")){%>
						<hr><font color="green" size="4"><b>고객님의 개인 정보가 정정되었습니다.<br>
						</b></font><hr><p>
						<%
					}
			}%>
		<table>
			<tr>
				<td colspan="2">
					<font size="3"><b>로그인을 위한 이 메일 (로그인 ID)/비밀번호 변경</b></font><p>
						이메일 주소가 고객님의 새로운 로그인 ID로 사용됩니다. 보안을 위하여, 이메일 주소는 비밀번호와 함께 변경되어야 합니다.<p>
						(*) 되어 있는 칸을 채워 주세요.
				</td>
			</tr>
			
			<tr>
				<td width="40%" align="right">이메일주소</td>
				<td  align="left"><%=memBean.getEmail() %></td>
			</tr>
			
			<!-- <tr>
				<td width="20%" align="right">새로운 이메일주소*</td>
				<td><input type="text" name="email"></td>
			</tr>
			
			<tr>
				<td width="20%" align="right">이메일주소 확인*</td>
				<td><input type="text" name="emailchk"></td>
			</tr> -->
			
			<tr>
				<td width="40%" align="right">기존 비밀번호*</td>
				<td align="left"><input type="password" name="oldpass"></td>
			</tr>
			
			<tr>
				<td width="40%" align="right">새로운 비밀번호*</td>
				<td align="left"><input type="password" name="pass"></td>
			</tr>
			
			<tr>
				<td width="40%" align="right">비밀번호 확인*</td>
				<td align="left"><input type="password" name="passchk"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
				<a href="javascript:memform.submit()" ><font size="5">변경된 내용 저장>></font></a>
				</td>
			</tr>	
		</table>
		<table>
			<tr>
				<td colspan="2">
					<font size="3"><b>주소를 변경하시고, 뉴스레터 구독을 신청하세요.</b></font><p>
						(*) 되어 있는 칸을 채워 주세요.
				</td>
			</tr>
			<tr>
				<td width="40%" align="right"><b>Last name(성) *</b></td>
				<td align="left"><input type="text" name="lastname"  value="<%=memBean.getLastname() %>"></td>
			</tr>
			<tr>
				<td width="40%" align="right"><b>First name(명) *</b></td>
				<td align="left"><input type="text" name="firstname"  value="<%=memBean.getFirstname() %>"></td>
			</tr>
			<tr>
				<td width="40%" align="right">우편번호 *</td>
				<td align="left"><input type="text" name="addnum"  value="<%=memBean.getAddnum() %>"></td>
			</tr>
			<tr>
				<td width="40%" align="right">시/도 *</td>
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
					</select><br>
				<script>document.memform.addcity.value="<%=memBean.getAddcity()%>"</script>
				</td>
			</tr>
			<tr>
				<td width="40%" align="right">시/군/구/동 *</td>
				<td align="left"><input type="text" name="addtown"  value="<%=memBean.getAddtown() %>"></td>
			</tr>
			<tr>
				<td width="40%" align="right">상세주소 *</td>
				<td align="left"><input type="text" name="adddetail"  value="<%=memBean.getAdddetail() %>"></td>
			</tr>
			<tr>
				<td  width="40%" align="right">핸드폰번호 *</td>
				<td align="left"><input type="text" name="phon"  value="<%=memBean.getPhon() %>"></td>
			</tr>
			<tr>
				<td width="40%" align="right">
					전화번호 * <br>
				</td>
				<td align="left">
					<input type="text" name="tell"><br>
				</td>
			</tr>
			<tr>
				<td width="40%" align="right">
					생년월일 <br>
				</td>
				<td align="left">
					<input type="text" name="birdate" value="DD" size="5">
					<input type="text" name="birmonth" value="MM" size="5">
					<input type="text" name="biryear" value="YYYY" size="5"><br>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<a href="javascript:memform.submit()" ><font size="5">변경된 내용 저장>></font></a>
				</td>
			</tr>	
		</table>
	</form>
</body>
</html>