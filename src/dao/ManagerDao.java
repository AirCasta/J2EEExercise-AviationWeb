package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Manager;
import util.DBHelper;

public class ManagerDao {
	public Manager queryManager(int id) throws SQLException{
		Connection conn=DBHelper.getConnection();
		Manager m=null;
		String sql=""+" select * from manager"
				+" where id_m=?";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setInt(1, id);
		ResultSet rs=ppsm.executeQuery();
		while(rs.next()){
			m=new Manager();
			m.setM_Id(rs.getInt("Id_m"));
			m.setM_Name(rs.getString("Name_m"));
			m.setM_Password(rs.getString("password_m"));
		}
		return m;
	}
}
