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
import model.ProductComment;
import util.DBHelper;

public class ProductCommentDao extends CommentDao{

	@Override
	public void addComment(Comment c) {
		ProductComment pc=(ProductComment)c;
		try {
			Connection conn=DBHelper.getConnection();
			String sql=""+" insert into comment_p"
				+" (comment,id_u,id_p)"
				+" values(?,?,?) ";
			PreparedStatement ppsm=conn.prepareStatement(sql);
			ppsm.setString(1, pc.getComment());
			ppsm.setString(2, pc.getUserId());
			ppsm.setInt(3, pc.getProductId());
			ppsm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteComment(int id) {
		try {
			Connection conn=DBHelper.getConnection();
			String sql=" delete from comment_p"
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
			sb.append(" select * from comment_p where 1=1");
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
			ProductComment pc=null;
			while(rs.next()){
				pc=new ProductComment();
				pc.setId(rs.getInt("id"));
				pc.setComment(rs.getString("comment"));
				pc.setUserId(rs.getString("id_u"));
				pc.setProductId(rs.getInt("id_p"));
				result.add(pc);
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
		Connection conn=DBHelper.getConnection();
		String sql=" select count(1) from comment_p where id_p= "+id;
		PreparedStatement ppsm=conn.prepareStatement(sql);
		ResultSet rs=ppsm.executeQuery();
		int count=0;
		if(rs.next()){
			count=rs.getInt(1);
		}
		return count;
	}
}
