package servlet;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.itcast.commons.CommonUtils;
import model.News;
import service.NewsService;

/**
 * Servlet implementation class ManageNewsServlet
 */
@WebServlet(name="ManageNewsServlet",urlPatterns="/ManageNewsServlet")
public class ManageNewsServlet extends MyBaseServlet {
	private static final long serialVersionUID = 1L;
	private NewsService newsService=new NewsService();
	
    public String queryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	request.setAttribute("news_list", newsService.queryAll());
    	return "f:/m_news.jsp";
    }
    
    public String edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	request.setAttribute("news", newsService.query(Integer.valueOf(request.getParameter("n_Id"))));
    	return "f:/m_news_item.jsp";
    }
    
    public String update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//System.out.println(request.getParameter("n_Id"));
		//创建工厂
		DiskFileItemFactory factory=new DiskFileItemFactory(1024*1024,new File("D:/Picture/temp"));
		//得到解析器
		ServletFileUpload sfu=new ServletFileUpload(factory);
		sfu.setFileSizeMax(1024*1024);
		//使用解析器解析request对象
		try {
			List<FileItem> fileItemList=sfu.parseRequest(request);
			//封装fileItemList
			Map<String,String> map=new HashMap<String,String>();
			for(FileItem item:fileItemList){
				if(item.isFormField()){
					map.put(item.getFieldName(),item.getString("utf-8"));
				}
			}
			News news=CommonUtils.toBean(map, News.class);
			//System.out.println(news.getN_Id());
			request.setAttribute("news", news);
			//得到保存目录
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
			String datePath=format.format(new Date());
			String savePath=this.getServletContext().getRealPath("/news_img/"+datePath);
			File dir=new File(savePath);
			if(!(dir.exists())){
				dir.mkdirs();
				//System.out.println(dir.exists());
			}
			//得到文件名称
			String filePath=fileItemList.get(3).getName();
			String fileName="_"+filePath.substring(filePath.lastIndexOf("\\")+1);

			//校验扩展名
			if(!(fileName.toLowerCase().endsWith(".jpg")||fileName.toLowerCase().endsWith(".png"))){
				request.setAttribute("msg", "上传文件格式错误，应为jpg/png格式");
				request.getRequestDispatcher("m_news_item.jsp").forward(request, response);
				return null;
			}
			
			//使用目录和文件名称创建目标文件
			File file=new File(savePath,fileName);
			//保存上传文件到目标位置
			fileItemList.get(3).write(file);
			//校验图片尺寸
			Image image=new ImageIcon(file.getAbsolutePath()).getImage();
			if(image.getWidth(null)>1280||image.getHeight(null)>800){
				file.delete();
				request.setAttribute("msg", "尺寸超过1280*800");
				request.getRequestDispatcher("m_news_item.jsp").forward(request, response);
				return null;
			}
			//设置news对象的img
			news.setN_Address("news_img/"+datePath+"/"+fileName);
			newsService.update(news);
			//response.sendRedirect("ManageNewsServlet?method=queryAll");
		} catch (Exception e) {
			if(e instanceof FileUploadBase.FileSizeLimitExceededException){
				request.setAttribute("msg", "文件大小超过1M");
				request.getRequestDispatcher("m_news_item.jsp").forward(request, response);
			}
		}
    	request.removeAttribute("news");
    	return queryAll(request, response);
    }
    
    public String delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	int n_Id=Integer.valueOf(request.getParameter("n_Id"));
    	newsService.delete(n_Id);
    	return queryAll(request,response);
    }
}
