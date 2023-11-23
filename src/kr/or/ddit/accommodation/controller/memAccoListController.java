package kr.or.ddit.accommodation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.accommodation.service.AccommodationService;
import kr.or.ddit.accommodation.service.IAccommodationService;
import kr.or.ddit.accommodation.vo.AccommodationVO;

@WebServlet("/host/acco/list.do")
public class memAccoListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("왔니?");
		String memId = req.getParameter("memId");
		
		System.out.println(memId);
		IAccommodationService accoService = AccommodationService.getInstance();
		
		List <AccommodationVO> memAccoList = accoService.memAccoSelect(memId);
		
		req.setAttribute("memAccoList", memAccoList);
		
		req.getRequestDispatcher("/views/acco/memAccoList.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
