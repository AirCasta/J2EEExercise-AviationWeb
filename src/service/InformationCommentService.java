package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.InformationCommentDao;
import model.Comment;
import model.InformationComment;

public class InformationCommentService {
	private InformationCommentDao informationCommentDao=new InformationCommentDao();
	public int getCount(String name) throws SQLException{
		return informationCommentDao.getCommentNumber(name);
	}
	public List<Comment> getInformationCommentList(String name){
		List<Map<String,Object>> params=new ArrayList<>();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("name", "name");
		map.put("rel", "=");
		map.put("value", "\'"+name+"\'");
		params.add(map);
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "id");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 3);
		return informationCommentDao.querySpecifiedComments(params, order, limit);
	}
	public void addInformationComment(InformationComment ic){
		informationCommentDao.addComment(ic);
	}
}
