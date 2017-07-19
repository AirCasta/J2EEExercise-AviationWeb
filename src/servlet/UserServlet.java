package servlet;

import cn.itcast.commons.CommonUtils;
import cn.itcast.mail.Mail;
import cn.itcast.mail.MailUtils;
import exception.UserException;
import model.User;
import service.UserService;

import java.io.IOException;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet(name="UserServlet", urlPatterns="/UserServlet")
public class UserServlet extends MyBaseServlet {
	private static final long serialVersionUID = 1L;
    private UserService userService=new UserService();
    public String active(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("已激活");
    	return null;
    }
    
    public String regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	User form=CommonUtils.toBean(request.getParameterMap(), User.class);
    	//输入校验
    	Map<String,String> errors=new HashMap<String, String>();
    	String userId=form.getU_Id();
    	if(userId==null||userId.trim().isEmpty()){
    		errors.put("userId","Id不能为空");
    	}else if(userId.length() <3||userId.length()>15){
    		errors.put("userId","Id长度应在3到15位之间");
    	}
    	
    	String password=form.getU_Password();
    	String verify=request.getParameter("verify");
    	if(password==null||password.trim().isEmpty()){
    		errors.put("password","密码不能为空");
    	}else if(password.length() <6||password.length()>20){
    		errors.put("password","密码长度应在6到20位之间");
    	}else if(!password.equals(verify)){
    		errors.put("password", "两次输入密码不一致");
    	}
    	
    	String email=form.getEmail();
    	if(email==null||email.trim().isEmpty()){
    		errors.put("email","email不能为空");
    	}else if(!email.matches("\\w+@\\w+\\.\\w+")){
    		errors.put("email","email格式错误");
    	}
    	//判断是否有错误信息
    	if(errors.size()>0){
    		request.setAttribute("errors", errors);
    		request.setAttribute("form",form);
    		return "f:/registration.jsp"; 
    	}
    	//调用service的regist()方法
    	try {
			userService.regist(form);
		} catch (UserException | SQLException e) {
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("form", form);
    		return "f:/registration.jsp"; 
		}
		
    	//邮箱注册
    	//获取配置文件
    	Properties properties=new Properties();
    	properties.load(this.getClass().getClassLoader().getResourceAsStream(
    			"email_template.properties"));
    	String host=properties.getProperty("host");
    	String uname=properties.getProperty("uname");
    	String pwd=properties.getProperty("password");
    	String from=properties.getProperty("from");
    	String to=form.getEmail();
    	String subject=properties.getProperty("subject");
    	String content=properties.getProperty("content");
    	System.out.println(host+" "+uname+" "+pwd+" "+from+" "+to+" "+subject+" "+content);
    	//content=MessageFormat.format(content, form);
		Session session=MailUtils.createSession(host, uname, password);
		Mail mail=new Mail(from,to,subject,content);
		try {
			MailUtils.send(session, mail);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	request.setAttribute("msg", "注册成功，请到邮箱进行激活");
    	return "f:/msg.jsp"; 
    }

    public String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	User form=CommonUtils.toBean(request.getParameterMap(), User.class);
    	//System.out.println(form.getU_Id()+" "+form.getU_Password());
    	try {
			User user=userService.loginUser(form);
			request.getSession().setAttribute("loginUser", user);
			return "r:/index.jsp";
		} catch (UserException | SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("form", form);
			return "f:/index.jsp/login";
		}
    }

    public String quit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getSession().invalidate();
    	return "r:/index.jsp";
    }
}
