package kr.or.ddit.reservation.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reservation.service.IResService;
import kr.or.ddit.reservation.service.ResServiceImpl;
import kr.or.ddit.reservation.vo.ResVO;

@MultipartConfig
@WebServlet(value = "/res/ressoart.do")
public class SoartReservationController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String accoLoc = req.getParameter("accoLoc");
		String resStartString = req.getParameter("resStart");
		String resEndString = req.getParameter("resEnd");
		String resPeople = req.getParameter("resPeople");
		

	    
		System.out.println("넘어왔니?" + resStartString);
		System.out.println("넘어왔니?" + resEndString);
		System.out.println("넘어왔니?" + accoLoc);
		System.out.println("넘어왔니?" + resPeople);
		
		IResService resService = ResServiceImpl.getInstance();
		
		ResVO rv = new ResVO(accoLoc, resStartString, resEndString, resPeople);
			
		List<ResVO> soartlist = resService.getResSortAccoList(rv);
		
		System.out.println(soartlist);
		
		req.setAttribute("soartaccoList", soartlist);
		
		RequestDispatcher rd =  req.getRequestDispatcher("/views/acco/sortmain.jsp");
		
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		doGet(req, resp);
		
	}
	
}
