package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.BoardAnswerServiceImpl;
import kr.or.ddit.board.service.BoardAskServiceImpl;
import kr.or.ddit.board.service.IBoardAnswerService;
import kr.or.ddit.board.service.IBoardAskService;
import kr.or.ddit.board.vo.BoardAnswerVO;
import kr.or.ddit.board.vo.BoardAskVO;


@MultipartConfig
@WebServlet(value = "/boardAnswer/insert.do")
public class InsertBoardAnswerController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String askNo = req.getParameter("askNo");
		
		IBoardAskService boardAskService = BoardAskServiceImpl.getInstance();
		IBoardAnswerService boardAnswerService = BoardAnswerServiceImpl.getInstance();
		
		BoardAskVO bav = boardAskService.getBoardAsk(askNo);
		List<BoardAnswerVO> basv = boardAnswerService.getAllBoardAnswer();
		
		req.setAttribute("boardAnswerList", basv);
		req.setAttribute("boardAskList", bav);
		
		RequestDispatcher rd = req.getRequestDispatcher(req.getContextPath() + "/boardAsk/detail.do");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		String askNo = req.getParameter("askNo");
		String memId = req.getParameter("memId");
		String ansContent = req.getParameter("ansContent");
//		Date askDate = req.getParameter("askDate");
		
		IBoardAnswerService boardAnswerService = BoardAnswerServiceImpl.getInstance();
		
		BoardAnswerVO basv = new BoardAnswerVO(askNo, memId, ansContent);

		System.out.println("basv : " + basv);
		
		int cnt = boardAnswerService.registerBoardAnswer(basv);
		cnt = boardAnswerService.modifyBoardAnswerY(basv);
		
		String msg = "";
		if(cnt > 0) {
			msg = "댓글입력 성공";
		}else {
			msg = "댓글입력 실패";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/boardAsk/detail.do?askNo=" + askNo);
		
	}
	
}
