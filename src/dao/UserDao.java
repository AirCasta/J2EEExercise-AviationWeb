package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;

import cn.itcast.jdbc.TxQueryRunner;
import model.User;
import util.DBHelper;

public class UserDao {
	private QueryRunner qr=new TxQueryRunner();
	public void addUser(User u) throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" insert into users"
				+" (Id_u,Name_u,Password_u,email,sex)"
				+" values(?,?,?,?,?)";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setString(1,u.getU_Id());
		ppsm.setString(2,u.getU_Name());
		ppsm.setString(3,u.getU_Password());
		ppsm.setString(4, u.getEmail());
		ppsm.setInt(5, u.getSex());
		ppsm.execute();
	}
	public void updateUser(User u) throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" update users"
				+" set Name_u=?,Password_u=?,email=?,sex=?"
				+" where Id_u=? ";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setString(1,u.getU_Name());
		ppsm.setString(2,u.getU_Password());
		ppsm.setString(3,u.getEmail());
		ppsm.setInt(4,u.getSex());
		ppsm.setString(5,u.getU_Id());
		ppsm.execute();
	}
	public List<User> queryUsers(List<Map<String, Object>> params) throws SQLException{
		List<User> result=new ArrayList<User>();
		Connection conn=DBHelper.getConnection();
		StringBuilder sb=new StringBuilder();
		sb.append("select * from users where 1=1");
		if(params!=null&&params.size()>0){
			for(int i=0;i<params.size();i++){
				Map<String,Object> map=params.get(i);
				sb.append(" and "+map.get("name")+" "+map.get("rel")+" '"
						+map.get("value")+"' ");
			}
		}
		PreparedStatement ppsm=conn.prepareStatement(sb.toString());
		System.out.println(sb.toString());
		ResultSet rs=ppsm.executeQuery();
		User u;
		while(rs.next()){
			u=new User();
			u.setU_Id(rs.getString("Id_u"));
			u.setU_Name(rs.getString("Name_u"));
			u.setU_Password(rs.getString("Password_u"));
			u.setEmail(rs.getString("email"));
			u.setSex(rs.getInt("sex"));
			result.add(u);
		}
		return result;
	}
	public User queryUserById(String id) throws SQLException{
		User u=null;
		List<Map<String,Object>> l=new ArrayList<>();
		Map<String,Object> m=new HashMap<String, Object>();
		m.put("name", "Id_u");
		m.put("rel", "=");
		m.put("value", id);
		l.add(m);
		List<User> result=queryUsers(l);
		if(result!=null&&result.size()>0)
			u=result.get(0);
		return u;
	}
	public User queryUserByEmail(String email) throws SQLException{
		User u=null;
		List<Map<String,Object>> l=new ArrayList<>();
		Map<String,Object> m=new HashMap<String, Object>();
		m.put("name", "email");
		m.put("rel", "=");
		m.put("value", email);
		l.add(m);
		List<User> result=queryUsers(l);
		if(result!=null&&result.size()>0)
			u=result.get(0);
		return u;
	}
}
