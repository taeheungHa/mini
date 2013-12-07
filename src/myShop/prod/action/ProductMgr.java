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

public class ProductMgr {		//상품관리 클래스

    private DBConnectionMgr pool = null;  // 데이터베이스 연결관련 변수 선언
    Hashtable<String, Vector<ProductBean>> hash = new Hashtable<String, Vector<ProductBean>>();		//해시테이블 생성
private Vector<ProductBean> p_list1, p_list2,p_list3;

    public ProductMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
    }

    public boolean insertProduct(HttpServletRequest req) {		//상품추가
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
        	//"D:/workspace/myshop/WebContent/ch14/images";F5키//속성창의 경로로 파일명은 영문
            String uploadDir =  req.getRealPath("upload_images");
            System.out.println(uploadDir);
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "euc-kr", new DefaultFileRenamePolicy());
          
            con = pool.getConnection();
            String query = "insert into mini_product "
                    + "values(mpseq.nextval,?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";		//상품추가 쿼리문
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, multi.getParameter("code"));		//상품 코드 추가
            pstmt.setString(2, multi.getParameter("name"));		//상품 이름 추가
            pstmt.setString(3, multi.getParameter("model"));	//상품 모델 추가
            pstmt.setString(4, multi.getParameter("price"));	//상품 가격 추가
            pstmt.setString(5, multi.getParameter("pspec"));	//상품 스펙 추가
            pstmt.setString(6, multi.getParameter("pbrand"));	//상품 제조사 추가
            pstmt.setString(7, multi.getParameter("detail"));	//상품 설명 추가
            pstmt.setString(8, multi.getParameter("stock"));	//상품 수량 추가
            
/*        	no                number               NOT NULL,	-- 순번(자동채번)
        	code              varchar2(20)        not null, 	-- 제품넘버(00001~99999)
        	name              varchar2(50)         not null,	-- 제품이름
        	model			  varchar2(50)         not null,	-- 제품모델
        	price             varchar2(10)         not null,	-- 가격
        	pspec             varchar2(12),						-- 1. hit / 2. new / 3. best
        	pbrand			  varchar2(30),						-- 제품 제조사
        	detail            varchar2(1000),       			-- 제품에 대한 내용
        	pdate             varchar2(10)          NULL      ,	-- 제품 등록 일자
        	stock             varchar2(10)          NULL      ,	-- 제품 수량
        	image             varchar2(20)          NULL      ,	-- 제품 이미지        */    
            

            if (multi.getFilesystemName("image") == null) {		//상품 이미지가 없을 경우
                pstmt.setString(9, "ready.gif");				//ready.gif 파일 등록
            } else {
                pstmt.setString(9, multi.getFilesystemName("image"));	//이미지가 있을경우 해당이미지 등록
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
            String query = "select * from mini_product where no=?";		//SQL 쿼리문 String 배열에 입력
            pstmt = con.prepareStatement(query);		
            pstmt.setString(1, no);
            rs = pstmt.executeQuery(); //쿼리문 실행
            
            if (rs.next()) {
                product = new ProductBean();				//ProductBean 객체 생성 - product
                product.setNo(rs.getInt("no"));				//DB no 값 추가 (자동)
                product.setName(rs.getString("name"));		//DB name 값 추가 (상품 이름)
                product.setModel(rs.getString("model"));	//DB model 값 추가 (상품 모델)
                product.setPrice(rs.getString("price"));	//DB price 값 추가 (상품 가격)
                product.setPbrand(rs.getString("pbrand"));	//DB pbrand 값 추가 (상품 브랜드)
                product.setDetail(rs.getString("detail"));	//DB detail 값 추가 (상품 설명)
                product.setDate(rs.getString("pdate"));		//DB pdate 값 추가 (상품 등록날짜)
                product.setStock(rs.getString("stock"));	//DB stock 값 추가 (상품 수량)
                product.setImage(rs.getString("image"));	//DB image 값 추가 (상품 이미지)
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

        try {   //업데이트할때 상품이미지 유무에 따른 분기..... 
            con = pool.getConnection();
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "euc-kr", new DefaultFileRenamePolicy());

            if (multi.getFilesystemName("image") == null) {
                String query = "update mini_product set name = ?, model = ?, price = ?, detail = ?, stock = ?  where no = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));  //상품이름
                pstmt.setString(2, multi.getParameter("model"));  //상품모델
                pstmt.setString(3, multi.getParameter("price"));  //상품가격
                pstmt.setString(4, multi.getParameter("detail"));  //상품설명
                pstmt.setString(5, multi.getParameter("stock"));   //상품수량
                pstmt.setString(6, multi.getParameter("no"));   //상품번호
            } else {
                String query = "update mini_product set name = ?, model = ?, price = ?, detail = ?, stock = ?, image = ?  where no = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));  //상품이름
                pstmt.setString(2, multi.getParameter("model"));  //상품모델
                pstmt.setString(3, multi.getParameter("price"));  //상품가격
                pstmt.setString(4, multi.getParameter("detail"));  //상품설명
                pstmt.setString(5, multi.getParameter("stock"));  //상품수량
                pstmt.setString(6, multi.getFilesystemName("image"));  //상품이미지
                pstmt.setString(7, multi.getParameter("no"));  //상품번호
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
            String query = "update shop_product set stock = (stock - ? ) where no = ? ";  // 재고 쿼리문을 query 배열에 입력
            pstmt = con.prepareStatement(query); //재고 확인 쿼리문 실행
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
            String query = "select * from mini_product order by no desc";	//등록순서(no) 내림차순으로 상품정렬
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setNo(rs.getInt("no"));  //no 인자를 가져와 정렬
                product.setName(rs.getString("name"));  //name 인자를 가져와 정렬
                product.setPrice(rs.getString("price"));  //price 인자를 가져와 정렬
                product.setDetail(rs.getString("detail"));  //detail 인자를 가져와 정렬
                product.setDate(rs.getString("pdate"));  //pdate 인자를 가져와 정렬
                product.setStock(rs.getString("stock"));  //stock 인자를 가져와 정렬
                product.setImage(rs.getString("image"));  //image 인자를 가져와 정렬
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
    
    //상품 삭제 
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
/*    //상품 카테고리 정보 조회
    public Vector selectByCateogry(String category_fk) throws Exception{
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
                
    	try{
			con = pool.getConnection();
			String sql = "select * from mini_product where code = ? order by no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category_fk);//대분류에 포함된 상품목록  
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
  //제품 스팩별로 상품 목록을 가져오는 메소드
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
	
	  //제품 제조사별로 상품 목록을 가져오는 메소드
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
		
	     /*상품명에 대한 검색결과 리턴*/
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