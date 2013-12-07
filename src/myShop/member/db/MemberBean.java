package myShop.member.db;

public class MemberBean {
	
	int no;// number,
	String lastname;// varchar2(9),
	String firstname;// varchar2(15),
	String addnum;// varchar2(7),
	String addcity;// number,
	String addtown;// varchar2(20),
	String adddetail;// varchar2(50),
	String email;// varchar2(30),
	String phon;// varchar2(13),
	String tell;// varchar2(13),
	String birdate;// varchar2(2),
	String birmonth;// varchar2(2),
	String biryear;// varchar2(4),
	String pass;// varchar2(20),
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getAddnum() {
		return addnum;
	}
	public void setAddnum(String addnum) {
		this.addnum = addnum;
	}
	public String getAddcity() {
		return addcity;
	}
	public void setAddcity(String addcity) {
		this.addcity = addcity;
	}
	public String getAddtown() {
		return addtown;
	}
	public void setAddtown(String addtown) {
		this.addtown = addtown;
	}
	public String getAdddetail() {
		return adddetail;
	}
	public void setAdddetail(String adddetail) {
		this.adddetail = adddetail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhon() {
		return phon;
	}
	public void setPhon(String phon) {
		this.phon = phon;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getBirdate() {
		return birdate;
	}
	public void setBirdate(String birdate) {
		this.birdate = birdate;
	}
	public String getBirmonth() {
		return birmonth;
	}
	public void setBirmonth(String birmonth) {
		this.birmonth = birmonth;
	}
	public String getBiryear() {
		return biryear;
	}
	public void setBiryear(String biryear) {
		this.biryear = biryear;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
