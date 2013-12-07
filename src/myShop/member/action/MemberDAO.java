package myShop.member.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import myShop.member.db.MemberBean;
import myShop.member.db.ZipcodeBean;
import myShop.common.conn.*;

public class MemberDAO {
	private DBConnectionMgr pool = null;
	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	public MemberDAO() {
		try {
			pool = DBConnectionMgr.getInstance(); // DBconnectionMgr class의
													// 객체생성(일반 객체 생성 방법이 아닌,
													// 메모리의 소모를 막기 위해 싱글톤 방식의
													// 객체생성을 택함.)
			// (생성된 객체를)DBconnectionMgr poll=DBconnectionMgr.getInstance() <=(의
			// 값으로 초기화해줌)
		} catch (Exception e) { // 예외처리
			System.out.println("Error : 커넥션 가져오기 실패!!"); // 예외발생시 처리문
		}
	}

	public Vector zipcodeRead(String area3) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			con = pool.getConnection(); // connection을 얻어와서
			String strQuery = "select * from zipcode where area3 like '"
					+ area3 + "%'";
			pstmt = con.prepareStatement(strQuery);
			rs = pstmt.executeQuery(); // sql문을 실행 한 -> 결과를 Resultset type의 rs에
										// !!

			while (rs.next()) { // 커서 이동
				ZipcodeBean tempZipcode = new ZipcodeBean(); // ZipcodeBean객체 생성
				tempZipcode.setZipcode(rs.getString("zipcode")); // sql문장으로 부터
																	// 얻은 값중에
																	// zipcode에
																	// 해당되는 값을
																	// string으로
				tempZipcode.setArea1(rs.getString("area1")); // 읽어와서
																// tempZipcode객체에
																// 넣어준다.
				tempZipcode.setArea2(rs.getString("area2"));
				tempZipcode.setArea3(rs.getString("area3"));
				tempZipcode.setArea4(rs.getString("area4"));
				vecList.addElement(tempZipcode); // vector에 앞의 내용들이 들어있는 객체
													// tempZiptcode를 더한다.
			}

		} catch (Exception ex) {
			System.out.println("Exception" + ex); // 예외처리
		} finally {
			pool.freeConnection(con, pstmt, rs); // 자원반납
		}
		return vecList; // sql문을 만족하는 vecList값 return
	}

	public boolean memberInsert(MemberBean memBean) {
		boolean flag = false;
		Connection con = null; // 연결얻음
		PreparedStatement pstmt = null;
		try {
			con = pool.getConnection();
			String strQuery = "insert into member values(memseq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?)"; // bind형으로
																										// 받음
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1, memBean.getLastname());
			pstmt.setString(2, memBean.getFirstname());
			pstmt.setString(3, memBean.getAddnum());
			pstmt.setString(4, memBean.getAddcity());
			pstmt.setString(5, memBean.getAddtown());
			pstmt.setString(6, memBean.getAdddetail());
			pstmt.setString(7, memBean.getEmail());
			pstmt.setString(8, memBean.getPhon());
			pstmt.setString(9, memBean.getTell());
			pstmt.setString(10, memBean.getBirdate());
			pstmt.setString(11, memBean.getBirmonth());
			pstmt.setString(12, memBean.getBiryear());
			pstmt.setString(13, memBean.getPass());
			int count = pstmt.executeUpdate();
			if (count == 1) {
				flag = true; // INSERT, DELETE, UPDATE된 행의 수 :: sql문을 실행시 만족하는
								// 결과가 1행 이라면
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt); // 자원반납
		}
		return flag;
	}

	public boolean loginCheck(String id, String passwd) { // String type으로 id와
															// password를 인자값으로
															// 받으며,
		Connection con = null; // return type은 boolean형이다 - > sql문 수행과,
								// 성공여부를 return값으로 받는 method.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginCon = false;
		try {
			con = pool.getConnection(); // 연결얻음
			String strQuery = "select email, pass from member where email = ? and pass = ?"; // method내에서
																								// 수행할
																								// sql문.
			pstmt = con.prepareStatement(strQuery); // sql문 setting.
			pstmt.setString(1, id); // 각각의 '?'에 넣을 값들을 set (?->id,?->passwd)
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery(); // 실행
			loginCon = rs.next(); // 커서이동
		} catch (Exception ex) {
			System.out.println("Exception" + ex); // 예외처리
		} finally {
			pool.freeConnection(con, pstmt, rs); // 자우너반납
		}
		return loginCon; // next()method ::는 cursor이동 method이지만, 더 이상 이동할 행이 없을
							// 경우 false를 return한다.
	}

	public boolean passCheck(String email) {
		boolean passCon = false;
		Connection con = null; // return type은 boolean형이다 - > sql문 수행과,
		// 성공여부를 return값으로 받는 method.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection(); // 연결얻음
			String strQuery = "select pass from member where email = ? "; // method내에서
																								// 수행할
																								// sql문.
			pstmt = con.prepareStatement(strQuery); // sql문 setting.
			pstmt.setString(1, email); // 각각의 '?'에 넣을 값들을 set (?->id,?->passwd)
			rs = pstmt.executeQuery(); // 실행
			passCon = rs.next(); // 커서이동
		} catch (Exception ex) {
			System.out.println("Exception" + ex); // 예외처리
		} finally {
			pool.freeConnection(con, pstmt, rs); // 자우너반납
		}
		return passCon;
	}
	
	public MemberBean getMember(String mem_id) {  //해당하는 id와 일치하는 member에 대한 정보를 가져오는 Method    
        Connection con = null;                 
        PreparedStatement pstmt = null; 
        ResultSet rs = null;
        MemberBean memBean = null;

        try {
            con = pool.getConnection();           //연결얻음
            String strQuery = "select * from member where email=?"; //method실행 시, 수행될 sql문..
            pstmt = con.prepareStatement(strQuery); //sql문 setting.
            pstmt.setString(1, mem_id); //원하는 sql문을 충족하기 위해 '?'에 해당되는 원하는 'id'값에 인자로 얻는 
                                        //mem_id를 대입 
            rs = pstmt.executeQuery(); //실행 

            if (rs.next()) { //커서이동
            	memBean = new MemberBean();       //RegisterBean객체 생성.
            	memBean.setNo(rs.getInt("no"));
            	memBean.setEmail(rs.getString("email"));     //생성한 객체에 sql문으로 부터 얻은 값들을 대입해 넣는다.
            	memBean.setLastname(rs.getString("lastname")); 
            	memBean.setFirstname(rs.getString("firstname"));
            	memBean.setAddnum(rs.getString("addnum"));
            	memBean.setAddcity(rs.getString("addcity"));
            	memBean.setAddtown(rs.getString("addtown"));
            	memBean.setAdddetail(rs.getString("adddetail"));
                memBean.setPhon(rs.getString("phon"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);     //예외처리
        } finally {
            pool.freeConnection(con, pstmt, rs);   //자원반납
        }
        return memBean; //만족한 sql문으로 부터 충족되어 받은 값을 새로운 객체 ((RegisterBean type))memBean data로 넣어 
                        //그 객체를 반환하여 받는 method
    }
	
	public boolean memberUpdate(MemberBean memBean) {      //return type:: boolean  
        Connection con = null;               
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();      //연결얻음
            String strQuery = "update member set pass=?, lastname=?, firstname=?, addnum=?,"; //method내의 실행하려는 sql문
            strQuery = strQuery + " addcity=?, addtown=?, adddetail=?,phon=?,tell=?,birdate=?, birmonth=?,biryear=?";  
            strQuery = strQuery + " where no=? ";
            //길어지는 sql문을 쪼개서 + 로 붙여줌
            pstmt = con.prepareStatement(strQuery); //sql문 setting.
            pstmt.setString(1, memBean.getPass()); //sql문에 동적으로 받을 '?'에 해당하는 값들을 memBean객체로 부터 얻어와 각각 대입
            pstmt.setString(2, memBean.getLastname());
            pstmt.setString(3, memBean.getFirstname());
            pstmt.setString(4, memBean.getAddnum());
            pstmt.setString(5, memBean.getAddcity());
            pstmt.setString(6, memBean.getAddtown());
            pstmt.setString(7, memBean.getAdddetail());
            pstmt.setString(8, memBean.getPhon());
            pstmt.setString(9, memBean.getTell());
            pstmt.setString(10, memBean.getBirdate());
			pstmt.setString(11, memBean.getBirmonth());
			pstmt.setString(12, memBean.getBiryear());
            pstmt.setInt(13, memBean.getNo());
            int count = pstmt.executeUpdate(); //sql문 실행.

            if (count == 1) {
                flag = true;   //sql 실행문 -> 수행문이 1 ::sql문이 성공했다면
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex); //예외처리
        } finally {
            pool.freeConnection(con, pstmt); //자원반납
        }
        return flag; //수정이 성공적으로 수행되었을 경우 boolean type으로 true값 return.
    }
}
