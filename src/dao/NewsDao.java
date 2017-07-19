package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import model.News;
import util.DBHelper;

public class NewsDao {
	public void addNews(News n) throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" insert into news"
				+" (Name_n,content_n,address_n,attribute,clicks,time_n)"
				+" values(?,?,?,?,0,getdate())";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setString(1, n.getN_Name());
		ppsm.setString(2, n.getN_Content());
		ppsm.setString(3, n.getN_Address());
		ppsm.setString(4, n.getN_Attribute());
		ppsm.execute();
	}
	public void deleteNews(int id)throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" delete from news"
				+" where Id_n = ?";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setInt(1, id);
		ppsm.execute();
	}
	
	public List<News> queryNews (List<Map<String,Object>> params,Map<String,Object> order) throws SQLException{
		return querySpecifiedNews(params, order, null);
	}
	
	public List<News> querySpecifiedNews (List<Map<String,Object>> params,Map<String,Object> order,Map<String,Integer> limit) throws SQLException{
		Connection conn=DBHelper.getConnection();
		int pageRows=20;
		StringBuilder sb=new StringBuilder();
		sb.append(" select * from news where 1=1 ");
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
		List<News> result=new ArrayList<News>();
		News n=null;
		while(rs.next()){
			n=new News();
			n.setN_Id(rs.getInt("Id_n"));
			n.setN_Name(rs.getString("Name_n"));
			n.setN_Content(rs.getString("content_n"));
			n.setN_Address(rs.getString("address_n"));
			n.setN_Attribute(rs.getString("attribute"));
			n.setN_Clicks(rs.getInt("clicks"));
			n.setCreate_Date(new Date(rs.getDate("time_n").getTime()));
			result.add(n);
			//System.out.println(n.getN_Name()+" "+n.getN_Attribute()+" "+n.getN_Content()+" "+n.getN_Address());
		}
		return result;
	}
	public void updateNews(News n) throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" update news"
				+" set Name_n=?,content_n=?,address_n=?,"
				+ "attribute=?,clicks=? "
				+" where Id_n=?";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setString(1, n.getN_Name());
		ppsm.setString(2, n.getN_Content());
		ppsm.setString(3, n.getN_Address());
		ppsm.setString(4, n.getN_Attribute());
		ppsm.setInt(5, n.getN_Clicks());
		ppsm.setInt(6, n.getN_Id());
		//System.out.println(n.getN_Name()+" "+n.getN_Attribute()+" "+n.getN_Content()+" "+n.getN_Address()+" "+n.getN_Id());
		ppsm.execute();
	}
}
