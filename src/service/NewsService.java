package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.NewsDao;
import model.News;

public class NewsService {
	private NewsDao newsDao=new NewsDao();
	public List<News> queryAll() throws SQLException{
		Map<String,Object> order=new HashMap<String, Object>();
		order.put("name", "time_n");
		order.put("order", "desc");
		List<News> newsList=newsDao.queryNews(null,order); 
		return newsList;
	}
	public News query(int n_ID) throws SQLException{
		List<Map<String,Object>> params=new ArrayList<Map<String,Object>>();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("name","Id_n");
		map.put("rel","=");
		map.put("value", n_ID);
		params.add(map);
		News news=newsDao.queryNews(params, null).get(0);
		return news;
	}
	public List<News> querySlide() throws SQLException{
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "time_n");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 4);
		return newsDao.querySpecifiedNews(null, order, limit);
	}
	public News queryAvition() throws SQLException{
		List<Map<String,Object>> params=new ArrayList<Map<String,Object>>();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("name","attribute");
		map.put("rel","=");
		map.put("value", "\'"+"航空新闻"+"\'");
		params.add(map);
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "time_n");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 1);
		return newsDao.querySpecifiedNews(params, order, limit).get(0);
	}
	public News queryInfor() throws SQLException{
		List<Map<String,Object>> params=new ArrayList<Map<String,Object>>();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("name","attribute");
		map.put("rel","=");
		map.put("value", "\'"+"航空通知"+"\'");
		params.add(map);
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "time_n");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 1);
		return newsDao.querySpecifiedNews(params, order, limit).get(0);
	}
	public News queryNewest() throws SQLException{
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "time_n");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 1);
		return newsDao.querySpecifiedNews(null, order, limit).get(0);
	}
	public List<News> queryNewsList(int page) throws SQLException {
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "time_n");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", page);
		limit.put("fetch", 20);
		return newsDao.querySpecifiedNews(null, order, limit);
	}
	public List<News> queryRelativeNews(String attribute) throws SQLException {
		List<Map<String,Object>> params=new ArrayList<Map<String,Object>>();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("name","attribute");
		map.put("rel","=");
		map.put("value", "\'"+attribute+"\'");
		params.add(map);
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "time_n");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 4);
		return newsDao.querySpecifiedNews(params, order, limit);
	}
	public Object queryNewsRank() throws SQLException {
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "clicks");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 3);
		return newsDao.querySpecifiedNews(null, order, limit);
	}
	public void add(News news) throws SQLException{
		newsDao.addNews(news);
	}
	public void delete(int n_Id) throws SQLException{
		newsDao.deleteNews(n_Id);
	}
	public void update(News news) throws SQLException{
		newsDao.updateNews(news);
	}
}
