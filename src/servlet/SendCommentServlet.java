package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.InformationComment;
import model.NewsComment;
import model.ProductComment;
import service.InformationCommentService;
import service.NewsCommentService;
import service.ProductCommentService;

/**
 * Servlet implementation class SendCommentServlet
 */
@WebServlet(name="SendCommentServlet",urlPatterns="/SendCommentServlet")
public class SendCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NewsCommentService newsCommentService=new NewsCommentService();
	private InformationCommentService informationCommentService=new InformationCommentService();
	private ProductCommentService productCommentService=new ProductCommentService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendCommentServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String target=request.getParameter("category");
		switch(target){
			case "news":
				NewsComment newsComment=new NewsComment();
				newsComment.setComment(request.getParameter("comment"));
				newsComment.setNewsId(Integer.valueOf(request.getParameter("n_Id")));
				newsComment.setUserId(request.getParameter("u_Id"));
				newsCommentService.addNewsComment(newsComment);
				break;
			case "product":
				ProductComment productComment=new ProductComment();
				productComment.setComment(request.getParameter("comment"));
				productComment.setProductId(Integer.valueOf(request.getParameter("p_Id")));
				productComment.setUserId(request.getParameter("u_Id"));
				productCommentService.addProductComment(productComment);
				break;
			case "information":
				System.out.println(request.getParameter("comment")+request.getParameter("name")+request.getParameter("u_Id"));
				InformationComment informationComment=new InformationComment();
				informationComment.setComment(request.getParameter("comment"));
				informationComment.setName(request.getParameter("name"));
				informationComment.setUserId(request.getParameter("u_Id"));
				informationCommentService.addInformationComment(informationComment);
				break;
		}
	}

}
