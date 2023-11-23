package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.BoardNotServiceImpl;
import kr.or.ddit.board.service.IBoardNotService;

@WebServlet("/boardNot/delete.do")
public class DeleteBoardNotController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String notNo = req.getParameter("notNo");
		
		IBoardNotService boardNotService = BoardNotServiceImpl.getInstance();
		
		int cnt = boardNotService.removeBoardNot(notNo);
		
		String msg = "";
		if(cnt > 0) {
			//성공
			msg = "성공";
		}else {
			//실패
			msg = "실패";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/boardNot/list.do");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
