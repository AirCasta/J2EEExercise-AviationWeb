package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PhotoService;

/**
 * Servlet implementation class ManagePicServlet
 */
@WebServlet(name="ManagePicServlet",urlPatterns="/ManagePicServlet")
public class ManagePicServlet extends MyBaseServlet {
	private static final long serialVersionUID = 1L;
	private PhotoService photoService=new PhotoService();
	public String queryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		request.setAttribute("photo_list", photoService.queryAll());
		return "f:/m_pic.jsp";
	}
	public String delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		photoService.delete(Integer.valueOf(request.getParameter("ph_Id")));
		return queryAll(request,response);
	}
	public String queryAtlas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if(request.getParameter("atlas").equals(""))
			return queryAll(request,response);
		else
			request.setAttribute("photo_list", photoService.queryAtlas(request.getParameter("atlas")));
		return "f:/m_pic.jsp";
	}
}
