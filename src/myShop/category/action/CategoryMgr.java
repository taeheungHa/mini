package myShop.category.action;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import myShop.category.db.CategoryBean;
import myShop.common.conn.DBConnectionMgr;






public class CategoryMgr {
	
	
	 private DBConnectionMgr pool = null;


	    public CategoryMgr() {
	        try {
	            pool = DBConnectionMgr.getInstance();
	        } catch (Exception e) {
	            System.out.println("Error : 커넥션 가져오기 실패!!");
	        }
	    }

	//서비스 메소드----
	/**카테고리 등록하는 메소드*/
	public int categoryInsert(String code,	String cname) throws Exception{
		Connection con = null;
		PreparedStatement ps = null;
	
		int n = 0;
		try{
			code = categoryCheckcode(code);			//code중복 체크
			cname = categoryCheckcname(cname);		//cname중복 체크
			if (code == null || cname == null) {	//code, cname null값 체크
				return n; 
			}
			con=pool.getConnection();
			String sql="insert into category values(cseq.nextval,?,?)";		//sql 쿼리문 저장
			ps=con.prepareStatement(sql);			//SQL 쿼리 실행
			ps.setString(1, code);					//첫번째 물음표에 code변수값 대입
			ps.setString(2, cname);					//두번째 물음표에 cname변수값 대입
			n=ps.executeUpdate();					
			return n;	
		}finally{
			pool.freeConnection(con, ps);
		}
	}//categoryInsert()------------------
	public String categoryCheckcode(String code) throws Exception {
		Connection con = null;				//
		PreparedStatement ps = null;
		ResultSet rs = null;				//명령에 대한 반환값 변수 생성, null 값으로 초기화
		con = pool.getConnection();			//DB 연결
		String sql = "select * from category where code = ?";			//sql 쿼리문 저장
		ps = con.prepareStatement(sql);		//SQL 쿼리 실행
		ps.setString(1, code);
		rs = ps.executeQuery();
		if (rs.next()) return null;			//커서를 이동한 후 Row가 있을시... null값 리턴
		else return code;					//Row가 없을시 code값 리턴
	}
	public String categoryCheckcname(String cname) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = pool.getConnection();
		String sql = "select * from category where cname = ?";			//SQL 쿼리문 저장
		ps = con.prepareStatement(sql);									//SQL 쿼리 실행
		ps.setString(1, cname);											//cname변수값 대입
		rs = ps.executeQuery();
		if (rs.next()) return null;			//커서를 이동한 후 Row가 있을시... null값 리턴
		else return cname;					//Row가 없을시 cname값 리턴
	}
	/**카테고리 목록 가져오기*/
	public ArrayList<CategoryBean> categoryAll() throws Exception{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			con=pool.getConnection();
			String sql = "select * from category"; 				//SQL 쿼리문 저장
			ps=con.prepareStatement(sql);						//SQL 쿼리 실행
			rs=ps.executeQuery();
			ArrayList<CategoryBean> arr = new ArrayList<CategoryBean>();
			while(rs.next()){
				String cnum=rs.getString("cnum");
				String code=rs.getString("code");
				String cname=rs.getString("cname");
				//테이블 각 행의 컬럼정보를 CategoryBean객체의 속성에 저장
				CategoryBean record = new CategoryBean(cnum,code,cname);
				arr.add(record);
			}
			return arr;
		}finally{
			pool.freeConnection(con, ps, rs);
		}
	}//categoryAll()--------------------

	//
	public int categoryDelete(String cnum) throws Exception{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			con=pool.getConnection();
			String sql = "delete from category where cnum=?";		//SQL 쿼리문 저장
			ps=con.prepareStatement(sql);							//SQL 쿼리 실행
			ps.setString(1, cnum);									//SQL 쿼리문에 cnum 변수값 대입
			int n=ps.executeUpdate();
			return n;
		}finally{
			pool.freeConnection(con, ps, rs);
		}
	}//categoryDelete()------------------
}