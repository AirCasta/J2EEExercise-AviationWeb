package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Enterprise;
import util.DBHelper;

public class EnterpriseDao {
	public void addEnterprise(Enterprise e) throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" insert into enterprise"
				+" (name,content)"
				+" value(?,?)";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setString(1, e.getName());
		ppsm.setString(2, e.getContent());
		ppsm.execute();
	}
	public void deleteEnterprise(String name) throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" delete from enterprise"
				+" where name=?";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setString(1, name);
		ppsm.execute();
	}
	public List<Enterprise> queryEnterprises(List<Map<String, Object>> params) throws SQLException{
		return querySpecifiedEnterprises(params, null, null);
	}
	public List<Enterprise> querySpecifiedEnterprises(List<Map<String,Object>> params,Map<String,Object> order,Map<String,Integer> limit) throws SQLException{
		Connection conn=DBHelper.getConnection();
		int pageRows=20;
		StringBuilder sb=new StringBuilder();
		sb.append(" select * from enterprise where 1=1");
		if(params!=null&&params.size()>0){
			for(int i=0;i<params.size();i++){
				Map<String,Object> map=params.get(i);
				sb.append(" and "+map.get("name")+" "+map.get("rel")+" "+map.get("value")+" ");
			}
		}
		if(order!=null){
			sb.append(" order by "+order.get("name")+" "+order.get("order"));
		}
		if(limit!=null){
			sb.append(" OFFSET "+(limit.get("page")*pageRows)+" ROWS FETCH NEXT "+limit.get("fetch")+" ROWS ONLY");
		}
		//System.out.println(sb.toString());
		List<Enterprise> result =new ArrayList<Enterprise>();
		Enterprise e=null;
		PreparedStatement ppsm=conn.prepareStatement(sb.toString());
		ResultSet rs=ppsm.executeQuery();
		while(rs.next()){
			e=new Enterprise();
			e.setName(rs.getString("name"));
			e.setContent(rs.getString("content"));
			result.add(e);
		}
		return result;
	}
	public void updateEnterprise(Enterprise e) throws SQLException{
		Connection conn=DBHelper.getConnection();
		String sql=""+" update enterprise"
				+" set content=?"
				+" where name=?";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ppsm.setString(1, e.getContent());
		ppsm.setString(2, e.getName());
		ppsm.execute();
	}
}
