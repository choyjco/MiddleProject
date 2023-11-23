package kr.or.ddit.activity.controller;

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
@WebServlet("/InsertController")
public class InsertController extends HttpServlet {
	private static final long SerialVersionUID = 1L;
	
	public InsertController() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		req.setCharacterEncoding("UTF-8");
	    resp.setCharacterEncoding("UTF-8");
	    req.setAttribute("joinCode", "yes");
		RequestDispatcher rd = req.getRequestDispatcher("/views/activity/actinsert.jsp");
	      
	      rd.forward(req, resp);
	     
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		   
		  req.setCharacterEncoding("UTF-8");
	      resp.setCharacterEncoding("UTF-8");
	      
		  String actName = req.getParameter("actName");
		  String actList = req.getParameter("actList");
		  String actTel = req.getParameter("actTel");
		  String actLat = req.getParameter("actLat");
		  String actCate = req.getParameter("actCate");
		  String actLong = req.getParameter("actLong");
		  String actLoc = req.getParameter("actLoc");
		  String actIntro = req.getParameter("actIntro");
		 // String actImgPath = req.getParameter("actImgPath");

		  
		  
		  System.out.println("가랏~~~~~~~~~~~~~~");
		  
		  Part regFile = req.getPart("actImgPath");
		  InputStream is = regFile.getInputStream();
		 
		  String fileName = "D:\\4.Highjava\\workspace\\JejuOlleh\\WebContent\\images\\activity\\" + System.currentTimeMillis() + ".jpg";
		  
		  String actImgPath = "/images/activity/" + System.currentTimeMillis() + ".jpg";
		  
		  BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fileName)));
		  byte[] buffer = new byte[1024];
		  
		  int len;
	        while ((len = is.read(buffer))!= -1) {
	        	bos.write(buffer);
	        }

	        bos.close();
	        is.close();
	        
	        IActivityImgService activityImgService = ActivityServiceImpl.getInstance();
	        
	        ActivityVO activityVO = new ActivityVO();
	        activityVO.setActName(actName);
	        activityVO.setActList(actList);
	        activityVO.setActTel(actTel);
	        activityVO.setActLat(actLat);
	        activityVO.setActCate(actCate);
	        activityVO.setActLong(actLong);
	        activityVO.setActLoc(actLoc);
	        activityVO.setActIntro(actIntro);
	        
	        ActivityImgVO activityImgVO = new ActivityImgVO();
	        activityImgVO.setActImgPath(actImgPath);
	        
	        activityVO.setActivityImgVO(activityImgVO);
	        
	        int cnt = activityImgService.insertActivity(activityVO);
	        
	        
	        
	        List<ActivityVO> activityList = activityImgService.listActivity();
	        
	        req.setAttribute("activityList", activityList);
			
	 
	        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/activity/actlist2.jsp");
			
	        dispatcher.forward(req, resp); //요청위치로 req,resp객체에 담긴 데이터 전달
	        
//	        resp.sendRedirect(req.getContextPath()+"/ListController");
	        
	   }
	
 }
