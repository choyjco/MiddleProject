package kr.or.ddit.accommodationwish.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.accommodationwish.service.AccommodationwishServiceImpl;
import kr.or.ddit.accommodationwish.service.IAccommodationwishService;
import kr.or.ddit.accommodationwish.vo.AccoWishVO;

@WebServlet("/acco/wish.do")
public class AccommodationwishController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = null;
		
		String memAth = (String)req.getSession().getAttribute("memAth");
		
		if("HOST".equals(memAth)) {
			rd = req.getRequestDispatcher("/views/acco/hostmain.jsp");
			
		}else {
			rd = req.getRequestDispatcher("/views/acco/commain.jsp");
			
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String accoNo = req.getParameter("accoNo");
		
		IAccommodationwishService accoService = AccommodationwishServiceImpl.getInstance();

		AccoWishVO accowv = new AccoWishVO(accoNo);
		
		accowv.setMemId((String)req.getSession().getAttribute("memId"));

		System.out.println(accowv);
		
		int cnt = accoService.insertwish(accowv);	
	

		if (cnt > 0) {
			// 숙소 추가 성공 시 처리
			req.setAttribute("message", "숙소가 위시리스트에 추가되었습니다.");
		} else {
			// 숙소 추가 실패 시 처리
			req.setAttribute("message", "숙소 추가에 실패했습니다.");
		}
		
		resp.sendRedirect(req.getContextPath()+"/acco/list.do");

	}

}
