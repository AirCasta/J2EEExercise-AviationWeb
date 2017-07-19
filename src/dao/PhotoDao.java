package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import model.Photo;
import util.DBHelper;

public class PhotoDao {
	public void addPhoto(Photo p) throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" insert into photos"
				+" (ph_Name,ph_Address,ph_Attribute,atlas_Name,time_p)"
				+" values(?,?,?,?,getdate())";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setString(1, p.getPh_Name());
		ppsm.setString(2, p.getPh_Address());
		ppsm.setString(3, p.getPh_Attribute());
		ppsm.setString(4, p.getAtlas_Name());
		ppsm.execute();
	}
	public void deletePhoto(int id)throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" delete from photos"
				+" where ph_Id = ?";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setInt(1, id);
		ppsm.execute();
	}
	
	public List<Photo> queryPhoto (List<Map<String,Object>> params,Map<String,Object> order) throws SQLException{
		return querySpecifiedPhoto(params, order, null);
	}
	
	public List<Photo> querySpecifiedPhoto (List<Map<String,Object>> params,Map<String,Object> order,Map<String,Integer> limit) throws SQLException{
		Connection conn=DBHelper.getConnection();
		int pageRows=20;
		StringBuilder sb=new StringBuilder();
		sb.append(" select * from photos where 1=1 ");
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
		System.out.println(sb.toString());
		PreparedStatement ppsm=conn.prepareStatement(sb.toString());
		ResultSet rs= ppsm.executeQuery();
		List<Photo> result=new ArrayList<Photo>();
		Photo p=null;
		while(rs.next()){
			p=new Photo();
			p.setPh_Id(rs.getInt("ph_Id"));
			p.setPh_Name(rs.getString("ph_Name"));
			p.setPh_Attribute(rs.getString("ph_Attribute"));
			p.setPh_Address(rs.getString("ph_Address"));
			p.setAtlas_Name(rs.getString("atlas_Name"));
			p.setTime_p(new Date(rs.getDate("time_p").getTime()));
			result.add(p);
			//System.out.println(n.getN_Name()+" "+n.getN_Attribute()+" "+n.getN_Content()+" "+n.getN_Address());
		}
		return result;
	}
	public void updatePhoto(Photo p) throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" update photos"
				+" set ph_Name=?,ph_Address=?,ph_Attribute=?,"
				+ "atlas_Name=? "
				+" where ph_Id=?";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setString(1, p.getPh_Name());
		ppsm.setString(2, p.getPh_Address());
		ppsm.setString(3, p.getPh_Attribute());
		ppsm.setString(4, p.getAtlas_Name());
		ppsm.setInt(6, p.getPh_Id());
		//System.out.println(n.getN_Name()+" "+n.getN_Attribute()+" "+n.getN_Content()+" "+n.getN_Address()+" "+n.getN_Id());
		ppsm.execute();
	}
	public List<Photo> queryIndexAtlas() throws SQLException {
		Connection conn=DBHelper.getConnection();
		String sql="select * from photos where ph_Id "
				+ "in (select min(ph_Id) from photos group by atlas_Name)"
				+ " OFFSET 0 ROWS FETCH NEXT 6 ROWS ONLY";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ResultSet rs=ppsm.executeQuery();
		List<Photo> result=new ArrayList<Photo>();
		Photo p=null;
		while(rs.next()){
			p=new Photo();
			p.setPh_Id(rs.getInt("ph_Id"));
			p.setPh_Name(rs.getString("ph_Name"));
			p.setPh_Attribute(rs.getString("ph_Attribute"));
			p.setPh_Address(rs.getString("ph_Address"));
			p.setAtlas_Name(rs.getString("atlas_Name"));
			p.setTime_p(new Date(rs.getDate("time_p").getTime()));
			result.add(p);
		}
		return result;
	}
	public List<Photo> queryAtlas() throws SQLException {
		Connection conn=DBHelper.getConnection();
		String sql="select * from photos where ph_Id in (select min(ph_Id) from photos group by atlas_Name)";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ResultSet rs=ppsm.executeQuery();
		List<Photo> result=new ArrayList<Photo>();
		Photo p=null;
		while(rs.next()){
			p=new Photo();
			p.setPh_Id(rs.getInt("ph_Id"));
			p.setPh_Name(rs.getString("ph_Name"));
			p.setPh_Attribute(rs.getString("ph_Attribute"));
			p.setPh_Address(rs.getString("ph_Address"));
			p.setAtlas_Name(rs.getString("atlas_Name"));
			p.setTime_p(new Date(rs.getDate("time_p").getTime()));
			result.add(p);
		}
		return result;
	}
}
