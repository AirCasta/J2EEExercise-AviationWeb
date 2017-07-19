package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Enterprise;
import net.sf.json.JSONArray;
import service.EnterpriseService;
import service.InformationCommentService;
import service.InformationService;

/**
 * Servlet implementation class EnterpriseServlet
 */
@WebServlet(name="EnterpriseServlet",urlPatterns="/EnterpriseServlet")
public class EnterpriseServlet extends MyBaseServlet {
	private static final long serialVersionUID = 1L;
	private EnterpriseService enterpriseService=new EnterpriseService();
	private InformationService informationService=new InformationService();
	private InformationCommentService commentService=new InformationCommentService();
    public void getIndexEnterprise(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(JSONArray.fromObject(enterpriseService.queryIndexEnterprise()).toString());
    }
    public String getEnterpriseList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if(request.getParameter("page")==null)
			request.setAttribute("enterpriseList", enterpriseService.queryEnterpriseList(0));
		else
			request.setAttribute("enterpriseList", enterpriseService.queryEnterpriseList(Integer.valueOf(request.getParameter("page"))));
    	return "f:/company.jsp";
    }
    public String getDetailedEnterprise(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Enterprise enterprise=enterpriseService.query(request.getParameter("name"));
		request.setAttribute("enterprise", enterprise);
		request.setAttribute("informationList", informationService.getEnterpriseInformation(request.getParameter("name")));
		request.setAttribute("commentNum", commentService.getCount(request.getParameter("name")));
    	request.setAttribute("commentList",commentService.getInformationCommentList(request.getParameter("name")));
		return "f:/company_post.jsp";
    }
}
