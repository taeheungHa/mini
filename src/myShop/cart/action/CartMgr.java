package myShop.cart.action;

import java.util.Hashtable;

import myShop.order.db.OrderBean;


public class CartMgr {
	private String test2;
    private Hashtable hCart = new Hashtable();
    private String test;
    public CartMgr() {
    }

    public void addCart(OrderBean order) {      //주문에 감긴 상품번호가 테이블(장바구니)의 키 역할(주문 구분)
        String product_no = order.getProduct_no();  // getProduct_no 객체 생성
        int quantity = order.getQuantity();
        if (quantity > 0) {  //상품의 중복검사
            if (hCart.containsKey(product_no)) {
            	OrderBean tempOrder = (OrderBean) hCart.get(product_no);
                quantity += tempOrder.getQuantity(); // 저장된 상품 수량과 추가 수량 더하기
                tempOrder.setQuantity(quantity);
                hCart.put(product_no, tempOrder);
            } else {
                hCart.put(product_no, order);
            }
        }
    }

    public Hashtable getCartList() {  //장바구니 값  반환
        return hCart;
    }

    public void updateCart(OrderBean order) {   //장바구니 업데이트
        String product_no = order.getProduct_no();
        hCart.put(product_no, order);
    }


    public void deleteCart(OrderBean order) {
        String product_no = order.getProduct_no();
        hCart.remove(product_no);  //주문한 상품 번호를 키 값으로 삭제
    }

}