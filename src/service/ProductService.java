package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ProductDao;
import model.Product;

public class ProductService {
	private ProductDao productDao=new ProductDao();
	public List<Product> queryAll() throws SQLException{
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "time_p");
		order.put("order", "desc");
		List<Product> productList=productDao.queryProduct(null,order);
		return productList;
	}
	public Product query(int p_Id) throws SQLException{
		List<Map<String,Object>> params=new ArrayList<Map<String,Object>>();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("name","Id_p");
		map.put("rel", "=");
		map.put("value", p_Id);
		params.add(map);
		Product product=productDao.queryProduct(params, null).get(0);
		return product;
	}
	public Product queryNewest() throws SQLException{
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "time_p");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 1);
		return productDao.querySpecifiedProduct(null, order, limit).get(0);
	}
	public Product queryHottest() throws SQLException{
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "clicks");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 1);
		return productDao.querySpecifiedProduct(null, order, limit).get(0);
	}
	public List<Product> queryIndexProduct() throws SQLException{
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "time_p");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 6);
		return productDao.querySpecifiedProduct(null, order, limit);
	}
	public List<Product> queryProductListByTime(int page) throws SQLException {
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "clicks");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 20);
		return productDao.querySpecifiedProduct(null, order, limit);
	}
	public List<Product> queryProductListByClick(int page) throws SQLException {
		Map<String,Object> order=new HashMap<String,Object>();
		order.put("name", "Id_p");
		order.put("order", "desc");
		Map<String,Integer> limit=new HashMap<String,Integer>();
		limit.put("page", 0);
		limit.put("fetch", 20);
		return productDao.querySpecifiedProduct(null, order, limit);
	}
	public void add(Product product) throws SQLException{
		productDao.addProduct(product);
	}
	public void delete(int p_Id) throws SQLException{
		productDao.deleteProduct(p_Id);
	}
	public void update(Product product) throws SQLException{
		productDao.updateProduct(product);
	}
}
