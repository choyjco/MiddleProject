package kr.or.ddit.accommodationwish.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.accommodationwish.service.AccommodationwishServiceImpl;
import kr.or.ddit.accommodationwish.service.IAccommodationwishService;
import kr.or.ddit.accommodationwish.vo.AccoWishVO;
import kr.or.ddit.reservation.service.IResService;
import kr.or.ddit.reservation.service.ResServiceImpl;

@WebServlet("/acco/wishlist.do")
public class ListAccommodationwishController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		IAccommodationwishService accowishservice = AccommodationwishServiceImpl.getInstance();

		String memId = (String) session.getAttribute("memId");


		List<AccoWishVO> accowishlist = accowishservice.getwishlist(memId);

		req.setAttribute("memId", memId); // memId를 request에 저장
		req.setAttribute("accowishlist", accowishlist);

		System.out.println(accowishlist);

		req.getRequestDispatcher("/views/member/wishlist.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
