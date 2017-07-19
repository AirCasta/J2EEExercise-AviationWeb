package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NewsDao;
import model.News;
import net.sf.json.JSONArray;
import service.NewsCommentService;
import service.NewsService;

/**
 * Servlet implementation class NewsServlet
 */
@WebServlet(name="NewsServlet",urlPatterns="/NewsServlet")
public class NewsServlet extends MyBaseServlet {
	private static final long serialVersionUID = 1L;
    private NewsService newsService=new NewsService();
    private NewsCommentService newsCommentService=new NewsCommentService();
    public void getSlide(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(JSONArray.fromObject(newsService.querySlide()).toString());
		//System.out.println(JSONArray.fromObject(newsService.querySlide()).toString());
    }
    public void getIndexNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<News> showList=new ArrayList<>();
		showList.add(newsService.queryAvition());
		showList.add(newsService.queryInfor());
		showList.add(newsService.queryNewest());
		response.getWriter().write(JSONArray.fromObject(showList).toString());
    }
    public String getNewsList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if(request.getParameter("page")==null)
			request.setAttribute("NewsList", newsService.queryNewsList(0));
		else
			request.setAttribute("NewsList", newsService.queryNewsList(Integer.valueOf(request.getParameter("page"))));
		return "f:/news.jsp";
    }
    public String getDetailedNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	News news=newsService.query(Integer.valueOf(request.getParameter("n_Id")));
    	news.setN_Clicks(news.getN_Clicks()+1);
    	newsService.update(news);
    	request.setAttribute("news", news);
    	request.setAttribute("relativeList", newsService.queryRelativeNews(news.getN_Attribute()));
    	request.setAttribute("commentNum", newsCommentService.getCount(news.getN_Id()));
    	request.setAttribute("commentList",newsCommentService.getNewsComment(news.getN_Id()));
    	return "f:/news_post.jsp";
    }
    public void getNewsRank(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//System.out.println(JSONArray.fromObject(newsService.queryNewsRank()).toString());
		response.getWriter().write(JSONArray.fromObject(newsService.queryNewsRank()).toString());
    }
}
