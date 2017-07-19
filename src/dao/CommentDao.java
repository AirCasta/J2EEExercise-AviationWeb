package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import model.Comment;
import model.News;

public abstract class CommentDao {
	public abstract void addComment(Comment c);
	public abstract void deleteComment(int id);
	public abstract List<Comment> queryComments(List<Map<String,Object>> params);
	public abstract List<Comment> querySpecifiedComments(List<Map<String,Object>> params,Map<String,Object> order,Map<String,Integer> limit);
	public abstract void updateComment(Comment c);
	public abstract int getCommentNumber(int id) throws SQLException;
}
