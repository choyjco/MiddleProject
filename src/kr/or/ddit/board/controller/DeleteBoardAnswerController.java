package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.BoardAnswerServiceImpl;
import kr.or.ddit.board.service.IBoardAnswerService;
import kr.or.ddit.board.vo.BoardAnswerVO;



@WebServlet("/boardAnswer/delete.do")
public class DeleteBoardAnswerController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String askNo = req.getParameter("askNo");
		
		String memId = req.getParameter("memId");
		String ansContent = req.getParameter("ansContent");
		
		IBoardAnswerService boardAnswerService = BoardAnswerServiceImpl.getInstance();
		
		BoardAnswerVO basv = new BoardAnswerVO(askNo, memId, ansContent);
		
		int cnt = boardAnswerService.removeBoardAnswer(askNo);
		cnt = boardAnswerService.modifyBoardAnswerN(basv);
		
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
		
		resp.sendRedirect(req.getContextPath() + "/boardAsk/detail.do?askNo=" + askNo);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
	}
}
