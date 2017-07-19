package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Comment;
import model.InformationComment;
import util.DBHelper;

public class InformationCommentDao extends CommentDao{

	@Override
	public void addComment(Comment c) {
		InformationComment ifc=(InformationComment)c;
		try {
			Connection conn=DBHelper.getConnection();
			String sql=""+" insert into comment_i"
				+" (comment,id_u,name)"
				+" values(?,?,?) ";
			System.out.println(ifc.getName());
			PreparedStatement ppsm=conn.prepareStatement(sql);
			ppsm.setString(1, ifc.getComment());
			ppsm.setString(2, ifc.getUserId());
			ppsm.setString(3, ifc.getName());
			ppsm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteComment(int id) {
		try {
			Connection conn=DBHelper.getConnection();
			String sql=" delete from comment_i"
					+" where id= ? ";
			PreparedStatement ppsm=conn.prepareStatement(sql);
			ppsm.setInt(1, id);
			ppsm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Comment> queryComments(List<Map<String,Object>> params) {
		return querySpecifiedComments(params, null, null);
	}
	
	@Override
	public List<Comment> querySpecifiedComments(List<Map<String, Object>> params, Map<String, Object> order,
			Map<String, Integer> limit) {
		try {
			List<Comment> result=new ArrayList<Comment>();
			Connection conn=DBHelper.getConnection();
			int pageRows=20;
			StringBuilder sb=new StringBuilder();
			sb.append(" select * from comment_i where 1=1");
			if(params!=null&&params.size()>0){
				for(int i=0;i<params.size();i++){
					Map<String,Object> map=params.get(i);
					sb.append(" and "+map.get("name")+" "+map.get("rel")+" "
							+map.get("value")+" ");
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
			InformationComment ifc=null;
			while(rs.next()){
				ifc=new InformationComment();
				ifc.setId(rs.getInt("id"));
				ifc.setComment(rs.getString("comment"));
				ifc.setUserId(rs.getString("id_u"));
				ifc.setName(rs.getString("name"));
				result.add(ifc);
			}
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public void updateComment(Comment c) {
		try {
			Connection conn=DBHelper.getConnection();
			String sql=""+" update comment_i "
					+" set comment=?"
					+" where id=?";
			PreparedStatement ppsm=conn.prepareStatement(sql);
			ppsm.setString(1, c.getComment());
			ppsm.setInt(2, c.getId());
			ppsm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getCommentNumber(int id) throws SQLException {
		return 0;
	}
	public int getCommentNumber(String name) throws SQLException {
		Connection conn=DBHelper.getConnection();
		String sql=" select count(1) from comment_i where name= \'"+name+"\'";
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ResultSet rs=ppsm.executeQuery();
		int count=0;
		if(rs.next()){
			count=rs.getInt(1);
		}
		return count;
	}
}
