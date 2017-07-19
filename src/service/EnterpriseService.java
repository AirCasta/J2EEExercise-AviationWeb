package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.EnterpriseDao;
import model.Enterprise;

public class EnterpriseService {
	private EnterpriseDao enterpriseDao=new EnterpriseDao();
	public List<Enterprise> queryIndexEnterprise() throws SQLException{
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "name");
		order.put("order", "asc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 3);
		return enterpriseDao.querySpecifiedEnterprises(null, order, limit);
	}
	public List<Enterprise> queryEnterpriseList(int page) throws SQLException{
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "name");
		order.put("order", "asc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", page);
		limit.put("fetch", 20);
		return enterpriseDao.querySpecifiedEnterprises(null, order, limit);
	}
	public Enterprise query(String name) throws SQLException {
		List<Map<String,Object>> params=new ArrayList<>();
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", "name");
		map.put("rel", "=");
		map.put("value", "\'"+name+"\'");
		//System.out.println(name);
		params.add(map);
		return enterpriseDao.queryEnterprises(params).get(0);
	}
}
