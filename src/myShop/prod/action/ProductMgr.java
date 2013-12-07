package myShop.prod.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import myShop.common.conn.DBConnectionMgr;
import myShop.order.db.OrderBean;
import myShop.prod.db.ProductBean;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductMgr {		//��ǰ���� Ŭ����

    private DBConnectionMgr pool = null;  // �����ͺ��̽� ������� ���� ����
    Hashtable<String, Vector<ProductBean>> hash = new Hashtable<String, Vector<ProductBean>>();		//�ؽ����̺� ����
private Vector<ProductBean> p_list1, p_list2,p_list3;

    public ProductMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error : Ŀ�ؼ� �������� ����!!");
        }
    }

    public boolean insertProduct(HttpServletRequest req) {		//��ǰ�߰�
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
        	//"D:/workspace/myshop/WebContent/ch14/images";F5Ű//�Ӽ�â�� ��η� ���ϸ��� ����
            String uploadDir =  req.getRealPath("upload_images");
            System.out.println(uploadDir);
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "euc-kr", new DefaultFileRenamePolicy());
          
            con = pool.getConnection();
            String query = "insert into mini_product "
                    + "values(mpseq.nextval,?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";		//��ǰ�߰� ������
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, multi.getParameter("code"));		//��ǰ �ڵ� �߰�
            pstmt.setString(2, multi.getParameter("name"));		//��ǰ �̸� �߰�
            pstmt.setString(3, multi.getParameter("model"));	//��ǰ �� �߰�
            pstmt.setString(4, multi.getParameter("price"));	//��ǰ ���� �߰�
            pstmt.setString(5, multi.getParameter("pspec"));	//��ǰ ���� �߰�
            pstmt.setString(6, multi.getParameter("pbrand"));	//��ǰ ������ �߰�
            pstmt.setString(7, multi.getParameter("detail"));	//��ǰ ���� �߰�
            pstmt.setString(8, multi.getParameter("stock"));	//��ǰ ���� �߰�
            
/*        	no                number               NOT NULL,	-- ����(�ڵ�ä��)
        	code              varchar2(20)        not null, 	-- ��ǰ�ѹ�(00001~99999)
        	name              varchar2(50)         not null,	-- ��ǰ�̸�
        	model			  varchar2(50)         not null,	-- ��ǰ��
        	price             varchar2(10)         not null,	-- ����
        	pspec             varchar2(12),						-- 1. hit / 2. new / 3. best
        	pbrand			  varchar2(30),						-- ��ǰ ������
        	detail            varchar2(1000),       			-- ��ǰ�� ���� ����
        	pdate             varchar2(10)          NULL      ,	-- ��ǰ ��� ����
        	stock             varchar2(10)          NULL      ,	-- ��ǰ ����
        	image             varchar2(20)          NULL      ,	-- ��ǰ �̹���        */    
            

            if (multi.getFilesystemName("image") == null) {		//��ǰ �̹����� ���� ���
                pstmt.setString(9, "ready.gif");				//ready.gif ���� ���
            } else {
                pstmt.setString(9, multi.getFilesystemName("image"));	//�̹����� ������� �ش��̹��� ���
            }
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;

        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }

    public ProductBean getProduct(String no) {
        Connection con = null; 
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProductBean product = null;

        try {
            con = pool.getConnection();
            String query = "select * from mini_product where no=?";		//SQL ������ String �迭�� �Է�
            pstmt = con.prepareStatement(query);		
            pstmt.setString(1, no);
            rs = pstmt.executeQuery(); //������ ����
            
            if (rs.next()) {
                product = new ProductBean();				//ProductBean ��ü ���� - product
                product.setNo(rs.getInt("no"));				//DB no �� �߰� (�ڵ�)
                product.setName(rs.getString("name"));		//DB name �� �߰� (��ǰ �̸�)
                product.setModel(rs.getString("model"));	//DB model �� �߰� (��ǰ ��)
                product.setPrice(rs.getString("price"));	//DB price �� �߰� (��ǰ ����)
                product.setPbrand(rs.getString("pbrand"));	//DB pbrand �� �߰� (��ǰ �귣��)
                product.setDetail(rs.getString("detail"));	//DB detail �� �߰� (��ǰ ����)
                product.setDate(rs.getString("pdate"));		//DB pdate �� �߰� (��ǰ ��ϳ�¥)
                product.setStock(rs.getString("stock"));	//DB stock �� �߰� (��ǰ ����)
                product.setImage(rs.getString("image"));	//DB image �� �߰� (��ǰ �̹���)
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return product;

    }

    public boolean updateProduct(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        String uploadDir = req.getRealPath("upload_images");

        try {   //������Ʈ�Ҷ� ��ǰ�̹��� ������ ���� �б�..... 
            con = pool.getConnection();
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "euc-kr", new DefaultFileRenamePolicy());

            if (multi.getFilesystemName("image") == null) {
                String query = "update mini_product set name = ?, model = ?, price = ?, detail = ?, stock = ?  where no = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));  //��ǰ�̸�
                pstmt.setString(2, multi.getParameter("model"));  //��ǰ��
                pstmt.setString(3, multi.getParameter("price"));  //��ǰ����
                pstmt.setString(4, multi.getParameter("detail"));  //��ǰ����
                pstmt.setString(5, multi.getParameter("stock"));   //��ǰ����
                pstmt.setString(6, multi.getParameter("no"));   //��ǰ��ȣ
            } else {
                String query = "update mini_product set name = ?, model = ?, price = ?, detail = ?, stock = ?, image = ?  where no = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));  //��ǰ�̸�
                pstmt.setString(2, multi.getParameter("model"));  //��ǰ��
                pstmt.setString(3, multi.getParameter("price"));  //��ǰ����
                pstmt.setString(4, multi.getParameter("detail"));  //��ǰ����
                pstmt.setString(5, multi.getParameter("stock"));  //��ǰ����
                pstmt.setString(6, multi.getFilesystemName("image"));  //��ǰ�̹���
                pstmt.setString(7, multi.getParameter("no"));  //��ǰ��ȣ
            }
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }

    public void reduceProduct(OrderBean order) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = pool.getConnection();
            String query = "update shop_product set stock = (stock - ? ) where no = ? ";  // ��� �������� query �迭�� �Է�
            pstmt = con.prepareStatement(query); //��� Ȯ�� ������ ����
            pstmt.setInt(1, order.getQuantity());
            pstmt.setString(2, order.getProduct_no());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }


    public Vector getProductList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from mini_product order by no desc";	//��ϼ���(no) ������������ ��ǰ����
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setNo(rs.getInt("no"));  //no ���ڸ� ������ ����
                product.setName(rs.getString("name"));  //name ���ڸ� ������ ����
                product.setPrice(rs.getString("price"));  //price ���ڸ� ������ ����
                product.setDetail(rs.getString("detail"));  //detail ���ڸ� ������ ����
                product.setDate(rs.getString("pdate"));  //pdate ���ڸ� ������ ����
                product.setStock(rs.getString("stock"));  //stock ���ڸ� ������ ����
                product.setImage(rs.getString("image"));  //image ���ڸ� ������ ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vProduct;
    }

    public Vector getProductListBrand(String pbrand) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;        
        Statement stmt = null;
        ResultSet rs = null;
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from mini_product where pbrand = ? order by no desc";
            
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, pbrand);
            rs = pstmt.executeQuery();            

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setNo(rs.getInt("no"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("pdate"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vProduct;
    }
    
    //��ǰ ���� 
    public boolean deleteProduct(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from mini_product where no = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
/*    //��ǰ ī�װ� ���� ��ȸ
    public Vector selectByCateogry(String category_fk) throws Exception{
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
                
    	try{
			con = pool.getConnection();
			String sql = "select * from mini_product where code = ? order by no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category_fk);//��з��� ���Ե� ��ǰ���  
			System.out.println("category_fk"+category_fk);
			rs = pstmt.executeQuery();
			p_list2 = this.makeVector(rs);
			//hash.put(category_fk,  p_list2);
			return p_list2;
		}finally{
			  pool.freeConnection(con, pstmt, rs);
		}
	}*/
    public Vector<ProductBean> makeVector(ResultSet rs) throws SQLException {
		Vector<ProductBean> v = new Vector<ProductBean>();
		while(rs.next()){
			int pnum=rs.getInt(1);
			String code=rs.getString(2);
			String pname=rs.getString(3);
			String pmodel=rs.getString(4);
			String price=rs.getString(5);
			String pspec=rs.getString(6);
			String pbrand=rs.getString(7);
			String pcontents=rs.getString(8);
			String pinputdate = rs.getString(9);
			String pqty=rs.getString(10);
			String pimage=rs.getString(11);
						
			ProductBean product = new ProductBean(pnum,code, pname, pmodel,
					price,pspec,pbrand,pcontents,pinputdate,pqty,pimage);
			
			v.add(product);
		}
		return v;
	}
  //��ǰ ���Ѻ��� ��ǰ ����� �������� �޼ҵ�
	public Vector<ProductBean> selectByspec(String pspec) throws Exception{
		Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
                
		try{
			 con = pool.getConnection();
			String sql = "select * from mini_product where pspec= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pspec);
			rs = pstmt.executeQuery();
			p_list1 = this.makeVector(rs);
			hash.put(pspec,  p_list1);
			return p_list1;
		}finally{
			  pool.freeConnection(con, pstmt, rs);
		}
	}
	
	  //��ǰ �����纰�� ��ǰ ����� �������� �޼ҵ�
		public Vector<ProductBean> selectBybrand(String pbrand) throws Exception{
			Connection con = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	                
			try{
				 con = pool.getConnection();
				String sql = "select * from mini_product where pbrand= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pbrand);
				rs = pstmt.executeQuery();
				p_list1 = this.makeVector(rs);
				hash.put(pbrand,  p_list1);
				return p_list1;
			}finally{
				  pool.freeConnection(con, pstmt, rs);
			}
		}
		
	     /*��ǰ�� ���� �˻���� ����*/
        public Vector<ProductBean> getProductSearchList(String name) throws Exception{
         Connection con = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         
         try{
          con = pool.getConnection();
          String query = "select * from mini_product where name like ? order by no desc";               
          /*String sql = "select * from mini_product where pbrand= ?";*/
          pstmt = con.prepareStatement(query);
          pstmt.setString(1, "%"+name+"%");
          rs = pstmt.executeQuery();
          p_list3 = this.makeVector(rs);
          hash.put(name,  p_list3);
          return p_list3;
         }finally{
          pool.freeConnection(con, pstmt, rs);
         }
        } 
}