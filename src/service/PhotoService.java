package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.PhotoDao;
import model.Photo;

public class PhotoService {
	private PhotoDao photoDao=new PhotoDao();
	public List<Photo> queryAll() throws SQLException{
		Map<String, Object> order=new HashMap<>();
		order.put("name", "time_p");
		order.put("order", "desc");
		return photoDao.queryPhoto(null, order);
	}
	public List<Photo> queryAtlas(String atlas_name) throws SQLException {
		List<Map<String,Object>> params =new ArrayList<>();
		Map<String, Object> map=new HashMap<>();
		map.put("name", "atlas_Name");
		map.put("rel", "=");
		map.put("value", "\'"+atlas_name+"\'");
		params.add(map);
		Map<String, Object> order=new HashMap<>();
		order.put("name", "time_p");
		order.put("order", "desc");
		return photoDao.queryPhoto(params, order);
	}
	public List<Photo> queryAllAtlas() throws SQLException {
		return photoDao.queryAtlas();
	}
	public List<Photo> queryIndexAtlas() throws SQLException {
		return photoDao.queryIndexAtlas();
	}
	public void add(Photo photo) throws SQLException {
		// TODO Auto-generated method stub
		photoDao.addPhoto(photo);
	}
	public void delete(int id) throws SQLException{
		photoDao.deletePhoto(id);
	}
}
