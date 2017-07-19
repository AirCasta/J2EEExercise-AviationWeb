package service;

import java.sql.SQLException;

import dao.ManagerDao;
import exception.ManagerException;
import model.Manager;

public class ManagerService {
	private ManagerDao managerDao=new ManagerDao();
	public Manager loginManager(Manager form) throws ManagerException, SQLException{
		Manager manager=managerDao.queryManager(form.getM_Id());
		if(manager==null) throw new ManagerException("登录失败");
		if(!manager.getM_Password().equals(form.getM_Password())) throw new ManagerException("登录失败");
		return manager;
	}
}
