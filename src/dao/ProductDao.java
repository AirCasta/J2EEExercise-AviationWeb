package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import model.Comment;
import model.Product;
import util.DBHelper;

public class ProductDao {
	public void addProduct(Product p) throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" insert into product"
				+" (Name_p,content_p,address_p,attribute,clicks,time_p)"
				+" values(?,?,?,?,0,getdate())";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setString(1, p.getP_Name());
		ppsm.setString(2, p.getP_Content());
		ppsm.setString(3, p.getP_Address());
		ppsm.setString(4, p.getP_Attribute());
		ppsm.execute();
	}
	public void deleteProduct(int id)throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" delete from product"
				+" where Id_p = ?";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setInt(1, id);
		ppsm.execute();
	}
	public List<Product> queryProduct (List<Map<String,Object>> params,Map<String,Object> order) throws SQLException{
		return querySpecifiedProduct(params, order, null);
	}
	public List<Product> querySpecifiedProduct (List<Map<String, Object>> params, Map<String, Object> order,
			Map<String, Integer> limit) throws SQLException{
		Connection conn=DBHelper.getConnection();
		int pageRows=20;
		StringBuilder sb=new StringBuilder();
		sb.append(" select * from product where 1=1 ");
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
		//System.out.println(sb.toString());
		PreparedStatement ppsm=conn.prepareStatement(sb.toString());
		ResultSet rs= ppsm.executeQuery();
		List<Product> result=new ArrayList<Product>();
		Product p=null;
		while(rs.next()){
			p=new Product();
			p.setP_Id(rs.getInt("Id_p"));
			p.setP_Name(rs.getString("Name_p"));
			p.setP_Content(rs.getString("content_p"));
			p.setP_Address(rs.getString("address_p"));
			p.setP_Attribute(rs.getString("attribute"));
			p.setP_Clicks(rs.getInt("clicks"));
			p.setCreate_Date(new Date(rs.getDate("time_p").getTime()));
			result.add(p);
		}
		return result;
	}
	public void updateProduct(Product p) throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" update product"
				+" set Name_p=?,content_p=?,address_p=?,"
				+ "attribute=?,clicks=? "
				+" where Id_p=?";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setString(1, p.getP_Name());
		ppsm.setString(2, p.getP_Content());
		ppsm.setString(3, p.getP_Address());
		ppsm.setString(4, p.getP_Attribute());
		ppsm.setInt(5, p.getP_Clicks());
		ppsm.setInt(6, p.getP_Id());
		ppsm.execute();
	}
}
