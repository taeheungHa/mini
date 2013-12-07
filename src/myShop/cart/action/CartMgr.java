package myShop.cart.action;

import java.util.Hashtable;

import myShop.order.db.OrderBean;


public class CartMgr {
	private String test2;
    private Hashtable hCart = new Hashtable();
    private String test;
    public CartMgr() {
    }

    public void addCart(OrderBean order) {      //�ֹ��� ���� ��ǰ��ȣ�� ���̺�(��ٱ���)�� Ű ����(�ֹ� ����)
        String product_no = order.getProduct_no();  // getProduct_no ��ü ����
        int quantity = order.getQuantity();
        if (quantity > 0) {  //��ǰ�� �ߺ��˻�
            if (hCart.containsKey(product_no)) {
            	OrderBean tempOrder = (OrderBean) hCart.get(product_no);
                quantity += tempOrder.getQuantity(); // ����� ��ǰ ������ �߰� ���� ���ϱ�
                tempOrder.setQuantity(quantity);
                hCart.put(product_no, tempOrder);
            } else {
                hCart.put(product_no, order);
            }
        }
    }

    public Hashtable getCartList() {  //��ٱ��� ��  ��ȯ
        return hCart;
    }

    public void updateCart(OrderBean order) {   //��ٱ��� ������Ʈ
        String product_no = order.getProduct_no();
        hCart.put(product_no, order);
    }


    public void deleteCart(OrderBean order) {
        String product_no = order.getProduct_no();
        hCart.remove(product_no);  //�ֹ��� ��ǰ ��ȣ�� Ű ������ ����
    }

}