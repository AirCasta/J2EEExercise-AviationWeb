package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import service.ProductCommentService;
import service.ProductService;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet(name="ProductServlet",urlPatterns="/ProductServlet")
public class ProductServlet extends MyBaseServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService=new ProductService();
	private ProductCommentService productCommentService=new ProductCommentService();;
	public void getIndexProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(JSONArray.fromObject(productService.queryIndexProduct()).toString());
	}
	public String getProductList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if(request.getParameter("timePage")==null)
			request.setAttribute("timeProudctList", productService.queryProductListByTime(0));
		else
			request.setAttribute("timeProudctList", productService.queryProductListByTime(Integer.valueOf(request.getParameter("timePage"))));
		if(request.getParameter("clickPage")==null)
			request.setAttribute("clickProudctList", productService.queryProductListByClick(0));
		else
			request.setAttribute("clickProudctList", productService.queryProductListByClick(Integer.valueOf(request.getParameter("clickPage"))));
		return "f:/pro.jsp";
	}
	public String getDetailedProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		Product product=productService.query(Integer.valueOf(request.getParameter("p_id")));
		product.setP_Clicks(product.getP_Clicks()+1);
		productService.update(product);
		request.setAttribute("product", product);
		request.setAttribute("commentNum", productCommentService.getCount(product.getP_Id()));
		request.setAttribute("commentList", productCommentService.getProductComment(product.getP_Id()));
		return "f:/pro_post.jsp";
	}
	public void getStarProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		SimpleDateFormat dateFormat=new SimpleDateFormat("dd MMM,yyyy");
		JSONArray starProduct=new JSONArray();
		Product newest=productService.queryNewest();
		Product hottest=productService.queryHottest();
		String n_date=dateFormat.format(newest.getCreate_Date());
		String h_date=dateFormat.format(hottest.getCreate_Date());		
		JSONObject json1=JSONObject.fromObject(newest);
		json1.replace("create_Date", n_date);
		starProduct.add(json1);
		JSONObject json2=JSONObject.fromObject(hottest);
		json2.replace("create_Date", h_date);
		starProduct.add(json2);
		response.getWriter().write(starProduct.toString());
	}
}
