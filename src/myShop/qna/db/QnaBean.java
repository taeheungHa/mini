package myShop.qna.db;

import java.sql.Date;

public class QnaBean {

	private int gb_num;
	private String gb_name;
	private String gb_passwd;
	private String gb_title;
	private String gb_contents;
	private Date gb_date;
	private int gb_readcnt;
	private String gb_file;
	private int gb_re_ref;
	private int gb_re_lev;
	private int gb_re_seq;
	
	public int getGb_num() {
		return gb_num;
	}
	public void setGb_num(int gb_num) {
		this.gb_num = gb_num;
	}
	public String getGb_name() {
		return gb_name;
	}
	public void setGb_name(String gb_name) {
		this.gb_name = gb_name;
	}
	public String getGb_passwd() {
		return gb_passwd;
	}
	public void setGb_passwd(String gb_passwd) {
		this.gb_passwd = gb_passwd;
	}
	public String getGb_title() {
		return gb_title;
	}
	public void setGb_title(String gb_title) {
		this.gb_title = gb_title;
	}
	public String getGb_contents() {
		return gb_contents;
	}
	public void setGb_contents(String gb_contents) {
		this.gb_contents = gb_contents;
	}
	public Date getGb_date() {
		return gb_date;
	}
	public void setGb_date(Date gb_date) {
		this.gb_date = gb_date;
	}
	public int getGb_readcnt() {
		return gb_readcnt;
	}
	public void setGb_readcnt(int gb_readcnt) {
		this.gb_readcnt = gb_readcnt;
	}
	public String getGb_file() {
		return gb_file;
	}
	public void setGb_file(String gb_file) {
		this.gb_file = gb_file;
	}
	public int getGb_re_ref() {
		return gb_re_ref;
	}
	public void setGb_re_ref(int gb_re_ref) {
		this.gb_re_ref = gb_re_ref;
	}
	public int getGb_re_lev() {
		return gb_re_lev;
	}
	public void setGb_re_lev(int gb_re_lev) {
		this.gb_re_lev = gb_re_lev;
	}
	public int getGb_re_seq() {
		return gb_re_seq;
	}
	public void setGb_re_seq(int gb_re_seq) {
		this.gb_re_seq = gb_re_seq;
	}
	@Override
	public String toString() {
		return "QnaBean [gb_num=" + gb_num + ", gb_name=" + gb_name
				+ ", gb_passwd=" + gb_passwd + ", gb_title=" + gb_title
				+ ", gb_contents=" + gb_contents + ", gb_date=" + gb_date
				+ ", gb_readcnt=" + gb_readcnt + ", gb_file=" + gb_file
				+ ", gb_re_ref=" + gb_re_ref + ", gb_re_lev=" + gb_re_lev
				+ ", gb_re_seq=" + gb_re_seq + "]";
	}
	
	
}
