package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Information;
import util.DBHelper;

public class InformationDao {
	public void addInformation(Information i) throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" insert into information"
				+" (Name_i,content_i,address_i,attribute,clicks,name,time_i)"
				+" values(?,?,?,?,0,?,getdate())";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setString(1, i.getI_Name());
		ppsm.setString(2, i.getI_Content());
		ppsm.setString(3, i.getI_Address());
		ppsm.setString(4, i.getI_Attribute());
		ppsm.setString(5, i.getName());
		ppsm.execute();
	}
	public void deleteInformation(int id)throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" delete from information"
				+" where Id_i = ?";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setInt(1, id);
		ppsm.execute();
	}
	public List<Information> queryInformation (List<Map<String,Object>> params,Map<String,Object> order) throws SQLException{
		return querySpecifiedInformation(params, order,null);
	}
	public List<Information> querySpecifiedInformation (List<Map<String, Object>> params, Map<String, Object> order,
			Map<String, Integer> limit) throws SQLException{
		Connection conn=DBHelper.getConnection();
		int pageRows=20;
		StringBuilder sb=new StringBuilder();
		sb.append(" select * from information where 1=1 ");
		if(params!=null&&params.size()>0){
			for(int i=0;i<params.size();i++){
				Map<String,Object> map=params.get(i);
				sb.append("and "+map.get("name")+" "+map.get("rel")+" "+map.get("value")+" ");
			}
		}
		if(order!=null){
			sb.append(" order by "+order.get("name")+" "+order.get("order"));
		}
		if(limit!=null){
			sb.append(" OFFSET "+(limit.get("page")*pageRows)+" ROWS FETCH NEXT "+limit.get("fetch")+" ROWS ONLY");
		}
		PreparedStatement ppsm=conn.prepareStatement(sb.toString());
		ResultSet rs= ppsm.executeQuery();
		List<Information> result=new ArrayList<Information>();
		Information i=null;
		while(rs.next()){
			i=new Information();
			i.setI_Id(rs.getInt("Id_i"));
			i.setI_Name(rs.getString("Name_i"));
			i.setI_Content(rs.getString("content_i"));
			i.setI_Address(rs.getString("address_i"));
			i.setI_Attribute(rs.getString("attribute"));
			i.setI_Clicks(rs.getInt("clicks"));
			i.setName(rs.getString("name"));
			i.setCreate_Date(rs.getDate("time_i"));
			result.add(i);
		}
		return result;
	}
	public void updateInformation(Information i) throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" update information"
				+" set Name_i=?,content_i=?,address_i=?,"
				+ "attribute=?,clicks=?,name=? "
				+" where id=?";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setString(1, i.getI_Name());
		ppsm.setString(2, i.getI_Content());
		ppsm.setString(3, i.getI_Address());
		ppsm.setString(4, i.getI_Attribute());
		ppsm.setInt(5, i.getI_Clicks());
		ppsm.setString(6, i.getName());
		ppsm.setInt(7, i.getI_Id());
		ppsm.execute();
	}
}
