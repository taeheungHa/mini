	function zipCheck(){
		url="ZipCheck.jsp?check=y";
		window.open(url,"post","toolbar=no ,width=500 ,height=300 ,directories=no,status=yes,scrollbars=yes,menubar=no");
	}
	function emailcheck(){
		copyemail.innerHTML=document.regform.email.value;
	}
	
	function loginCheck() {
		var errflag=false;
		if(document.loginform.email.value==""){
			errflag=true;
		}
		if(document.loginform.pass.value==""){
			errflag=true;
		}
		if(errflag){
			err_login.innerHTML=
				"<font color='red'><b>(*) ĭ�� ä���ּ���.</b></font>";
			errflag=false;
		}
		if(document.loginform.email.value!="" && document.loginform.pass.value!=""){
			document.loginform.submit();
		}
	}
	
	function passemailCheck() {
		if(document.passform.email.value==""){
			err_passemail.innerHTML=
				"<font color='red'><b>�̸��� - �̸��� �ּҸ� �Է��ϼ���.</b></font>";
		}else{
			document.passform.submit();
		}
	}
	
	function inputCheck(){
		var errchek = false;
		var errchek2 = false;
		var errchek3 = false;
		
		if(document.regform.lastname.value==""){
			err_lastname.innerHTML=
			"<font color='red'><b><li>Last name(��)</b>  Last name(��)�� �Է��ϼ���.</font>";
			errchek = true;
		}else{
			err_lastname.innerHTML="";
		}
		
		if(document.regform.firstname.value==""){
			err_firstname.innerHTML=
			"<font color='red'><b><li>First name(��)</b>  First name(��)�� �Է��ϼ���.</font>";
			errchek = true;
		}else{
			err_firstname.innerHTML="";
		}
		
		if(document.regform.adddetail.value==""){
			err_adddetail.innerHTML=
			"<font color='red'><b><li>���ּ�:</b> ���ּҸ� �Է��ϼ���. </font>";
			errchek = true;
		}
		else{
			err_adddetail.innerHTML="";
		}
		
		if(document.regform.addnum.value==""){
			err_addnum.innerHTML=
			"<font color='red'><b><li>�����ȣ</b>  �����ȣ �Է� ��) 123-456 ���� (�����ȣ �� 3�ڸ��� �� 3�ڸ� ���̿� `-��(������)�� �Է�)</font>";
			errchek = true;
		}else{
			err_addnum.innerHTML="";
		}
		
		if(document.regform.addtown.value==""){
			err_addtown.innerHTML=
			"<font color='red'><b><li>��/��/��/��:</b> ��/��/��/���� �Է��ϼ���.</font>";
			errchek = true;
		}else{
			err_addtown.innerHTML="";
		}
		
		if(document.regform.addcity.value==""){
			err_addcity.innerHTML=
			"<font color='red'><b><li>��/��:</b>  ��/���� �Է��ϼ���.</font>";
			errchek = true;
		}else{
			err_addcity.innerHTML="";
		}
		
		if(document.regform.email.value==""){
			err_email.innerHTML=
			"<font color='red'><b><li>�̸����ּ�  </b>  �̸����� �Է��ϼ���.</font>";
			errchek = true;
		}else{
			err_email.innerHTML="";
		}
		
		if(document.regform.phon.value==""){
			err_phon.innerHTML=
			"<font color='red'><b><li>�ڵ�����ȣ:</b>    �ڵ�����ȣ�� �Է��ϼ���.</font>";
			errchek = true;
		}else{
			err_phon.innerHTML="";
			errchek3=true;
		}
		
		if(document.regform.email.value!=document.regform.emailchk.value){
			err_emailmacth.innerHTML=
			"<font color='red'><b>�̸����ּҿ� '�̸��� �ּ� Ȯ��'�� ��ġ���� �ʽ��ϴ�. �ٽ� �õ��� �ּ���.</b></font>";
			errchek = true;
		}else{
			err_emailmacth.innerHTML="";
			errchek3=true;
		}
		
		if(errchek){
			err_msg.innerHTML=
				"<font color='red' size='3'>���̶���Ʈ�� �ʵ带 ������ �ּ���.</font>";
				errchek = false;
		}else{
			err_msg.innerHTML="";
		}
		
		if(document.regform.pass.value==""){
			err_pass.innerHTML=
			"<font color='red'><b>��й�ȣ </b> ��й�ȣ�� �Է��ϼ���.</font>";
			errchek2 = true;
		}else{
			err_pass.innerHTML="";
		}
		
		if(document.regform.passchk.value==""){
			err_passchk.innerHTML=
			"<font color='red'><b>��й�ȣ ��Ȯ�� </b> ��й�ȣ�� Ȯ���ϼ���.</font>";
			errchek2 = true;
		}else{
			err_passchk.innerHTML="";
		}
		
		if(document.regform.pass.value!=document.regform.passchk.value){
			err_passmacth.innerHTML=
			"<font color='red'><b>��й�ȣ�� ���� ��ġ���� �ʽ��ϴ�. �ٽ� �Է��ϼ���.</b></font>";
			errchek2 = true;
		}else{
			err_passmacth.innerHTML="";
		}
		
		if(errchek2){
			err_msg2.innerHTML=
				"<font color='red' size='3'>��� 5�� �̻��� ���ڸ� �Է��ϼ���.<br>Ư�����ڴ� ����� �� �����ϴ�.</font>";
				errchek2 = false;
		}else{
			err_msg2.innerHTML="";
			if(errchek3){
				document.regform.submit();
			}
		}
		
	}