package myShop.category.db;

public class CategoryBean {
	private String cnum;
	private String code;
	private String cname;
	
	public CategoryBean(){
	}//기본 생성자-------

	public CategoryBean(String cnum, String code,
			String cname) {
		super();
		this.cnum = cnum;
		this.code = code;
		this.cname = cname;
	}//인자 생성자--------
  
	//setter,getter--------
	
	
	public String getCnum() {  
		return cnum;
	}
	public void setCnum(String cnum) {  
		this.cnum = cnum; 
	}
	public String getCode() { 
		return code;
	}
	public void setCode(String code) {   
		this.code = code;
	}
	public String getCname() { 
		return cname;
	}
	public void setCname(String cname) {  
		this.cname = cname;
	}
}