package myShop.order.action;


import java.sql.*;
import java.util.Vector;

import myShop.common.conn.DBConnectionMgr;
import myShop.delivery.db.DeliveryBean;
import myShop.order.db.OrderBean;




public class OrderMgr {

    private DBConnectionMgr pool = null;


    public OrderMgr() {
        try {
            pool = DBConnectionMgr.getInstance(); //커넥션 가져오기 
        } catch (Exception e) {
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
    }

//Tx : 주문(order)->결제(order2)->베송(order2)->구매종료
    
    
    
    public void insertOrder(OrderBean order, DeliveryBean order2) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = pool.getConnection();       //연결얻음.
            con.setAutoCommit(false);  //트랜잭션 시작지점
            String query = "insert into mini_order" //sql문
                    + " values(moseq.nextval,?,?,sysdate,? ,?,mdseq.nextval)";
            pstmt = con.prepareStatement(query); //sql문 setting.
            pstmt.setString(1, order.getProduct_no()); //sql문의 ?들에 각각의 순서에 맞게 주문정보 객체의 정보를 set한다.
            pstmt.setInt(2, order.getQuantity());
            pstmt.setString(3, "1");
            pstmt.setString(4, order.getId());
            pstmt.executeUpdate();
            
            
            query = "insert into mini_delivery"        
                + " values(mdseq.currval,?,? ,?,?)";  //sql문(삽입문)
            pstmt = con.prepareStatement(query);      //query문 setting.
            pstmt.setString(1, order2.getAccount());          //계좌
            pstmt.setString(2, order2.getDeliveryName());     //배달되는 이름
            pstmt.setString(3, order2.getDeliveryTel());     //전화번호
            pstmt.setString(4, order2.getDeliveryAddress());  //주소등을 각각의? 순서에 맞게 setting
            pstmt.executeUpdate(); //실행
            con.commit();  //트랜잭션 종료지점 - > 두개의 query문이므로 transaction으로 묶어 실행.
            con.setAutoCommit(true); //자동 commit - > true,
        } catch (Exception ex) {
        	try {
				con.commit();         
			} catch (SQLException e) {
				e.printStackTrace();
			}
            System.out.println("Exception :" + ex);   //예외처리
        } finally {
        	try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
            pool.freeConnection(con, pstmt);    //자원반납
        }
    }

    /////////////////////////////////////////////////////////////해당 배달 번호에 따른 계좌번호와 주소값을 가져옴.
    public DeliveryBean getDelivery(String no){ //return type:DeliveryBean type:배달정보 class 타입으로 bean객체 생성
    	 Connection con = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         DeliveryBean delivery = null;

         try {   
             con = pool.getConnection();     //연결얻음
             String query = "select * from mini_delivery where dno=?"; //sql문
             pstmt = con.prepareStatement(query); //sql문 setting.
             pstmt.setString(1, no); //sql문의 ?에 인자값으로 받은 no를 대입
             rs = pstmt.executeQuery(); // sql문 실행

             if (rs.next()) { //sql문의 결과값이 있을 경우 table에 커서이동.
            	 delivery = new DeliveryBean(); //DeliveryBean type 객체생성
            	  pstmt.setString(1, no);        
            	 delivery.setAccount(rs.getString("account")); //해당 배달 번호의 계좌값을 얻어 bean객체에 setting.
            	 delivery.setDeliveryAddress(rs.getString("delivery_addr")); //해당 배달 번호의 주소를 얻어 bean객체에 setting.
             } 
         } catch (Exception ex) {
             System.out.println("Exception :" + ex); //예외처리
         } finally {
             pool.freeConnection(con, pstmt, rs); //자원반납
         }
         return delivery; //bean객체 반환
    	
    }
    
    ///////////////////////////////////////////////////
    public Vector getOrder(String id) {	//특정 회원(id) 주문내역 
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vResult = new Vector(); //Vector객체 생성

        try {
            con = pool.getConnection(); //연결 얻음
            String query = "select * from mini_order where id = ? order by no desc"; //sql문
            pstmt = con.prepareStatement(query); //sql문 setting.
            pstmt.setString(1, id); //?에 id값 대입
            rs = pstmt.executeQuery();  //실행
            while (rs.next()) { //커서이동
                OrderBean order = new OrderBean(); //주문정보bean객체 (order)생성
                order.setId(id); //
                order.setQuantity(rs.getInt("quantity")); //id에 따른 각각의 속성에 대한 값을 가져와 order 빈객체에 setting.
                order.setDate(rs.getString("odate"));
                order.setNo(rs.getString("no"));
                order.setState(rs.getString("state"));
                order.setProduct_no(rs.getString("product_no"));
                order.setDno(rs.getString("dno"));
                vResult.add(order); //vector에 id에 따른 주문내역을 add
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex); //예외처리
        } finally { 
            pool.freeConnection(con, pstmt, rs); //자원반납
        }
        return vResult; //Vector값 return. 
        ////////////////////////////// - > id에 따라 주문항목 add되는 것.
    }


    public Vector getOrderList() {	//모든 주문 내역 목록
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vResult = new Vector(); //Vector생성

        try {
            con = pool.getConnection();   //연결얻음
            String query = "select * from mini_order order by no desc"; //sql문
            stmt = con.createStatement(); 
            rs = stmt.executeQuery(query); //sql문 실행
            while (rs.next()) {  //결과 table 커서이동
                OrderBean order = new OrderBean();   //Bean객체 생성(order)
                order.setId(rs.getString("id"));     //결과로 얻은 table값에서 각각의 속성에 맞는 값을 가져와서 다시
                                                     //order객체에 setting.
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("odate"));
                order.setNo(rs.getString("no"));
                order.setState(rs.getString("state"));
                order.setProduct_no(rs.getString("product_no"));
                order.setDno(rs.getString("dno"));
                vResult.add(order); //vector에 값이 setting된 객체 add
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);   //예외처리
        } finally {
            pool.freeConnection(con, stmt, rs); //자원반납
        }
        return vResult; //sql문을 통해 얻은 객체가 adding 되어 있는 vector 반환.
    }


    public OrderBean getOrderDetail(String no) {	//특정 주문(no) 에 대한 주문 상세정보 리턴
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        OrderBean order = null;  //주문내역 bean선언

        try {
            con = pool.getConnection();     //연결얻음
            String query = "select * from mini_order where no = ?"; //sql문::
            pstmt = con.prepareStatement(query); //setting
            pstmt.setString(1, no); //?에 인자값 대입
            rs = pstmt.executeQuery(); //sql문 실행
 
            if (rs.next()) { //sql 결과 table에서 커서이동
                order = new OrderBean(); // 주문내역 bean 객체 생성
                order.setId(rs.getString("id"));     //table결과 값으로 부터 각각의 속성에 대한 값들을 가져와 
                                                     //주문내역 bean에 set
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("odate"));
                order.setNo(rs.getString("no"));
                order.setState(rs.getString("state"));
                order.setProduct_no(rs.getString("product_no"));
                order.setDno(rs.getString("dno"));
            }
        } catch (Exception e) {
            System.out.println("Exception :" + e);  //예외처리
        } finally { 
            pool.freeConnection(con, pstmt, rs); //자원반납
        }
        return order; //주문 상세 내역이 저장된 객체bean이 return.
    }


    public boolean updateOrder(String no, String state) {	//주문상태 (배송준비->배송중)
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false; 
        try {
            con = pool.getConnection(); //연결얻음
            String query = "update mini_order set state = ? where no = ?"; //sql문
            pstmt = con.prepareStatement(query); //setting
            pstmt.setString(1, state);  //?에 method 인자로 받은 String type = > state와 no 대입
            pstmt.setString(2, no);
            int count = pstmt.executeUpdate(); //sql문 실행
            if (count == 1)
            	result = true;  //sql문이 수행된 갯수가 1개이면 -> sql문 성공이면 result를 true로 ~!! (sql문 성공여부)
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);  //예외처리
        } finally {
            pool.freeConnection(con, pstmt); //자원반납
        }
        return result; //sql문의 정상 성공여부를 return. (주문 성공 -> true, 주문 성공 x ->false)
    }


    public boolean deleteOrder(String no) throws SQLException {	//주문삭제
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();        //연결얻음
            String query = "delete from mini_order where no = ?"; //sql문
            pstmt = con.prepareStatement(query); //sql문 setting.
            pstmt.setString(1, no); //?에 인자값으로 받은 no setting.
            int count = pstmt.executeUpdate();//sql문 실행
            if (count == 1) result = true; //sql 정상 성공시(주문 정상 삭제시) - > true 
        } catch (Exception e) {
            System.out.println("Exception :" + e); //예외처리
        } finally {
            pool.freeConnection(con, pstmt); //자원반납
        } 
        return result; //주문 정상 삭제 여부를 return 해주는 method.
    }

    public Vector getAccount(){		//결제계좌 정보 목록
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector accountList = null;  //Vector 선언
        try {
            con = pool.getConnection();  //연결얻음
                        
            pstmt = con.prepareStatement("select * from mini_bank"); //sql문
            rs = pstmt.executeQuery(); //sql문 실행
            
            accountList = new Vector(); //accountList라는 vector 객체 생성
            String account=null; 
            while (rs.next()) { //sql 수행 결과문이 있으면 커서이동
           	 account = new String(rs.getString("account")+" "+ rs.getString("bank")+" "+rs.getString("name"));
           	 accountList.addElement(account); //vector에 string객체를 add
			 }
          //sql문 수행 결과 table로 부터 얻은 계좌,은행,이름정보를 새로운 String 객체(wrapper)로 생성.
        }catch(Exception ex) {
        	ex.printStackTrace();
        } finally {
        	   pool.freeConnection(con, pstmt, rs); //자원반납
        }
        return accountList; //결제계좌 정보 목록의 정보를  가지는 vector return.
    }
}
