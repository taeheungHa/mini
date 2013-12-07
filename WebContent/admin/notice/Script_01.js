function notice_form() {

	var errchek = true;

	if (document.form1.gb_title.value == "") {
		err_title.innerHTML = "<font color='red'><b>제목 입력하세요.</b></font>";
		errchek = false;

	} else {
		err_title.innerHTML = "";
	}
	if (document.form1.gb_name.value == "") {
		err_name.innerHTML = "<font color='red'><b>이름을 입력하세요.</b> </font>";
		errchek = false;
	} else {
		err_name.innerHTML = "";
	}
	if (document.form1.gb_passwd.value == "") {
		err_pass.innerHTML = "<font color='red'><b>비밀번호 를 입력하세요.</b> </font>";
		errchek = false;
	} else {
		err_pass.innerHTML = "";
	}

	if (errchek) {
		document.form1.submit();

	}
}