package kr.or.ddit.restaurant.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.ibatis.javassist.SerialVersionUID;

import kr.or.ddit.activity.service.ActivityServiceImpl;
import kr.or.ddit.activity.service.IActivityImgService;
import kr.or.ddit.activity.vo.ActivityImgVO;
import kr.or.ddit.activity.vo.ActivityVO;
import kr.or.ddit.restaurant.service.IRestaurantImgService;
import kr.or.ddit.restaurant.service.RestaurantServiceImpl;
import kr.or.ddit.restaurant.vo.RestaurantImgVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;

@MultipartConfig
@WebServlet("/RestInsertController")
public class RestInsertController extends HttpServlet {
	private static final long SerialVersionUID = 1L;
	
	public RestInsertController() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		req.setCharacterEncoding("UTF-8");
	    resp.setCharacterEncoding("UTF-8");
	    req.setAttribute("joinCode", "yes");
		RequestDispatcher rd = req.getRequestDispatcher("/views/restaurant/restinsert.jsp");
	      
	      rd.forward(req, resp);
	     
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		   
		  req.setCharacterEncoding("UTF-8");
	      resp.setCharacterEncoding("UTF-8");
	      
		  String rstName = req.getParameter("rstName");
		  String rstMenu = req.getParameter("rstMenu");
		  String rstLoc = req.getParameter("rstLoc");
		  String rstTel = req.getParameter("rstTel");
		  String rstList = req.getParameter("rstList");
		  String rstPrice = req.getParameter("rstPrice");
		  String rstIntro = req.getParameter("rstIntro");
		  String rstCate = req.getParameter("rstCate");
		  String rstTime = req.getParameter("rstTime");
		  String rstLat = req.getParameter("rstLat");
		  String rstLong = req.getParameter("rstLong");
		 // String actImgPath = req.getParameter("actImgPath");

		  
		  
		  System.out.println("가랏~~~~~~~~~~~~~~");
		  
		  Part regFile = req.getPart("rstImgPath");
		  InputStream is = regFile.getInputStream();
		 
		  String fileName = "D:\\4.Highjava\\workspace\\JejuOlleh\\WebContent\\images\\restaurant\\" + System.currentTimeMillis() + ".jpg";
		  
		  String rstImgPath = "/images/restaurant/" + System.currentTimeMillis() + ".jpg";
		  
		  BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fileName)));
		  byte[] buffer = new byte[1024];
		  
		  int len;
	        while ((len = is.read(buffer))!= -1) {
	        	bos.write(buffer);
	        }

	        bos.close();
	        is.close();
	        
	        IRestaurantImgService restaurantImgService = RestaurantServiceImpl.getInstance();
	        
	        RestaurantVO restaurantVO = new RestaurantVO();
	        restaurantVO.setRstName(rstName);
	        restaurantVO.setRstList(rstList);
	        restaurantVO.setRstTel(rstTel);
	        restaurantVO.setRstCate(rstCate);
	        restaurantVO.setRstLoc(rstLoc);
	        restaurantVO.setRstIntro(rstIntro);
	        restaurantVO.setRstTime(rstTime);
	        restaurantVO.setRstLat(rstLat);
	        restaurantVO.setRstLong(rstLong);
	        restaurantVO.setRstMenu(rstMenu);
	        restaurantVO.setRstPrice(rstPrice);
	        
	        RestaurantImgVO restaurantImgVO = new RestaurantImgVO();
	        restaurantImgVO.setRstImgPath(rstImgPath);
	        
	        restaurantVO.setRestaurantImgVO(restaurantImgVO);
	        
	        int cnt = restaurantImgService.insertRestaurant(restaurantVO);
	        
	        
	        
	        List<RestaurantVO> restaurantList = restaurantImgService.listRestaurant();
	        
	        req.setAttribute("restaurantList", restaurantList);
			
	 
	        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/restaurant/restlist.jsp");
			
	        dispatcher.forward(req, resp); //요청위치로 req,resp객체에 담긴 데이터 전달
	        
//	        resp.sendRedirect(req.getContextPath()+"/ListController");
	        
	   }
	
 }
