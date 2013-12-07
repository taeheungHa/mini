package myShop.delivery.db;


public class DeliveryBean {

    private String dno = null;
	private String account;//결제계좌
	private String deliveryName;//배송지
	private String deliveryTel ;//배송지 전화번호
	private String deliveryAddress;//배송지 주소

	
	//setter,getter--------
	
    public String getNo() {
        return dno;
    }

    public void setNo(String no) { 
        this.dno = no;
    }

    public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getDeliveryName() {
		return deliveryName;
	}
	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}
	public String getDeliveryTel() {
		return deliveryTel;
	}
	public void setDeliveryTel(String deliveryTel) {
		this.deliveryTel = deliveryTel;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
}
