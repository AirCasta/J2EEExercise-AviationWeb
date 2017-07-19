package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBHelper {
	private static final String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String dbURL="jdbc:sqlserver://localhost:1433;DatabaseName=Aviation";
    private static final String username="root";
    private static final String password="root";
    
    private static Connection conn=null;
    
    static{
    	try {
			Class.forName(driverName);
			conn=DriverManager.getConnection(dbURL,username,password);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    }
    
    public static final Connection getConnection() throws SQLException{
    	if(conn==null){
    		conn=DriverManager.getConnection(dbURL,username,password);
    	}
    	return conn;
    }
    
}
