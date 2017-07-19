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
import model.NewsComment;
import util.DBHelper;

public class NewsCommentDao extends CommentDao{

	@Override
	public void addComment(Comment c) {
		NewsComment nc=(NewsComment)c;
		try {
			Connection conn=DBHelper.getConnection();
			String sql=""+" insert into comment_n"
				+" (comment,id_u,id_n)"
				+" values(?,?,?) ";
			PreparedStatement ppsm=conn.prepareStatement(sql);
			ppsm.setString(1, nc.getComment());
			ppsm.setString(2, nc.getUserId());
			ppsm.setInt(3, nc.getNewsId());
			ppsm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteComment(int id) {
		try {
			Connection conn=DBHelper.getConnection();
			String sql=" delete from comment_n"
					+" where id= ? ";
			PreparedStatement ppsm=conn.prepareStatement(sql);
			ppsm.setInt(1, id);
			ppsm.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
			sb.append(" select * from comment_n where 1=1");
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
			NewsComment nc=null;
			while(rs.next()){
				nc=new NewsComment();
				nc.setId(rs.getInt("id"));
				nc.setComment(rs.getString("comment"));
				nc.setUserId(rs.getString("id_u"));
				nc.setNewsId(rs.getInt("id_n"));
				result.add(nc);
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
			String sql=""+" update comment_n "
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
		Connection conn=DBHelper.getConnection();
		String sql=" select count(1) from comment_n where id_n= "+id;
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ResultSet rs=ppsm.executeQuery();
		int count=0;
		if(rs.next()){
			count=rs.getInt(1);
		}
		return count;
	}
}
