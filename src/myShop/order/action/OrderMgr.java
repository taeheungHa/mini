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
            pool = DBConnectionMgr.getInstance(); //Ŀ�ؼ� �������� 
        } catch (Exception e) {
            System.out.println("Error : Ŀ�ؼ� �������� ����!!");
        }
    }

//Tx : �ֹ�(order)->����(order2)->����(order2)->��������
    
    
    
    public void insertOrder(OrderBean order, DeliveryBean order2) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = pool.getConnection();       //�������.
            con.setAutoCommit(false);  //Ʈ����� ��������
            String query = "insert into mini_order" //sql��
                    + " values(moseq.nextval,?,?,sysdate,? ,?,mdseq.nextval)";
            pstmt = con.prepareStatement(query); //sql�� setting.
            pstmt.setString(1, order.getProduct_no()); //sql���� ?�鿡 ������ ������ �°� �ֹ����� ��ü�� ������ set�Ѵ�.
            pstmt.setInt(2, order.getQuantity());
            pstmt.setString(3, "1");
            pstmt.setString(4, order.getId());
            pstmt.executeUpdate();
            
            
            query = "insert into mini_delivery"        
                + " values(mdseq.currval,?,? ,?,?)";  //sql��(���Թ�)
            pstmt = con.prepareStatement(query);      //query�� setting.
            pstmt.setString(1, order2.getAccount());          //����
            pstmt.setString(2, order2.getDeliveryName());     //��޵Ǵ� �̸�
            pstmt.setString(3, order2.getDeliveryTel());     //��ȭ��ȣ
            pstmt.setString(4, order2.getDeliveryAddress());  //�ּҵ��� ������? ������ �°� setting
            pstmt.executeUpdate(); //����
            con.commit();  //Ʈ����� �������� - > �ΰ��� query���̹Ƿ� transaction���� ���� ����.
            con.setAutoCommit(true); //�ڵ� commit - > true,
        } catch (Exception ex) {
        	try {
				con.commit();         
			} catch (SQLException e) {
				e.printStackTrace();
			}
            System.out.println("Exception :" + ex);   //����ó��
        } finally {
        	try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
            pool.freeConnection(con, pstmt);    //�ڿ��ݳ�
        }
    }

    /////////////////////////////////////////////////////////////�ش� ��� ��ȣ�� ���� ���¹�ȣ�� �ּҰ��� ������.
    public DeliveryBean getDelivery(String no){ //return type:DeliveryBean type:������� class Ÿ������ bean��ü ����
    	 Connection con = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         DeliveryBean delivery = null;

         try {   
             con = pool.getConnection();     //�������
             String query = "select * from mini_delivery where dno=?"; //sql��
             pstmt = con.prepareStatement(query); //sql�� setting.
             pstmt.setString(1, no); //sql���� ?�� ���ڰ����� ���� no�� ����
             rs = pstmt.executeQuery(); // sql�� ����

             if (rs.next()) { //sql���� ������� ���� ��� table�� Ŀ���̵�.
            	 delivery = new DeliveryBean(); //DeliveryBean type ��ü����
            	  pstmt.setString(1, no);        
            	 delivery.setAccount(rs.getString("account")); //�ش� ��� ��ȣ�� ���°��� ��� bean��ü�� setting.
            	 delivery.setDeliveryAddress(rs.getString("delivery_addr")); //�ش� ��� ��ȣ�� �ּҸ� ��� bean��ü�� setting.
             } 
         } catch (Exception ex) {
             System.out.println("Exception :" + ex); //����ó��
         } finally {
             pool.freeConnection(con, pstmt, rs); //�ڿ��ݳ�
         }
         return delivery; //bean��ü ��ȯ
    	
    }
    
    ///////////////////////////////////////////////////
    public Vector getOrder(String id) {	//Ư�� ȸ��(id) �ֹ����� 
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vResult = new Vector(); //Vector��ü ����

        try {
            con = pool.getConnection(); //���� ����
            String query = "select * from mini_order where id = ? order by no desc"; //sql��
            pstmt = con.prepareStatement(query); //sql�� setting.
            pstmt.setString(1, id); //?�� id�� ����
            rs = pstmt.executeQuery();  //����
            while (rs.next()) { //Ŀ���̵�
                OrderBean order = new OrderBean(); //�ֹ�����bean��ü (order)����
                order.setId(id); //
                order.setQuantity(rs.getInt("quantity")); //id�� ���� ������ �Ӽ��� ���� ���� ������ order ��ü�� setting.
                order.setDate(rs.getString("odate"));
                order.setNo(rs.getString("no"));
                order.setState(rs.getString("state"));
                order.setProduct_no(rs.getString("product_no"));
                order.setDno(rs.getString("dno"));
                vResult.add(order); //vector�� id�� ���� �ֹ������� add
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex); //����ó��
        } finally { 
            pool.freeConnection(con, pstmt, rs); //�ڿ��ݳ�
        }
        return vResult; //Vector�� return. 
        ////////////////////////////// - > id�� ���� �ֹ��׸� add�Ǵ� ��.
    }


    public Vector getOrderList() {	//��� �ֹ� ���� ���
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vResult = new Vector(); //Vector����

        try {
            con = pool.getConnection();   //�������
            String query = "select * from mini_order order by no desc"; //sql��
            stmt = con.createStatement(); 
            rs = stmt.executeQuery(query); //sql�� ����
            while (rs.next()) {  //��� table Ŀ���̵�
                OrderBean order = new OrderBean();   //Bean��ü ����(order)
                order.setId(rs.getString("id"));     //����� ���� table������ ������ �Ӽ��� �´� ���� �����ͼ� �ٽ�
                                                     //order��ü�� setting.
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("odate"));
                order.setNo(rs.getString("no"));
                order.setState(rs.getString("state"));
                order.setProduct_no(rs.getString("product_no"));
                order.setDno(rs.getString("dno"));
                vResult.add(order); //vector�� ���� setting�� ��ü add
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);   //����ó��
        } finally {
            pool.freeConnection(con, stmt, rs); //�ڿ��ݳ�
        }
        return vResult; //sql���� ���� ���� ��ü�� adding �Ǿ� �ִ� vector ��ȯ.
    }


    public OrderBean getOrderDetail(String no) {	//Ư�� �ֹ�(no) �� ���� �ֹ� ������ ����
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        OrderBean order = null;  //�ֹ����� bean����

        try {
            con = pool.getConnection();     //�������
            String query = "select * from mini_order where no = ?"; //sql��::
            pstmt = con.prepareStatement(query); //setting
            pstmt.setString(1, no); //?�� ���ڰ� ����
            rs = pstmt.executeQuery(); //sql�� ����
 
            if (rs.next()) { //sql ��� table���� Ŀ���̵�
                order = new OrderBean(); // �ֹ����� bean ��ü ����
                order.setId(rs.getString("id"));     //table��� ������ ���� ������ �Ӽ��� ���� ������ ������ 
                                                     //�ֹ����� bean�� set
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("odate"));
                order.setNo(rs.getString("no"));
                order.setState(rs.getString("state"));
                order.setProduct_no(rs.getString("product_no"));
                order.setDno(rs.getString("dno"));
            }
        } catch (Exception e) {
            System.out.println("Exception :" + e);  //����ó��
        } finally { 
            pool.freeConnection(con, pstmt, rs); //�ڿ��ݳ�
        }
        return order; //�ֹ� �� ������ ����� ��übean�� return.
    }


    public boolean updateOrder(String no, String state) {	//�ֹ����� (����غ�->�����)
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false; 
        try {
            con = pool.getConnection(); //�������
            String query = "update mini_order set state = ? where no = ?"; //sql��
            pstmt = con.prepareStatement(query); //setting
            pstmt.setString(1, state);  //?�� method ���ڷ� ���� String type = > state�� no ����
            pstmt.setString(2, no);
            int count = pstmt.executeUpdate(); //sql�� ����
            if (count == 1)
            	result = true;  //sql���� ����� ������ 1���̸� -> sql�� �����̸� result�� true�� ~!! (sql�� ��������)
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);  //����ó��
        } finally {
            pool.freeConnection(con, pstmt); //�ڿ��ݳ�
        }
        return result; //sql���� ���� �������θ� return. (�ֹ� ���� -> true, �ֹ� ���� x ->false)
    }


    public boolean deleteOrder(String no) throws SQLException {	//�ֹ�����
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();        //�������
            String query = "delete from mini_order where no = ?"; //sql��
            pstmt = con.prepareStatement(query); //sql�� setting.
            pstmt.setString(1, no); //?�� ���ڰ����� ���� no setting.
            int count = pstmt.executeUpdate();//sql�� ����
            if (count == 1) result = true; //sql ���� ������(�ֹ� ���� ������) - > true 
        } catch (Exception e) {
            System.out.println("Exception :" + e); //����ó��
        } finally {
            pool.freeConnection(con, pstmt); //�ڿ��ݳ�
        } 
        return result; //�ֹ� ���� ���� ���θ� return ���ִ� method.
    }

    public Vector getAccount(){		//�������� ���� ���
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector accountList = null;  //Vector ����
        try {
            con = pool.getConnection();  //�������
                        
            pstmt = con.prepareStatement("select * from mini_bank"); //sql��
            rs = pstmt.executeQuery(); //sql�� ����
            
            accountList = new Vector(); //accountList��� vector ��ü ����
            String account=null; 
            while (rs.next()) { //sql ���� ������� ������ Ŀ���̵�
           	 account = new String(rs.getString("account")+" "+ rs.getString("bank")+" "+rs.getString("name"));
           	 accountList.addElement(account); //vector�� string��ü�� add
			 }
          //sql�� ���� ��� table�� ���� ���� ����,����,�̸������� ���ο� String ��ü(wrapper)�� ����.
        }catch(Exception ex) {
        	ex.printStackTrace();
        } finally {
        	   pool.freeConnection(con, pstmt, rs); //�ڿ��ݳ�
        }
        return accountList; //�������� ���� ����� ������  ������ vector return.
    }
}
