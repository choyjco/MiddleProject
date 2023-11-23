package kr.or.ddit.reservation.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
@WebServlet(value = "/res/resinsert.do")
public class ReservationController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/res/resinsert.jsp");
		
		rd.forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		String accoNo = req.getParameter("accoNo");
		String resStartString = req.getParameter("resStart");
		String resEndString = req.getParameter("resEnd");
		String resPeople = req.getParameter("resPeople");
		
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    Date resStart = null;
	    Date resEnd = null;
	    try {
	        resStart = dateFormat.parse(resStartString);
	        resEnd = dateFormat.parse(resEndString);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
		
		IResService resService = ResServiceImpl.getInstance();
		
		System.out.println(resStart +"이건 맞아?");
		System.out.println(resEnd +"이건 맞아?");
		System.out.println(resPeople +"이건 맞아?");
		
		
//		ResVO rv = new ResVO(accoNo, resStart, resEnd, resPeople);
		ResVO rv = new ResVO(resStart, resEnd, resPeople);
		rv.setMemId((String)req.getSession().getAttribute("memId"));
		rv.setAccoNo((String)req.getSession().getAttribute("accoNo"));
		
		int cnt = resService.insertRes(rv);
		
		resp.sendRedirect("/JejuOlleh/acco/list.do");
	}
}
