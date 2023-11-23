package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardNotServiceImpl;
import kr.or.ddit.board.service.IBoardNotService;
import kr.or.ddit.board.vo.BoardNotVO;


@WebServlet(value = "/boardNot/list.do")
public class ListBoardNotController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IBoardNotService boardNotService = BoardNotServiceImpl.getInstance();
		
		List<BoardNotVO> boardNotList = boardNotService.getAllBoardNot();
		
		req.setAttribute("boardNotList", boardNotList);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/board/notList.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
