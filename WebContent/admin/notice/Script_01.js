function notice_form() {

	var errchek = true;

	if (document.form1.gb_title.value == "") {
		err_title.innerHTML = "<font color='red'><b>���� �Է��ϼ���.</b></font>";
		errchek = false;

	} else {
		err_title.innerHTML = "";
	}
	if (document.form1.gb_name.value == "") {
		err_name.innerHTML = "<font color='red'><b>�̸��� �Է��ϼ���.</b> </font>";
		errchek = false;
	} else {
		err_name.innerHTML = "";
	}
	if (document.form1.gb_passwd.value == "") {
		err_pass.innerHTML = "<font color='red'><b>��й�ȣ �� �Է��ϼ���.</b> </font>";
		errchek = false;
	} else {
		err_pass.innerHTML = "";
	}

	if (errchek) {
		document.form1.submit();

	}
}