package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.BoardNotServiceImpl;
import kr.or.ddit.board.service.IBoardNotService;
import kr.or.ddit.board.vo.BoardNotVO;


@MultipartConfig
@WebServlet(value = "/boardNot/insert.do")
public class InsertBoardNotController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/views/board/notInsertForm.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String notNo = req.getParameter("notNo");
		String memId = req.getParameter("memId");
		String notTitle = req.getParameter("notTitle");
		String notContent = req.getParameter("notContent");
//		Date notDate = req.getParameter("notDate");
		
		IBoardNotService boardNotService = BoardNotServiceImpl.getInstance();
		
		BoardNotVO bnv = new BoardNotVO(notNo, memId, notTitle, notContent);
		
		int cnt = boardNotService.registerBoardNot(bnv);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/boardNot/list.do");
		
	}
	
}
