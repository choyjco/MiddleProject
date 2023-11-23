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

import kr.or.ddit.board.service.BoardAnswerServiceImpl;
import kr.or.ddit.board.service.BoardAskServiceImpl;
import kr.or.ddit.board.service.IBoardAnswerService;
import kr.or.ddit.board.service.IBoardAskService;
import kr.or.ddit.board.vo.BoardAnswerVO;
import kr.or.ddit.board.vo.BoardAskVO;


@MultipartConfig
@WebServlet(value = "/boardAsk/insert.do")
public class InsertBoardAskController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/views/board/askInsertForm.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// enctype="multipart/form-data"
				String askNo = req.getParameter("askNo");
				String memId = req.getParameter("memId");
				String askTitle = req.getParameter("askTitle");
				String askContent = req.getParameter("askContent");
//				Date askDate = req.getParameter("askDate");
				
				IBoardAskService boardAskService = BoardAskServiceImpl.getInstance();
				
				BoardAskVO bav = new BoardAskVO(askNo, memId, askTitle, askContent);
				//bav : BoardAskVO [askNo=null, memId=A001, askTitle=문의게시판 테스트, askContent=문의게시판 테스트입니다..~~!!!!!, askDate=null, askAns=null]
				System.out.println("bav : " + bav);
				
				int cnt = boardAskService.registerBoardAsk(bav);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/boardAsk/list.do");
		
	}
	
}
