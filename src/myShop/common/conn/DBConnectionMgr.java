/**
 * Copyright(c) 2001 iSavvix Corporation (http://www.isavvix.com/)
 *
 *                        All rights reserved
 *
 * Permission to use, copy, modify and distribute this material for
 * any purpose and without fee is hereby granted, provided that the
 * above copyright notice and this permission notice appear in all
 * copies, and that the name of iSavvix Corporation not be used in
 * advertising or publicity pertaining to this material without the
 * specific, prior written permission of an authorized representative of
 * iSavvix Corporation.
 *
 * ISAVVIX CORPORATION MAKES NO REPRESENTATIONS AND EXTENDS NO WARRANTIES,
 * EXPRESS OR IMPLIED, WITH RESPECT TO THE SOFTWARE, INCLUDING, BUT
 * NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR ANY PARTICULAR PURPOSE, AND THE WARRANTY AGAINST
 * INFRINGEMENT OF PATENTS OR OTHER INTELLECTUAL PROPERTY RIGHTS.  THE
 * SOFTWARE IS PROVIDED "AS IS", AND IN NO EVENT SHALL ISAVVIX CORPORATION OR
 * ANY OF ITS AFFILIATES BE LIABLE FOR ANY DAMAGES, INCLUDING ANY
 * LOST PROFITS OR OTHER INCIDENTAL OR CONSEQUENTIAL DAMAGES RELATING
 * TO THE SOFTWARE.
 *
 */


package myShop.common.conn;

import java.sql.*;
import java.util.Properties;
import java.util.Vector;


/**
 * Manages a java.sql.Connection pool.
 *
 * @author  Anil Hemrajani
 */
public class DBConnectionMgr {			//DB 연결관리 클래스
    private Vector connections = new Vector(10);
    private String _driver = "oracle.jdbc.driver.OracleDriver",
    _url = 	"jdbc:oracle:thin:@39.115.114.228:1521:xe",
    _user = "system",		//DB계정
    _password = "oracle";		//DB비밀번호
    private boolean _traceOn = false;		//oc4j 사용 유무
    private boolean initialized = false;
    private int _openConnections = 10;	//연결된 컨넥션 갯수 지정
    private static DBConnectionMgr instance = null;

    public DBConnectionMgr() {
    }

    /** Use this method to set the maximum number of open connections before
     unused connections are closed.
     */

    public static DBConnectionMgr getInstance() {
        if (instance == null) {
            synchronized (DBConnectionMgr.class) {
                if (instance == null) {
                    instance = new DBConnectionMgr();
                }
            }
        }

        return instance;
    }

    //커넥션 풀카운트 설정
    public void setOpenConnectionCount(int count) {
        _openConnections = count;
    }

    //로그 사용여부 설정
    public void setEnableTrace(boolean enable) {
        _traceOn = enable;
    }


    /** Returns a Vector of java.sql.Connection objects */
    public Vector getConnectionList() {
        return connections;
    }


    /** Opens specified "count" of connections and adds them to the existing pool */
    public synchronized void setInitOpenConnections(int count)
            throws SQLException {
        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < count; i++) {
            c = createConnection();
            co = new ConnectionObject(c, false);

            connections.addElement(co);
            trace("ConnectionPoolManager: Adding new DB connection to pool (" + connections.size() + ")");
        }
    }

    /** Returns a count of open connections */
    /** 커넥션풀에 있는 커넥션 수
     * 
     * @return
     */
    public int getConnectionCount() {
        return connections.size();
    }


    /** Returns an unused existing or new connection.  */
    /** 존재하는 커넥션중 사용하지 않은 커넥션 또는 새로운커넥션을 리턴
     * 
     * @return
     * @throws Exception
     */
    public synchronized Connection getConnection()
            throws Exception {
        if (!initialized) {		//initialized=false 일 경우
            Class c = Class.forName(_driver);	//어떤 Driver로 커넥션을 연결한다는 정보가 필요 (DB2, MS-SQL, MySQL, ORACLE)
            DriverManager.registerDriver((Driver) c.newInstance());	//Driver의 새로운 인스턴스를 생성하고, DriverManager에 정보 등록

            initialized = true;		//한번만 등록할수 있도록 initialized를 true로 변경
        }


        Connection c = null;
        ConnectionObject co = null;
        boolean badConnection = false;

        //커넥션을 얻기 위해 커넥션풀을 검사하기 위한 반복문
        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);	//커넥션을 얻는다.

            // If connection is not in use, test to ensure it's still valid!
            if (!co.inUse) {	//커넥션 사용여부 체크
                try {
                    badConnection = co.connection.isClosed();	//사용하지않는 커넥션일 경우, 다시한번 커넥션이 종료되었는지 체크
                    if (!badConnection)		//커넥션이 종료되지 않으면....
                        badConnection = (co.connection.getWarnings() != null);
                    	//getWarnings 이 커넥션 객체의 호출에 의한 경고가 있는지 체크. 있으면 SQLWarning, 없으면 null 반환
                } catch (Exception e) {
                    badConnection = true;
                    e.printStackTrace();
                }

                // Connection is bad, remove from pool
                if (badConnection) {	//올바르게 종료되지 않은 커넥션이 있으면...
                    connections.removeElementAt(i);		//커넥션풀에서 제거
                    trace("ConnectionPoolManager: Remove disconnected DB connection #" + i);
                    continue;
                }

                c = co.connection;		//존재하지만 사용하지 않는 커넥션이 있는경우 커넥션을 얻고
                co.inUse = true;		//커넥션 사용관리 클래스(ConnectionObject)에 이 커넥션을 사용이라고 변경한다. 

                trace("ConnectionPoolManager: Using existing DB connection #" + (i + 1));
                break;
            }
        }

        if (c == null) {		//위에서 존재하지만, 사용하지 않는 커넥션이 없으면
            c = createConnection();		//새로운 커넥션 생성
            co = new ConnectionObject(c, true);		//커넥션사용관리클래스(ConnectionObject) 생성
            connections.addElement(co);		//커넥션풀에 등록

            trace("ConnectionPoolManager: Creating new DB connection #" + connections.size());
        }

        return c;
    }


    /** Marks a flag in the ConnectionObject to indicate this connection is no longer in use */
    /** 커넥션을 종료시키거나 사용해지를 한다.
     * 
     * @param c
     */
    public synchronized void freeConnection(Connection c) {
        if (c == null)		//커넥션이 없으면 리턴
            return;

        ConnectionObject co = null;
        //커넥션풀에서 해당 커넥션이 있는지 찾는다.
        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if (c == co.connection) {
                co.inUse = false;		//해당 커넥션이 있으면 사용해지
                break;
            }
        }
        //커넥션풀에 있는 커넥션중에 연결된 커넥션 보다 큰지 체크. 
        //클 경우 커넥션 종료
        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if ((i + 1) > _openConnections && !co.inUse)		// 커넥션풀의 크기가 연결된 커넥션의 갯수보다 크고 사용해지인 커넥션 여부 체크  

                removeConnection(co.connection);		//커넥션 종료, 커넥션사용관리클래스(ConnectionObject)에서 제거
        }
    }

    public void freeConnection(Connection c, PreparedStatement p, ResultSet r) {
        try {
            if (r != null) r.close();
            if (p != null) p.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection c, Statement s, ResultSet r) {
        try {
            if (r != null) r.close();
            if (s != null) s.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection c, PreparedStatement p) {
        try {
            if (p != null) p.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection c, Statement s) {
        try {
            if (s != null) s.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    /** Marks a flag in the ConnectionObject to indicate this connection is no longer in use */
    /** 커넥션을 종료하고 커넥션풀에서 제거한다.
     * 
     * @param c
     */
    public synchronized void removeConnection(Connection c) {
        if (c == null)		//커넥션이 null이면 리턴.
            return;

        ConnectionObject co = null;
        //커넥션풀에서 해당 커넥션이 있는지 체크한다.
        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if (c == co.connection) {		//해당 커넥션이 있으면
                try {
                    c.close();		//커넥션을 닫느다.(종료)
                    connections.removeElementAt(i);		//커넥션풀에서 해당커넥션을 제거한다.
                    trace("Removed " + c.toString());
                } catch (Exception e) {
                    e.printStackTrace();
                }

                break;
            }
        }
    }

    //커넥션 생성
    private Connection createConnection()
            throws SQLException {
        Connection con = null;

        try {
            if (_user == null)
                _user = "";
            if (_password == null)
                _password = "";

            Properties props = new Properties();		//프로퍼티 생성.
            props.put("user", _user);					//user를 프로퍼티에 put한다.
            props.put("password", _password);			//password를 프로퍼티에 put한다.

            con = DriverManager.getConnection(_url, props);		//커넥션을 생성한다.
        } catch (Throwable t) {
            throw new SQLException(t.getMessage());
        }

        return con;
    }


    /** Closes all connections and clears out the connection pool */
    /**  사용중이 아닌 모든 커넥션을 종료하고 커넥션풀에서 제거한다. 
     * 
     */
    public void releaseFreeConnections() {
        trace("ConnectionPoolManager.releaseFreeConnections()");

        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if (!co.inUse)				//커넥션 사용여부 체크
                removeConnection(co.connection);		//커넥션을 종료하고, 커넥션풀에서 제거
        }
    }


    /** Closes all connections and clears out the connection pool */
    /**모든 커넥션을 강제종료하고, 커넥션풀을 초기화 한다.
     * 
     */
    public void finalize() {
        trace("ConnectionPoolManager.finalize()");

        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            try {
                co.connection.close();		//커넥션 강제 종료
            } catch (Exception e) {
                e.printStackTrace();
            }

            co = null;
        }

        connections.removeAllElements();		//커넥션풀을 모두 제거
    }

    /**
    * DBConnectionMgr 클래스 안에서만 로그를 찍는다. 
    * _traceOn 이 true 인 경우만 
	*/
    private void trace(String s) {
        if (_traceOn)
            System.err.println(s);
    }
}
/**커넥션풀 사용여부 관리 클래스
 * 
 * 
 */
class ConnectionObject {
    public java.sql.Connection connection = null;
    public boolean inUse = false;

    public ConnectionObject(Connection c, boolean useFlag) {
        connection = c;
        inUse = useFlag;
    }
}
