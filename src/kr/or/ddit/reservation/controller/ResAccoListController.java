package kr.or.ddit.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reservation.service.IResService;
import kr.or.ddit.reservation.service.ResServiceImpl;
import kr.or.ddit.reservation.vo.ResVO;

@WebServlet("/host/acco/reslist.do")
public class ResAccoListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String accoNo = req.getParameter("accoNo");
		IResService resService = ResServiceImpl.getInstance();
		List<ResVO> resAccoList = resService.getResAccoList(accoNo);
	
		req.setAttribute("resAccoList", resAccoList);

		RequestDispatcher rd = req.getRequestDispatcher("/views/host/resAccoList.jsp");
		rd.forward(req, resp);
		
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
