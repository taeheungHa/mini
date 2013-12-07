package myShop.notice.action;

import java.sql.*;
import java.util.*;

import myShop.notice.db.NoticeBean;


public class NoticeMgr {   // Ŭ���� ���� 
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;  // �����ͺ��̽� ������� ���� ���� �� �ʱ�ȭ
	
	
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";    // �����ͺ��̽� �������������  �迭���� ����
	String jdbc_url = "jdbc:oracle:thin:@127.0.0.1:1521";      // �����ͺ��̽� �������������  �迭���� ����
	
	
	void connect() {    // �����ͺ��̽� ���� �޼���
		
		try {   // JDBC ����̹� �ε�
			Class.forName(jdbc_driver);   // �����ͺ��̽� ���������� �̿��� Connection �ν��Ͻ� Ȯ��
			conn = DriverManager.getConnection(jdbc_url,"system","oracle");   //conn�� ������� ���� �� ���̵�,��й�ȣ �Է�
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {   // �����ͺ��̽� ���� ���� �޼���
		if(pstmt != null) {  
			try {
				pstmt.close();   // pstmt PreparedStatement ����
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();   //conn Connection ����
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public boolean updateDB(NoticeBean guestbook) {   // ������ ������ ���� �޼���
		connect();
		
		String sql ="update notice set gb_name=?, gb_title=?, gb_date=sysdate, gb_passwd=?, gb_contents=? where gb_id=?";  //�������� sql �迭�� �Է�
		
		try {
			pstmt = conn.prepareStatement(sql);  // ���ڷ� ���� GuestBook ��ü�� �̿��� ����ڰ� ������ ���� ������ SQL�� �ϼ�
			pstmt.setString(1,guestbook.getGb_name()); // getGb_name�� ������ pstmt�� �Է�
			pstmt.setString(2,guestbook.getGb_title());  // getGb_title�� ������ pstmt�� �Է�
			pstmt.setString(3,guestbook.getGb_passwd());  // getGb_passwd�� ������ pstmt�� �Է�
			pstmt.setString(4,guestbook.getGb_contents());  // getGb_contents�� ������ pstmt�� �Է�
			pstmt.setInt(5,guestbook.getGb_id());  // getGb_id ������ pstmt�� �Է�
			pstmt.executeUpdate();  // pstmt ������ ����
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	
	public boolean deleteDB(int gb_id) {  // �Խù� ������ ���� �޼���
		connect();
		
		String sql ="delete from notice where gb_id=?";   // sql ��ɹ��� sql�迭�� �Է�
		
		try {
			pstmt = conn.prepareStatement(sql);// ���ڷ� ���� gb_id �����̸Ӹ� Ű ���� �̿��� ����
			pstmt.setInt(1,gb_id); 
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	
	public boolean insertDB(NoticeBean guestbook) {  // �Խù� ��� �޼���
		connect();
		
		String sql ="insert into notice(gb_id,gb_name,gb_title,gb_date,gb_passwd,gb_contents) values(notice_seq.nextval,?,?,sysdate,?,?)"; // �������� sql �迭�� �Է�
		
		try {
			pstmt = conn.prepareStatement(sql);  
			pstmt.setString(1,guestbook.getGb_name());  // ���ڷ� ���� getGb_name �� ���� ����� �Է°��� �޾� SQL �ϼ��� �Է� ó��
			pstmt.setString(2,guestbook.getGb_title());  // ���ڷ� ���� getGb_title �� ���� ����� �Է°��� �޾� SQL �ϼ��� �Է� ó��
			pstmt.setString(3,guestbook.getGb_passwd());  // ���ڷ� ���� getGb_passwd �� ���� ����� �Է°��� �޾� SQL �ϼ��� �Է� ó��
			pstmt.setString(4,guestbook.getGb_contents());  // ���ڷ� ���� getGb_contents �� ���� ����� �Է°��� �޾� SQL �ϼ��� �Է� ó��
			pstmt.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}

	// �Խù� �ϳ��� ��� ������ ������ ���� �޼���
	public NoticeBean getDB(int gb_id) {
		connect();
		
		String sql = "select * from notice where gb_id=?";
		NoticeBean guestbook = new NoticeBean();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,gb_id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			guestbook.setGb_id(rs.getInt("gb_id"));  // ������ gb_id�� GuestBook ��ü�� ����� ������.
			guestbook.setGb_name(rs.getString("gb_name"));  // ������ gb_name�� GuestBook ��ü�� ����� ������.
			guestbook.setGb_title(rs.getString("gb_title"));  // ������ gb_title�� GuestBook ��ü�� ����� ������.
			guestbook.setGb_date(rs.getDate("gb_date"));  // ������ gb_date�� GuestBook ��ü�� ����� ������.
			guestbook.setGb_contents(rs.getString("gb_contents"));  // ������ gb_contents�� GuestBook ��ü�� ����� ������.
			guestbook.setGb_passwd(rs.getString("gb_passwd"));  // ������ gb_passwd�� GuestBook ��ü�� ����� ������.
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return guestbook;
	}
	
	
	public ArrayList getDBList() {  // �Խù� ��� ����� ���� ��ü �Խù��� ������ ���� �޼���
		connect();
		
		ArrayList<NoticeBean> datas = new ArrayList<NoticeBean>();  // �Խù� ����� �����ϱ� ���� ArrayList ��ü ����, ��������� ArrayList �� �� ������ Ÿ���� ������.
		
		String sql = "select * from notice"; //�������� sql �迭�� �Է�
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {  // ������ ���� ResultSet �� �̵��ϸ鼭 ��� ������ row �� �ϳ��� ������ �ͼ� GuestBook ��ü�� �ְ� �̸� �ٽ� ArrayList �� �ִ� �۾��� �ݺ�.
				NoticeBean guestbook = new NoticeBean(); 
				guestbook.setGb_id(rs.getInt("gb_id"));   //gb_id�� ������ �ͼ� GuestBook ��ü�� �ְ� �̸� �ٽ� ArrayList �� ����
				guestbook.setGb_name(rs.getString("gb_name"));   //gb_name�� ������ �ͼ� GuestBook ��ü�� �ְ� �̸� �ٽ� ArrayList �� ����
				guestbook.setGb_title(rs.getString("gb_title"));   //gb_title�� ������ �ͼ� GuestBook ��ü�� �ְ� �̸� �ٽ� ArrayList �� ����
				guestbook.setGb_date(rs.getDate("gb_date"));   //gb_date�� ������ �ͼ� GuestBook ��ü�� �ְ� �̸� �ٽ� ArrayList �� ����
				guestbook.setGb_contents(rs.getString("gb_contents"));   //gb_contents�� ������ �ͼ� GuestBook ��ü�� �ְ� �̸� �ٽ� ArrayList �� ����
				
				datas.add(guestbook);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		
		return datas;  // ó���� ���� ArrayList �� ������.
	}
	
	
	
		public ArrayList getDBListNo() {  // Indexȭ�鿡�� �������� �Խ��� �ҷ�����.
			connect();
			
			ArrayList<NoticeBean> datas = new ArrayList<NoticeBean>();  // �Խù� ����� �����ϱ� ���� ArrayList ��ü ����, ��������� ArrayList �� �� ������ Ÿ���� ������.
			
			String sql = "select * from notice order by gb_id desc";  // �������� sql �迭�� �Է�
		/*	try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				// ������ ���� ResultSet �� �̵��ϸ鼭 ��� ������ row �� �ϳ��� ������ �ͼ� GuestBook ��ü�� �ְ� �̸� �ٽ� ArrayList �� �ִ� �۾��� �ݺ�.
				while(rs.next()) {
					NoticeBean guestbook = new NoticeBean();
					guestbook.setGb_id(rs.getInt("gb_id"));
					guestbook.setGb_name(rs.getString("gb_name"));
					guestbook.setGb_title(rs.getString("gb_title"));
					guestbook.setGb_date(rs.getDate("gb_date"));
					guestbook.setGb_contents(rs.getString("gb_contents"));
					
					datas.add(guestbook);
				}
				rs.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				disconnect();
			}*/
			// ó���� ���� ArrayList �� ������.
			return datas;
		}
}