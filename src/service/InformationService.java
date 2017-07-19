package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.InformationDao;
import model.Information;

public class InformationService {
	private InformationDao informationDao=new InformationDao();
	public List<Information> queryAll() throws SQLException{
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "time_i");
		order.put("order", "desc");
		return informationDao.queryInformation(null, order);
	}
	public Information query(int i_Id) throws SQLException {
		List<Map<String,Object>> params=new ArrayList<Map<String,Object>>();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("name", "Id_i");
		map.put("rel", "=");
		map.put("value", i_Id);
		return informationDao.queryInformation(params, null).get(0);
	}
	public List<Information> getEnterpriseInformation(String name) throws SQLException{
		List<Map<String,Object>> params=new ArrayList<>();
		Map<String,Object> map=new HashMap<>();
		map.put("name", "name");
		map.put("rel", "=");
		map.put("value", "\'"+name+"\'");
		params.add(map);
		return informationDao.querySpecifiedInformation(params, null, null);
	}
	public void delete(int i_Id) throws SQLException{
		informationDao.deleteInformation(i_Id);
	}
	public void add(Information i) throws SQLException{
		informationDao.addInformation(i);
	}
	public void update(Information i) throws SQLException{
		informationDao.updateInformation(i);
	}
}
