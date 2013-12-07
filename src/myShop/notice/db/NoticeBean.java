package myShop.notice.db;
import java.util.*;

// 방명록 테이블 구조와 동일한 데이터 처리 클래
public class NoticeBean {
	//멤버변수
	private int gb_id; //NUMBER	
	private String gb_name;//varchar2(10)
	private String gb_title;//varchar2(100)
	private Date gb_date;//date
	private String gb_passwd;//varchar2(10)
	private String gb_contents;//varchar2(2000)
	
	
	public Date getGb_date() {
		return gb_date;
	}

	public void setGb_date(Date gb_date) {
		this.gb_date = gb_date;
	}

	
	public NoticeBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	//setter,getter--------
	
	public int getGb_id() {
		return gb_id;
	}

	public void setGb_id(int gb_id) {
		this.gb_id = gb_id;
	}

	public String getGb_name() {
		return gb_name;
	}

	public void setGb_name(String gb_name) {
		this.gb_name = gb_name;
	}

	public String getGb_title() {
		return gb_title;
	}

	public void setGb_title(String gb_title) {
		this.gb_title = gb_title;
	}

	public String getGb_passwd() {
		return gb_passwd;
	}

	public void setGb_passwd(String gb_passwd) {
		this.gb_passwd = gb_passwd;
	}

	public String getGb_contents() {
		return gb_contents;
	}

	public void setGb_contents(String gb_contents) {
		this.gb_contents = gb_contents;
	}
	
	
}
