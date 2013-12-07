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
				"<font color='red'><b>(*) 칸을 채워주세요.</b></font>";
			errflag=false;
		}
		if(document.loginform.email.value!="" && document.loginform.pass.value!=""){
			document.loginform.submit();
		}
	}
	
	function passemailCheck() {
		if(document.passform.email.value==""){
			err_passemail.innerHTML=
				"<font color='red'><b>이메일 - 이메일 주소를 입력하세요.</b></font>";
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
			"<font color='red'><b><li>Last name(성)</b>  Last name(성)을 입력하세요.</font>";
			errchek = true;
		}else{
			err_lastname.innerHTML="";
		}
		
		if(document.regform.firstname.value==""){
			err_firstname.innerHTML=
			"<font color='red'><b><li>First name(명)</b>  First name(명)을 입력하세요.</font>";
			errchek = true;
		}else{
			err_firstname.innerHTML="";
		}
		
		if(document.regform.adddetail.value==""){
			err_adddetail.innerHTML=
			"<font color='red'><b><li>상세주소:</b> 상세주소를 입력하세요. </font>";
			errchek = true;
		}
		else{
			err_adddetail.innerHTML="";
		}
		
		if(document.regform.addnum.value==""){
			err_addnum.innerHTML=
			"<font color='red'><b><li>우편번호</b>  우편번호 입력 예) 123-456 서울 (우편번호 앞 3자리와 뒤 3자리 사이에 `-´(하이픈)을 입력)</font>";
			errchek = true;
		}else{
			err_addnum.innerHTML="";
		}
		
		if(document.regform.addtown.value==""){
			err_addtown.innerHTML=
			"<font color='red'><b><li>시/군/구/동:</b> 시/군/구/동을 입력하세요.</font>";
			errchek = true;
		}else{
			err_addtown.innerHTML="";
		}
		
		if(document.regform.addcity.value==""){
			err_addcity.innerHTML=
			"<font color='red'><b><li>시/도:</b>  시/도를 입력하세요.</font>";
			errchek = true;
		}else{
			err_addcity.innerHTML="";
		}
		
		if(document.regform.email.value==""){
			err_email.innerHTML=
			"<font color='red'><b><li>이메일주소  </b>  이메일을 입력하세요.</font>";
			errchek = true;
		}else{
			err_email.innerHTML="";
		}
		
		if(document.regform.phon.value==""){
			err_phon.innerHTML=
			"<font color='red'><b><li>핸드폰번호:</b>    핸드폰번호를 입력하세요.</font>";
			errchek = true;
		}else{
			err_phon.innerHTML="";
			errchek3=true;
		}
		
		if(document.regform.email.value!=document.regform.emailchk.value){
			err_emailmacth.innerHTML=
			"<font color='red'><b>이메일주소와 '이메일 주소 확인'이 일치하지 않습니다. 다시 시도해 주세요.</b></font>";
			errchek = true;
		}else{
			err_emailmacth.innerHTML="";
			errchek3=true;
		}
		
		if(errchek){
			err_msg.innerHTML=
				"<font color='red' size='3'>하이라이트된 필드를 정정해 주세요.</font>";
				errchek = false;
		}else{
			err_msg.innerHTML="";
		}
		
		if(document.regform.pass.value==""){
			err_pass.innerHTML=
			"<font color='red'><b>비밀번호 </b> 비밀번호를 입력하세요.</font>";
			errchek2 = true;
		}else{
			err_pass.innerHTML="";
		}
		
		if(document.regform.passchk.value==""){
			err_passchk.innerHTML=
			"<font color='red'><b>비밀번호 재확인 </b> 비밀번호를 확인하세요.</font>";
			errchek2 = true;
		}else{
			err_passchk.innerHTML="";
		}
		
		if(document.regform.pass.value!=document.regform.passchk.value){
			err_passmacth.innerHTML=
			"<font color='red'><b>비밀번호가 서로 일치하지 않습니다. 다시 입력하세요.</b></font>";
			errchek2 = true;
		}else{
			err_passmacth.innerHTML="";
		}
		
		if(errchek2){
			err_msg2.innerHTML=
				"<font color='red' size='3'>적어도 5개 이상의 문자를 입력하세요.<br>특수문자는 사용할 수 없습니다.</font>";
				errchek2 = false;
		}else{
			err_msg2.innerHTML="";
			if(errchek3){
				document.regform.submit();
			}
		}
		
	}