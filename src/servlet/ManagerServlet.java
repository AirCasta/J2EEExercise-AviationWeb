package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import exception.ManagerException;
import exception.UserException;
import model.Manager;
import service.ManagerService;

/**
 * Servlet implementation class ManagerServlet
 */
@WebServlet(name="ManagerSrevlet", urlPatterns="/ManagerServlet")
public class ManagerServlet extends MyBaseServlet {
	private static final long serialVersionUID = 1L;
    private ManagerService managerService=new ManagerService();
    
    public String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	Manager form=CommonUtils.toBean(request.getParameterMap(), Manager.class);
    	try {
			Manager manager=managerService.loginManager(form);
			request.getSession().setAttribute("loginManager", manager);
			return "r:/ManageNewsServlet?method=queryAll";
		} catch (ManagerException | SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("form", form);
			return "f:/manage.jsp";
		}
    }
    public String quit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	request.getSession().invalidate();
    	return "r:/index.jsp";
    }
}
