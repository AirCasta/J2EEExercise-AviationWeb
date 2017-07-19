package service;

import java.sql.SQLException;

import dao.UserDao;
import exception.UserException;
import model.User;

public class UserService {
	private UserDao userDao=new UserDao();
	
	public void regist(User form) throws UserException, SQLException {
		User user=userDao.queryUserById(form.getU_Id());
		if(user!=null) throw new UserException("用户名已被注册!");
		user=userDao.queryUserByEmail(form.getEmail());
		if(user!=null) throw new UserException("Email已被注册!");
		
		userDao.addUser(form);
	}
	public User loginUser(User form) throws UserException, SQLException{
		User user=userDao.queryUserById(form.getU_Id());
		if(user==null) throw new UserException("用户名不存在");
		if(!user.getU_Password().equals(form.getU_Password())) throw new UserException("密码错误");
		return user;
	}
}
