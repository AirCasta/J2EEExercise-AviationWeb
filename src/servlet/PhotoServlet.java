package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import service.PhotoService;

/**
 * Servlet implementation class PhotoServlet
 */
@WebServlet(name="PhotoServlet",urlPatterns="/PhotoServlet")
public class PhotoServlet extends MyBaseServlet {
	private static final long serialVersionUID = 1L;
	private PhotoService photoService=new PhotoService();
	public void getIndexAtlas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(JSONArray.fromObject(photoService.queryAllAtlas()).toString());
	}
	public String getAtlasList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		request.setAttribute("AtlasList", photoService.queryAllAtlas());
		return "f:/pic.jsp";
	}
	public String getAtlasPhotos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		request.setAttribute("AtlasPhotos", photoService.queryAtlas(request.getParameter("atlas_Name")));
		return "f:/pic_post.jsp";
	}
}
