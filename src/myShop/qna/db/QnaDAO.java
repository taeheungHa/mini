package myShop.qna.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class QnaDAO { //Data Access Object //���� db�� �����Ͽ� ���ڵ� �߰�,����,���� �۾�

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	static DataSource ds;
	
	static{
		try{  //DB����
			Context init=new InitialContext();
			ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");	
			
			
			}catch(Exception e){
				System.out.println("DB���� ����:"+e);
				e.printStackTrace();
				
			}
		
	}
	public QnaDAO() {
//		try{  //DB����
//		Context init=new InitialContext();
//		ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");	
//		con=ds.getConnection();
//		
//		}catch(Exception e){
//			System.out.println("DB���� ����:"+e);
//			e.printStackTrace();
//			return;
//		}
	}
	
	//���� ���� ���ϱ�
	public int getListCount(){
		
		int x=0;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement("select count(*) from qna");
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				x=rs.getInt(1);
			}
		}catch (SQLException e) {
			System.out.println("��ü�۰������ ����"+e);
			e.printStackTrace();
		}finally{
			if(rs!=null){
				try{
					con.close();
					rs.close();
				}catch(Exception e){
					
				}}
			if(pstmt!=null){
				try{
					pstmt.close();
				}catch(Exception e){
					
				}
			}
		}
		return x;
	}
	
	//�� ��� ����
	public List getQnaList(int page,int limit){
	String qna_list_sql="select * from"+"(select rownum rnum,gb_num,gb_name,gb_title,"+
	"gb_contents,gb_file,gb_re_ref,gb_re_lev,gb_re_seq,gb_readcnt,gb_date from"+
	"(select * from qna order by gb_re_ref desc,gb_re_seq asc))"+"where rnum>=? and rnum<=?";
	
	List list=new ArrayList();
	
	int startrow=(page-1)*10+1; //�б������ row��ȣ
	int endrow=startrow+limit-1; //���� ������row��ȣ
			
	try{
		con=ds.getConnection();
		pstmt=con.prepareStatement(qna_list_sql);
		pstmt.setInt(1, startrow);
		pstmt.setInt(2, endrow);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			QnaBean qna=new QnaBean();
			qna.setGb_num(rs.getInt("gb_num"));
			qna.setGb_name(rs.getString("gb_name"));
			qna.setGb_title(rs.getString("gb_title"));
			qna.setGb_contents(rs.getString("gb_contents"));
			qna.setGb_file(rs.getString("gb_file"));
			qna.setGb_re_ref(rs.getInt("gb_re_ref"));
			qna.setGb_re_lev(rs.getInt("gb_re_lev"));
			qna.setGb_re_seq(rs.getInt("gb_re_seq"));
			qna.setGb_readcnt(rs.getInt("gb_readcnt"));
			qna.setGb_date(rs.getDate("gb_date"));
			
			list.add(qna);
		}
		return list;
	}catch(Exception e){
		System.out.println("�۸�Ϻ��� ����(getQnaList)"+e);
	}finally{
		if(rs!=null){
			try{
				con.close();
				rs.close();
			}catch(Exception e){
				
			}}
		if(pstmt!=null){
			try{
				pstmt.close();
			}catch(Exception e){
				
			}
		}
		
	}
	return null;
	}
	
	//�� ���� ����
	public QnaBean getDetail(int num){
		QnaBean qna=null;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement("select * from qna where gb_num=?");
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				qna=new QnaBean();
				
				qna.setGb_num(rs.getInt("gb_num"));
				qna.setGb_name(rs.getString("gb_name"));
				qna.setGb_title(rs.getString("gb_title"));
				qna.setGb_contents(rs.getString("gb_contents"));
				qna.setGb_file(rs.getString("gb_file"));
				qna.setGb_re_ref(rs.getInt("gb_re_ref"));
				qna.setGb_re_lev(rs.getInt("gb_re_lev"));
				qna.setGb_re_seq(rs.getInt("gb_re_seq"));
				qna.setGb_readcnt(rs.getInt("gb_readcnt"));
				qna.setGb_date(rs.getDate("gb_date"));
				
				
			}
			return qna;
		} catch (Exception e) {
			System.out.println("�۳��뺸�⿡��"+e);
		}finally{
			if(rs!=null){
				try{
					con.close();
					rs.close();
				}catch(Exception e){
					
				}}
			if(pstmt!=null){
				try{
					pstmt.close();
				}catch(Exception e){
					
				}
			}
	}
		return null;
}
	//�� ���
	public boolean QnaInsert(QnaBean qna){
		
		int num =0;
		String sql="";
		
		int result=0;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement("select max(gb_num) from qna");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;
			
			sql="insert into qna(gb_num,gb_name,gb_passwd,gb_title,";
			sql+="gb_contents, gb_file, gb_re_ref,"+
				"gb_re_lev,gb_re_seq,gb_readcnt,"+
				"gb_date) values(?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, qna.getGb_name());
			pstmt.setString(3, qna.getGb_passwd());
			pstmt.setString(4, qna.getGb_title());
			pstmt.setString(5, qna.getGb_contents());
			pstmt.setString(6, qna.getGb_file());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			
			result=pstmt.executeUpdate();
			if(result==0)return false;
			
			return true;
		}catch(Exception ex){
			System.out.println("�۵�� ���� : "+ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	//�� �亯
		public int qnaReply(QnaBean qna){
			
			String qna_max_sql="select max(gb_num) from qna";
			String sql="";
			int num=0;
			int result=0;
			
			int re_ref=qna.getGb_re_ref();
			int re_lev=qna.getGb_re_lev();
			int re_seq=qna.getGb_re_seq();
			
			try{
				con=ds.getConnection();
				pstmt=con.prepareStatement(qna_max_sql);
				rs = pstmt.executeQuery();
				if(rs.next())num =rs.getInt(1)+1;
				else num=1;
				
				sql="update qna set gb_re_seq=gb_re_seq+1 where gb_re_ref=? ";
				sql+="and gb_re_seq>?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,re_ref);
				pstmt.setInt(2,re_seq);
				result=pstmt.executeUpdate();
				
				re_seq = re_seq + 1;
				re_lev = re_lev+1;
				
				sql="insert into qna (gb_num,gb_name,gb_passwd,gb_title,";
				sql+="gb_contents, gb_file,gb_re_ref,gb_re_lev,gb_re_seq,";
				sql+="gb_readcnt,gb_date) values(?,?,?,?,?,?,?,?,?,?,sysdate)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, qna.getGb_name());
				pstmt.setString(3, qna.getGb_passwd());
				pstmt.setString(4, qna.getGb_title());
				pstmt.setString(5, qna.getGb_contents());
				pstmt.setString(6, ""); //���忡�� ������ ���ε����� ����.
				pstmt.setInt(7, re_ref);
				pstmt.setInt(8, re_lev);
				pstmt.setInt(9, re_seq);
				pstmt.setInt(10, 0);
				pstmt.executeUpdate();
				return num;
			}catch(SQLException e){
				System.out.println("��� ���� "+e);
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				if(con!=null) try{con.close();}catch(SQLException ex){}
			}
			return 0;
		}
		
		//�� ����
		public boolean qnaModify(QnaBean qna) throws Exception{
			
			String sql="update qna set gb_title=?,gb_contents=? where gb_num=?";
			
			try{
				con=ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, qna.getGb_title());
				pstmt.setString(2, qna.getGb_contents());
				pstmt.setInt(3, qna.getGb_num());
				pstmt.executeUpdate();
				return true;
			}catch(Exception e){
				System.out.println("�ۼ�������"+e);
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				if(con!=null) try{con.close();}catch(SQLException ex){}
				}
			return false;
		}
		
		//�� ����
		public boolean qnaDelete(int num){
			
			String qna_delete_sql="delete from qna where gb_num=?";
			
			int result=0;
			
			try{
				con=ds.getConnection();
				pstmt=con.prepareStatement(qna_delete_sql);
				pstmt.setInt(1, num);
				result=pstmt.executeUpdate();
				if(result==0)return false;
				
				return true;
			}catch(Exception e){
				System.out.println("�ۻ�������"+e);
			}	finally{
				try{
					if(pstmt!=null)pstmt.close();
					if(con!=null) con.close();
					}
					catch(Exception e){}
				
			}
			
			return false;
		}
		
		//��ȸ�� ������Ʈ
		public void setReadCountUpdate(int num) throws Exception{
			
			String sql="update qna set gb_readcnt = "+
				"gb_readcnt+1 where gb_num = "+num;
			
			try{
				con=ds.getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.executeUpdate();
			}catch(SQLException e){
				System.out.println("��ȸ�����ſ���"+e);
			}
			finally{
				try{
				if(pstmt!=null)pstmt.close();
				if(con!=null) con.close();
				}
				catch(Exception e){}
			
		}
		}
		
		//�۾������� Ȯ��
		public boolean isQnaWriter(int num,String pass){
			
			String qna_sql="select * from qna where gb_num=?";
			
			try{
				con=ds.getConnection();
				pstmt=con.prepareStatement(qna_sql);
				pstmt.setInt(1, num);
				rs=pstmt.executeQuery();
				rs.next();
				
				if(pass.equals(rs.getString("gb_passwd"))){
					return true;
				}
			}catch(SQLException e){
				System.out.println("isQnaWriter ���� : "+e);
			}
		finally{
				try{
				if(pstmt!=null)pstmt.close();
				if(con!=null) con.close();
				}
				catch(Exception ex){}
			
		}
			return false;
		}
	
	
	
	
	
}