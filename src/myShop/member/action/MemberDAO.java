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
			pool = DBConnectionMgr.getInstance(); // DBconnectionMgr class��
													// ��ü����(�Ϲ� ��ü ���� ����� �ƴ�,
													// �޸��� �Ҹ� ���� ���� �̱��� �����
													// ��ü������ ����.)
			// (������ ��ü��)DBconnectionMgr poll=DBconnectionMgr.getInstance() <=(��
			// ������ �ʱ�ȭ����)
		} catch (Exception e) { // ����ó��
			System.out.println("Error : Ŀ�ؼ� �������� ����!!"); // ���ܹ߻��� ó����
		}
	}

	public Vector zipcodeRead(String area3) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			con = pool.getConnection(); // connection�� ���ͼ�
			String strQuery = "select * from zipcode where area3 like '"
					+ area3 + "%'";
			pstmt = con.prepareStatement(strQuery);
			rs = pstmt.executeQuery(); // sql���� ���� �� -> ����� Resultset type�� rs��
										// !!

			while (rs.next()) { // Ŀ�� �̵�
				ZipcodeBean tempZipcode = new ZipcodeBean(); // ZipcodeBean��ü ����
				tempZipcode.setZipcode(rs.getString("zipcode")); // sql�������� ����
																	// ���� ���߿�
																	// zipcode��
																	// �ش�Ǵ� ����
																	// string����
				tempZipcode.setArea1(rs.getString("area1")); // �о�ͼ�
																// tempZipcode��ü��
																// �־��ش�.
				tempZipcode.setArea2(rs.getString("area2"));
				tempZipcode.setArea3(rs.getString("area3"));
				tempZipcode.setArea4(rs.getString("area4"));
				vecList.addElement(tempZipcode); // vector�� ���� ������� ����ִ� ��ü
													// tempZiptcode�� ���Ѵ�.
			}

		} catch (Exception ex) {
			System.out.println("Exception" + ex); // ����ó��
		} finally {
			pool.freeConnection(con, pstmt, rs); // �ڿ��ݳ�
		}
		return vecList; // sql���� �����ϴ� vecList�� return
	}

	public boolean memberInsert(MemberBean memBean) {
		boolean flag = false;
		Connection con = null; // �������
		PreparedStatement pstmt = null;
		try {
			con = pool.getConnection();
			String strQuery = "insert into member values(memseq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?)"; // bind������
																										// ����
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
				flag = true; // INSERT, DELETE, UPDATE�� ���� �� :: sql���� ����� �����ϴ�
								// ����� 1�� �̶��
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt); // �ڿ��ݳ�
		}
		return flag;
	}

	public boolean loginCheck(String id, String passwd) { // String type���� id��
															// password�� ���ڰ�����
															// ������,
		Connection con = null; // return type�� boolean���̴� - > sql�� �����,
								// �������θ� return������ �޴� method.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginCon = false;
		try {
			con = pool.getConnection(); // �������
			String strQuery = "select email, pass from member where email = ? and pass = ?"; // method������
																								// ������
																								// sql��.
			pstmt = con.prepareStatement(strQuery); // sql�� setting.
			pstmt.setString(1, id); // ������ '?'�� ���� ������ set (?->id,?->passwd)
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery(); // ����
			loginCon = rs.next(); // Ŀ���̵�
		} catch (Exception ex) {
			System.out.println("Exception" + ex); // ����ó��
		} finally {
			pool.freeConnection(con, pstmt, rs); // �ڿ�ʹݳ�
		}
		return loginCon; // next()method ::�� cursor�̵� method������, �� �̻� �̵��� ���� ����
							// ��� false�� return�Ѵ�.
	}

	public boolean passCheck(String email) {
		boolean passCon = false;
		Connection con = null; // return type�� boolean���̴� - > sql�� �����,
		// �������θ� return������ �޴� method.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection(); // �������
			String strQuery = "select pass from member where email = ? "; // method������
																								// ������
																								// sql��.
			pstmt = con.prepareStatement(strQuery); // sql�� setting.
			pstmt.setString(1, email); // ������ '?'�� ���� ������ set (?->id,?->passwd)
			rs = pstmt.executeQuery(); // ����
			passCon = rs.next(); // Ŀ���̵�
		} catch (Exception ex) {
			System.out.println("Exception" + ex); // ����ó��
		} finally {
			pool.freeConnection(con, pstmt, rs); // �ڿ�ʹݳ�
		}
		return passCon;
	}
	
	public MemberBean getMember(String mem_id) {  //�ش��ϴ� id�� ��ġ�ϴ� member�� ���� ������ �������� Method    
        Connection con = null;                 
        PreparedStatement pstmt = null; 
        ResultSet rs = null;
        MemberBean memBean = null;

        try {
            con = pool.getConnection();           //�������
            String strQuery = "select * from member where email=?"; //method���� ��, ����� sql��..
            pstmt = con.prepareStatement(strQuery); //sql�� setting.
            pstmt.setString(1, mem_id); //���ϴ� sql���� �����ϱ� ���� '?'�� �ش�Ǵ� ���ϴ� 'id'���� ���ڷ� ��� 
                                        //mem_id�� ���� 
            rs = pstmt.executeQuery(); //���� 

            if (rs.next()) { //Ŀ���̵�
            	memBean = new MemberBean();       //RegisterBean��ü ����.
            	memBean.setNo(rs.getInt("no"));
            	memBean.setEmail(rs.getString("email"));     //������ ��ü�� sql������ ���� ���� ������ ������ �ִ´�.
            	memBean.setLastname(rs.getString("lastname")); 
            	memBean.setFirstname(rs.getString("firstname"));
            	memBean.setAddnum(rs.getString("addnum"));
            	memBean.setAddcity(rs.getString("addcity"));
            	memBean.setAddtown(rs.getString("addtown"));
            	memBean.setAdddetail(rs.getString("adddetail"));
                memBean.setPhon(rs.getString("phon"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);     //����ó��
        } finally {
            pool.freeConnection(con, pstmt, rs);   //�ڿ��ݳ�
        }
        return memBean; //������ sql������ ���� �����Ǿ� ���� ���� ���ο� ��ü ((RegisterBean type))memBean data�� �־� 
                        //�� ��ü�� ��ȯ�Ͽ� �޴� method
    }
	
	public boolean memberUpdate(MemberBean memBean) {      //return type:: boolean  
        Connection con = null;               
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();      //�������
            String strQuery = "update member set pass=?, lastname=?, firstname=?, addnum=?,"; //method���� �����Ϸ��� sql��
            strQuery = strQuery + " addcity=?, addtown=?, adddetail=?,phon=?,tell=?,birdate=?, birmonth=?,biryear=?";  
            strQuery = strQuery + " where no=? ";
            //������� sql���� �ɰ��� + �� �ٿ���
            pstmt = con.prepareStatement(strQuery); //sql�� setting.
            pstmt.setString(1, memBean.getPass()); //sql���� �������� ���� '?'�� �ش��ϴ� ������ memBean��ü�� ���� ���� ���� ����
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
            int count = pstmt.executeUpdate(); //sql�� ����.

            if (count == 1) {
                flag = true;   //sql ���๮ -> ���๮�� 1 ::sql���� �����ߴٸ�
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex); //����ó��
        } finally {
            pool.freeConnection(con, pstmt); //�ڿ��ݳ�
        }
        return flag; //������ ���������� ����Ǿ��� ��� boolean type���� true�� return.
    }
}
