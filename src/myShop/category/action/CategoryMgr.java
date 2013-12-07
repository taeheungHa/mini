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
	            System.out.println("Error : Ŀ�ؼ� �������� ����!!");
	        }
	    }

	//���� �޼ҵ�----
	/**ī�װ� ����ϴ� �޼ҵ�*/
	public int categoryInsert(String code,	String cname) throws Exception{
		Connection con = null;
		PreparedStatement ps = null;
	
		int n = 0;
		try{
			code = categoryCheckcode(code);			//code�ߺ� üũ
			cname = categoryCheckcname(cname);		//cname�ߺ� üũ
			if (code == null || cname == null) {	//code, cname null�� üũ
				return n; 
			}
			con=pool.getConnection();
			String sql="insert into category values(cseq.nextval,?,?)";		//sql ������ ����
			ps=con.prepareStatement(sql);			//SQL ���� ����
			ps.setString(1, code);					//ù��° ����ǥ�� code������ ����
			ps.setString(2, cname);					//�ι�° ����ǥ�� cname������ ����
			n=ps.executeUpdate();					
			return n;	
		}finally{
			pool.freeConnection(con, ps);
		}
	}//categoryInsert()------------------
	public String categoryCheckcode(String code) throws Exception {
		Connection con = null;				//
		PreparedStatement ps = null;
		ResultSet rs = null;				//��ɿ� ���� ��ȯ�� ���� ����, null ������ �ʱ�ȭ
		con = pool.getConnection();			//DB ����
		String sql = "select * from category where code = ?";			//sql ������ ����
		ps = con.prepareStatement(sql);		//SQL ���� ����
		ps.setString(1, code);
		rs = ps.executeQuery();
		if (rs.next()) return null;			//Ŀ���� �̵��� �� Row�� ������... null�� ����
		else return code;					//Row�� ������ code�� ����
	}
	public String categoryCheckcname(String cname) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = pool.getConnection();
		String sql = "select * from category where cname = ?";			//SQL ������ ����
		ps = con.prepareStatement(sql);									//SQL ���� ����
		ps.setString(1, cname);											//cname������ ����
		rs = ps.executeQuery();
		if (rs.next()) return null;			//Ŀ���� �̵��� �� Row�� ������... null�� ����
		else return cname;					//Row�� ������ cname�� ����
	}
	/**ī�װ� ��� ��������*/
	public ArrayList<CategoryBean> categoryAll() throws Exception{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			con=pool.getConnection();
			String sql = "select * from category"; 				//SQL ������ ����
			ps=con.prepareStatement(sql);						//SQL ���� ����
			rs=ps.executeQuery();
			ArrayList<CategoryBean> arr = new ArrayList<CategoryBean>();
			while(rs.next()){
				String cnum=rs.getString("cnum");
				String code=rs.getString("code");
				String cname=rs.getString("cname");
				//���̺� �� ���� �÷������� CategoryBean��ü�� �Ӽ��� ����
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
			String sql = "delete from category where cnum=?";		//SQL ������ ����
			ps=con.prepareStatement(sql);							//SQL ���� ����
			ps.setString(1, cnum);									//SQL �������� cnum ������ ����
			int n=ps.executeUpdate();
			return n;
		}finally{
			pool.freeConnection(con, ps, rs);
		}
	}//categoryDelete()------------------
}