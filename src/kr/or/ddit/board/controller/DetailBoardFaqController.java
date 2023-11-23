package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardFaqServiceImpl;
import kr.or.ddit.board.service.IBoardFaqService;
import kr.or.ddit.board.vo.BoardFaqVO;

@WebServlet("/boardFaq/detail.do")
public class DetailBoardFaqController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String faqNo = req.getParameter("faqNo");
		
		IBoardFaqService boardFaqService = BoardFaqServiceImpl.getInstance();
		
		BoardFaqVO bfv = boardFaqService.getBoardFaq(faqNo);
		
		req.setAttribute("bfv", bfv);
		
		req.getRequestDispatcher("/views/board/faqDetail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
