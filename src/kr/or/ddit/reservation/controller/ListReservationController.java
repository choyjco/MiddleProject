package kr.or.ddit.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.reservation.service.IResService;
import kr.or.ddit.reservation.service.ResServiceImpl;
import kr.or.ddit.reservation.vo.ResVO;

@WebServlet(value = "/res/memreslist.do")
public class ListReservationController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		IResService resservice = ResServiceImpl.getInstance();
		
		String memId = (String)session.getAttribute("memId");
		
		List<ResVO> memreslist = resservice.getReslist(memId);
			
		req.setAttribute("memreslist", memreslist);
		
		System.out.println(memreslist);
		
		req.getRequestDispatcher("/views/res/memreslist.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
	
}
