<%@ page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="memMgr" class="myShop.member.action.MemberDAO" />    <!-- ch14.MemberMgrŬ������ id->memMgr�� bean��ü�� ���. -->
<jsp:useBean id="regBean" class="myShop.member.db.MemberBean" /> <!--  ch14.RegisterBeanŬ������ id->regBean�� bean��ü�� ���. ::  -->
<!-- registerbean�� ȸ���� ���νŻ������� ���� �Ӽ� �� getter�� setter�� ������ �ִ�  class�̴�. -->
<jsp:setProperty name="regBean" property="*" />   <!--Bean::(regBean:RegisterBean)�� ��� �Ӽ���  ����-->
<%
    boolean flag = memMgr.memberUpdate(regBean);  // ������������ ���θ� flag�� ���� (true, false)
%>

<%
if(flag){ 
%>
		<script>
		alert("���������� �����Ͽ����ϴ�");  //���������� �����Ǿ��� ���.
		location.href="../mainPage/Index.jsp"; //index.jsp page�� ȭ�� �̵� (�α��� ȯ������(���),ī�װ�,��ǰ���)
		</script>
<%
	}else{
%>
		<script>
		alert("�������� ������ �߻��Ͽ����ϴ�."); //�����Ͽ��� ���
		history.back(); //����â���� �̵�
		</script>

<%
	  }
%>


