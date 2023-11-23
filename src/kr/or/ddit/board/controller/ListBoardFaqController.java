package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardFaqServiceImpl;
import kr.or.ddit.board.service.IBoardFaqService;
import kr.or.ddit.board.vo.BoardFaqVO;


@WebServlet(value = "/boardFaq/list.do")
public class ListBoardFaqController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IBoardFaqService boardFaqService = BoardFaqServiceImpl.getInstance();
		
		List<BoardFaqVO> boardFaqList = boardFaqService.getAllBoardFaq();
		
		req.setAttribute("boardFaqList", boardFaqList);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/board/faqList.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
