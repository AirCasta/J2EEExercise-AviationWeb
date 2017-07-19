package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ProductCommentDao;
import model.Comment;
import model.ProductComment;

public class ProductCommentService {
	private ProductCommentDao productCommentDao=new ProductCommentDao();
	public void addProductComment(ProductComment pc) {
		productCommentDao.addComment(pc);
	}
	public List<Comment> getProductComment(int p_Id){
		List<Map<String,Object>> params=new ArrayList<>();
		Map<String,Object> map=new HashMap<>();
		map.put("name", "id_p");
		map.put("rel", "=");
		map.put("value", p_Id);
		params.add(map);
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "id");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 3);
		return productCommentDao.querySpecifiedComments(params, order, limit);
	}
	public int getCount(int p_Id) throws SQLException{
		return productCommentDao.getCommentNumber(p_Id);
	}
}
