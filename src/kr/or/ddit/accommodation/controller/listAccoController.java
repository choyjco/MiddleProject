package kr.or.ddit.accommodation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.accommodation.service.AccommodationService;
import kr.or.ddit.accommodation.service.IAccommodationService;
import kr.or.ddit.accommodation.vo.AccommodationVO;

@WebServlet("/acco/list.do")
public class listAccoController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IAccommodationService accoService = AccommodationService.getInstance();

		List<AccommodationVO> accoList = accoService.getAllacco();

		req.setAttribute("accoList", accoList);
		
		RequestDispatcher rd = null;
		
		String memAth = (String)req.getSession().getAttribute("memAth");
		
		if("HOST".equals(memAth)) {
			rd = req.getRequestDispatcher("/views/acco/hostmain.jsp");
			
		}else {
			rd = req.getRequestDispatcher("/views/acco/commain.jsp");
			
		}

		rd.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
