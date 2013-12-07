package myShop.notice.action;

import java.sql.*;
import java.util.*;

import myShop.notice.db.NoticeBean;


public class NoticeMgr {   // 클래스 선언 
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;  // 데이터베이스 연결관련 변수 선언 및 초기화
	
	
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";    // 데이터베이스 연결관련정보를  배열으로 선언
	String jdbc_url = "jdbc:oracle:thin:@127.0.0.1:1521";      // 데이터베이스 연결관련정보를  배열으로 선언
	
	
	void connect() {    // 데이터베이스 연결 메서드
		
		try {   // JDBC 드라이버 로드
			Class.forName(jdbc_driver);   // 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
			conn = DriverManager.getConnection(jdbc_url,"system","oracle");   //conn에 연결관련 정보 및 아이디,비밀번호 입력
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {   // 데이터베이스 연결 종료 메서드
		if(pstmt != null) {  
			try {
				pstmt.close();   // pstmt PreparedStatement 종료
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();   //conn Connection 종료
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public boolean updateDB(NoticeBean guestbook) {   // 데이터 갱신을 위한 메서드
		connect();
		
		String sql ="update notice set gb_name=?, gb_title=?, gb_date=sysdate, gb_passwd=?, gb_contents=? where gb_id=?";  //쿼리문을 sql 배열에 입력
		
		try {
			pstmt = conn.prepareStatement(sql);  // 인자로 받은 GuestBook 객체를 이용해 사용자가 수정한 값을 가져와 SQL문 완성
			pstmt.setString(1,guestbook.getGb_name()); // getGb_name을 가져와 pstmt에 입력
			pstmt.setString(2,guestbook.getGb_title());  // getGb_title을 가져와 pstmt에 입력
			pstmt.setString(3,guestbook.getGb_passwd());  // getGb_passwd을 가져와 pstmt에 입력
			pstmt.setString(4,guestbook.getGb_contents());  // getGb_contents을 가져와 pstmt에 입력
			pstmt.setInt(5,guestbook.getGb_id());  // getGb_id 가져와 pstmt에 입력
			pstmt.executeUpdate();  // pstmt 데이터 갱신
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	
	public boolean deleteDB(int gb_id) {  // 게시물 삭제를 위한 메서드
		connect();
		
		String sql ="delete from notice where gb_id=?";   // sql 명령문을 sql배열에 입력
		
		try {
			pstmt = conn.prepareStatement(sql);// 인자로 받은 gb_id 프라이머리 키 값을 이용해 삭제
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
	
	
	public boolean insertDB(NoticeBean guestbook) {  // 게시물 등록 메서드
		connect();
		
		String sql ="insert into notice(gb_id,gb_name,gb_title,gb_date,gb_passwd,gb_contents) values(notice_seq.nextval,?,?,sysdate,?,?)"; // 쿼리문을 sql 배열에 입력
		
		try {
			pstmt = conn.prepareStatement(sql);  
			pstmt.setString(1,guestbook.getGb_name());  // 인자로 받은 getGb_name 를 통해 사용자 입력값을 받아 SQL 완성후 입력 처리
			pstmt.setString(2,guestbook.getGb_title());  // 인자로 받은 getGb_title 를 통해 사용자 입력값을 받아 SQL 완성후 입력 처리
			pstmt.setString(3,guestbook.getGb_passwd());  // 인자로 받은 getGb_passwd 를 통해 사용자 입력값을 받아 SQL 완성후 입력 처리
			pstmt.setString(4,guestbook.getGb_contents());  // 인자로 받은 getGb_contents 를 통해 사용자 입력값을 받아 SQL 완성후 입력 처리
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

	// 게시물 하나의 모든 정보를 가지고 오는 메서드
	public NoticeBean getDB(int gb_id) {
		connect();
		
		String sql = "select * from notice where gb_id=?";
		NoticeBean guestbook = new NoticeBean();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,gb_id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			guestbook.setGb_id(rs.getInt("gb_id"));  // 가져온 gb_id를 GuestBook 객체로 만들어 리턴함.
			guestbook.setGb_name(rs.getString("gb_name"));  // 가져온 gb_name을 GuestBook 객체로 만들어 리턴함.
			guestbook.setGb_title(rs.getString("gb_title"));  // 가져온 gb_title를 GuestBook 객체로 만들어 리턴함.
			guestbook.setGb_date(rs.getDate("gb_date"));  // 가져온 gb_date를 GuestBook 객체로 만들어 리턴함.
			guestbook.setGb_contents(rs.getString("gb_contents"));  // 가져온 gb_contents를 GuestBook 객체로 만들어 리턴함.
			guestbook.setGb_passwd(rs.getString("gb_passwd"));  // 가져온 gb_passwd를 GuestBook 객체로 만들어 리턴함.
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return guestbook;
	}
	
	
	public ArrayList getDBList() {  // 게시물 목록 출력을 위해 전체 게시물을 가지고 오는 메서드
		connect();
		
		ArrayList<NoticeBean> datas = new ArrayList<NoticeBean>();  // 게시물 목록을 리턴하기 위한 ArrayList 객체 생성, 명시적으로 ArrayList 에 들어갈 데이터 타잎을 선언함.
		
		String sql = "select * from notice"; //쿼리문을 sql 배열에 입력
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {  // 루프를 돌면 ResultSet 을 이동하면서 모든 데이터 row 를 하나씩 가지고 와서 GuestBook 객체에 넣고 이를 다시 ArrayList 에 넣는 작업을 반복.
				NoticeBean guestbook = new NoticeBean(); 
				guestbook.setGb_id(rs.getInt("gb_id"));   //gb_id를 가지고 와서 GuestBook 객체에 넣고 이를 다시 ArrayList 에 넣음
				guestbook.setGb_name(rs.getString("gb_name"));   //gb_name를 가지고 와서 GuestBook 객체에 넣고 이를 다시 ArrayList 에 넣음
				guestbook.setGb_title(rs.getString("gb_title"));   //gb_title를 가지고 와서 GuestBook 객체에 넣고 이를 다시 ArrayList 에 넣음
				guestbook.setGb_date(rs.getDate("gb_date"));   //gb_date를 가지고 와서 GuestBook 객체에 넣고 이를 다시 ArrayList 에 넣음
				guestbook.setGb_contents(rs.getString("gb_contents"));   //gb_contents를 가지고 와서 GuestBook 객체에 넣고 이를 다시 ArrayList 에 넣음
				
				datas.add(guestbook);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		
		return datas;  // 처리가 끝나 ArrayList 를 리턴함.
	}
	
	
	
		public ArrayList getDBListNo() {  // Index화면에서 공지사항 게시판 불러오기.
			connect();
			
			ArrayList<NoticeBean> datas = new ArrayList<NoticeBean>();  // 게시물 목록을 리턴하기 위한 ArrayList 객체 생성, 명시적으로 ArrayList 에 들어갈 데이터 타잎을 선언함.
			
			String sql = "select * from notice order by gb_id desc";  // 쿼리문을 sql 배열에 입력
		/*	try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				// 루프를 돌면 ResultSet 을 이동하면서 모든 데이터 row 를 하나씩 가지고 와서 GuestBook 객체에 넣고 이를 다시 ArrayList 에 넣는 작업을 반복.
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
			// 처리가 끝나 ArrayList 를 리턴함.
			return datas;
		}
}