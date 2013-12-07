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
public class DBConnectionMgr {			//DB ������� Ŭ����
    private Vector connections = new Vector(10);
    private String _driver = "oracle.jdbc.driver.OracleDriver",
    _url = 	"jdbc:oracle:thin:@39.115.114.228:1521:xe",
    _user = "system",		//DB����
    _password = "oracle";		//DB��й�ȣ
    private boolean _traceOn = false;		//oc4j ��� ����
    private boolean initialized = false;
    private int _openConnections = 10;	//����� ���ؼ� ���� ����
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

    //Ŀ�ؼ� Ǯī��Ʈ ����
    public void setOpenConnectionCount(int count) {
        _openConnections = count;
    }

    //�α� ��뿩�� ����
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
    /** Ŀ�ؼ�Ǯ�� �ִ� Ŀ�ؼ� ��
     * 
     * @return
     */
    public int getConnectionCount() {
        return connections.size();
    }


    /** Returns an unused existing or new connection.  */
    /** �����ϴ� Ŀ�ؼ��� ������� ���� Ŀ�ؼ� �Ǵ� ���ο�Ŀ�ؼ��� ����
     * 
     * @return
     * @throws Exception
     */
    public synchronized Connection getConnection()
            throws Exception {
        if (!initialized) {		//initialized=false �� ���
            Class c = Class.forName(_driver);	//� Driver�� Ŀ�ؼ��� �����Ѵٴ� ������ �ʿ� (DB2, MS-SQL, MySQL, ORACLE)
            DriverManager.registerDriver((Driver) c.newInstance());	//Driver�� ���ο� �ν��Ͻ��� �����ϰ�, DriverManager�� ���� ���

            initialized = true;		//�ѹ��� ����Ҽ� �ֵ��� initialized�� true�� ����
        }


        Connection c = null;
        ConnectionObject co = null;
        boolean badConnection = false;

        //Ŀ�ؼ��� ��� ���� Ŀ�ؼ�Ǯ�� �˻��ϱ� ���� �ݺ���
        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);	//Ŀ�ؼ��� ��´�.

            // If connection is not in use, test to ensure it's still valid!
            if (!co.inUse) {	//Ŀ�ؼ� ��뿩�� üũ
                try {
                    badConnection = co.connection.isClosed();	//��������ʴ� Ŀ�ؼ��� ���, �ٽ��ѹ� Ŀ�ؼ��� ����Ǿ����� üũ
                    if (!badConnection)		//Ŀ�ؼ��� ������� ������....
                        badConnection = (co.connection.getWarnings() != null);
                    	//getWarnings �� Ŀ�ؼ� ��ü�� ȣ�⿡ ���� ��� �ִ��� üũ. ������ SQLWarning, ������ null ��ȯ
                } catch (Exception e) {
                    badConnection = true;
                    e.printStackTrace();
                }

                // Connection is bad, remove from pool
                if (badConnection) {	//�ùٸ��� ������� ���� Ŀ�ؼ��� ������...
                    connections.removeElementAt(i);		//Ŀ�ؼ�Ǯ���� ����
                    trace("ConnectionPoolManager: Remove disconnected DB connection #" + i);
                    continue;
                }

                c = co.connection;		//���������� ������� �ʴ� Ŀ�ؼ��� �ִ°�� Ŀ�ؼ��� ���
                co.inUse = true;		//Ŀ�ؼ� ������ Ŭ����(ConnectionObject)�� �� Ŀ�ؼ��� ����̶�� �����Ѵ�. 

                trace("ConnectionPoolManager: Using existing DB connection #" + (i + 1));
                break;
            }
        }

        if (c == null) {		//������ ����������, ������� �ʴ� Ŀ�ؼ��� ������
            c = createConnection();		//���ο� Ŀ�ؼ� ����
            co = new ConnectionObject(c, true);		//Ŀ�ؼǻ�����Ŭ����(ConnectionObject) ����
            connections.addElement(co);		//Ŀ�ؼ�Ǯ�� ���

            trace("ConnectionPoolManager: Creating new DB connection #" + connections.size());
        }

        return c;
    }


    /** Marks a flag in the ConnectionObject to indicate this connection is no longer in use */
    /** Ŀ�ؼ��� �����Ű�ų� ��������� �Ѵ�.
     * 
     * @param c
     */
    public synchronized void freeConnection(Connection c) {
        if (c == null)		//Ŀ�ؼ��� ������ ����
            return;

        ConnectionObject co = null;
        //Ŀ�ؼ�Ǯ���� �ش� Ŀ�ؼ��� �ִ��� ã�´�.
        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if (c == co.connection) {
                co.inUse = false;		//�ش� Ŀ�ؼ��� ������ �������
                break;
            }
        }
        //Ŀ�ؼ�Ǯ�� �ִ� Ŀ�ؼ��߿� ����� Ŀ�ؼ� ���� ū�� üũ. 
        //Ŭ ��� Ŀ�ؼ� ����
        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if ((i + 1) > _openConnections && !co.inUse)		// Ŀ�ؼ�Ǯ�� ũ�Ⱑ ����� Ŀ�ؼ��� �������� ũ�� ��������� Ŀ�ؼ� ���� üũ  

                removeConnection(co.connection);		//Ŀ�ؼ� ����, Ŀ�ؼǻ�����Ŭ����(ConnectionObject)���� ����
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
    /** Ŀ�ؼ��� �����ϰ� Ŀ�ؼ�Ǯ���� �����Ѵ�.
     * 
     * @param c
     */
    public synchronized void removeConnection(Connection c) {
        if (c == null)		//Ŀ�ؼ��� null�̸� ����.
            return;

        ConnectionObject co = null;
        //Ŀ�ؼ�Ǯ���� �ش� Ŀ�ؼ��� �ִ��� üũ�Ѵ�.
        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if (c == co.connection) {		//�ش� Ŀ�ؼ��� ������
                try {
                    c.close();		//Ŀ�ؼ��� �ݴ���.(����)
                    connections.removeElementAt(i);		//Ŀ�ؼ�Ǯ���� �ش�Ŀ�ؼ��� �����Ѵ�.
                    trace("Removed " + c.toString());
                } catch (Exception e) {
                    e.printStackTrace();
                }

                break;
            }
        }
    }

    //Ŀ�ؼ� ����
    private Connection createConnection()
            throws SQLException {
        Connection con = null;

        try {
            if (_user == null)
                _user = "";
            if (_password == null)
                _password = "";

            Properties props = new Properties();		//������Ƽ ����.
            props.put("user", _user);					//user�� ������Ƽ�� put�Ѵ�.
            props.put("password", _password);			//password�� ������Ƽ�� put�Ѵ�.

            con = DriverManager.getConnection(_url, props);		//Ŀ�ؼ��� �����Ѵ�.
        } catch (Throwable t) {
            throw new SQLException(t.getMessage());
        }

        return con;
    }


    /** Closes all connections and clears out the connection pool */
    /**  ������� �ƴ� ��� Ŀ�ؼ��� �����ϰ� Ŀ�ؼ�Ǯ���� �����Ѵ�. 
     * 
     */
    public void releaseFreeConnections() {
        trace("ConnectionPoolManager.releaseFreeConnections()");

        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if (!co.inUse)				//Ŀ�ؼ� ��뿩�� üũ
                removeConnection(co.connection);		//Ŀ�ؼ��� �����ϰ�, Ŀ�ؼ�Ǯ���� ����
        }
    }


    /** Closes all connections and clears out the connection pool */
    /**��� Ŀ�ؼ��� ���������ϰ�, Ŀ�ؼ�Ǯ�� �ʱ�ȭ �Ѵ�.
     * 
     */
    public void finalize() {
        trace("ConnectionPoolManager.finalize()");

        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            try {
                co.connection.close();		//Ŀ�ؼ� ���� ����
            } catch (Exception e) {
                e.printStackTrace();
            }

            co = null;
        }

        connections.removeAllElements();		//Ŀ�ؼ�Ǯ�� ��� ����
    }

    /**
    * DBConnectionMgr Ŭ���� �ȿ����� �α׸� ��´�. 
    * _traceOn �� true �� ��츸 
	*/
    private void trace(String s) {
        if (_traceOn)
            System.err.println(s);
    }
}
/**Ŀ�ؼ�Ǯ ��뿩�� ���� Ŭ����
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
