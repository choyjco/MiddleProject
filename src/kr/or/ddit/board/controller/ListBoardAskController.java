package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardAskServiceImpl;
import kr.or.ddit.board.service.IBoardAskService;
import kr.or.ddit.board.vo.BoardAskVO;

@WebServlet(value = "/boardAsk/list.do")
public class ListBoardAskController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IBoardAskService boardAskService = BoardAskServiceImpl.getInstance();
		
		List<BoardAskVO> boardAskList = boardAskService.getAllBoardAsk();
		
		req.setAttribute("boardAskList", boardAskList);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/board/askList.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
