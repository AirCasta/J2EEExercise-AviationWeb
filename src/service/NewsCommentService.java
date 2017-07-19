package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.NewsCommentDao;
import model.Comment;
import model.NewsComment;

public class NewsCommentService {
	private NewsCommentDao newsCommentDao=new NewsCommentDao();
	public int getCount(int n_Id) throws SQLException{
		return newsCommentDao.getCommentNumber(n_Id);
	}
	public List<Comment> getNewsComment(int n_Id){
		List<Map<String,Object>> params=new ArrayList<>();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("name", "id_n");
		map.put("rel", "=");
		map.put("value", n_Id);
		params.add(map);
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "id");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 3);
		return newsCommentDao.querySpecifiedComments(params, order, limit);
	}
	public void addNewsComment(NewsComment nc){
		newsCommentDao.addComment(nc);
	}
}
