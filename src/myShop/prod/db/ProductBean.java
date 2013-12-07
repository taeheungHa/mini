package myShop.prod.db;


public class ProductBean {
	//¸â¹öº¯¼ö
    private int no;
    private String code = null;;
    private String name = null;
    private String model = null;
    private String price = null;
    private String pspec;
    private String pbrand;
    private String detail = null;
    private String date = null;
    private String stock = null;
    private String image = null;
    

    public ProductBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public ProductBean(int no, String code, String name, String model, String price,
			String pspec, String pbrand, String detail, String date, String stock, String image) {
		super();
		this.no = no;
		this.code = code;
		this.name = name;
		this.model = model;
		this.price = price;
		this.pspec = pspec;
		this.pbrand = pbrand;
		this.detail = detail;
		this.date = date;
		this.stock = stock;
		this.image = image;
	}


	//setter,getter--------
	
	
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPbrand() {
		return pbrand;
	}

	public void setPbrand(String pbrand) {
		this.pbrand = pbrand;
	}

	public String getPspec() {
		return pspec;
	}

	public void setPspec(String pspec) {
		this.pspec = pspec;
	}	
	
	public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }    
    
    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
