package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardNotServiceImpl;
import kr.or.ddit.board.service.IBoardNotService;
import kr.or.ddit.board.vo.BoardNotVO;



@WebServlet("/boardNot/detail.do")
public class DetailBoardNotController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String notNo = req.getParameter("notNo");
		//DetailBoardNotController->notNo : 1
		System.out.println("DetailBoardNotController->notNo : " + notNo);
		
		IBoardNotService boardNotService = BoardNotServiceImpl.getInstance();
		
		BoardNotVO bnv = boardNotService.getBoardNot(notNo);
		
		System.out.println("DetailBoardNotController->bnv : " + bnv);
		
		req.setAttribute("bnv", bnv);
		
		req.getRequestDispatcher("/views/board/notDetail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
