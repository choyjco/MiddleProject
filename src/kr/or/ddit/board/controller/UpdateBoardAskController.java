package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.BoardAskServiceImpl;
import kr.or.ddit.board.service.IBoardAskService;
import kr.or.ddit.board.vo.BoardAskVO;

@MultipartConfig
@WebServlet("/boardAsk/update.do")
public class UpdateBoardAskController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String askNo = req.getParameter("askNo");
		
		IBoardAskService boardAskService = BoardAskServiceImpl.getInstance();
		
		BoardAskVO bav = boardAskService.getBoardAsk(askNo);
		
		req.setAttribute("bav", bav);
		
		req.getRequestDispatcher("/views/board/askUpdateForm.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String askNo = req.getParameter("askNo");
		String memId = req.getParameter("memId");
		String askTitle = req.getParameter("askTitle");
		String askContent = req.getParameter("askContent");
//		Date askDate = req.getParameter("askDate");
		
		IBoardAskService boardAskService = BoardAskServiceImpl.getInstance();
		
		BoardAskVO bav = new BoardAskVO(askNo, memId, askTitle, askContent);
		
		int cnt = boardAskService.modifyBoardAsk(bav);
		
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
		
		resp.sendRedirect(req.getContextPath() + "/boardAsk/list.do");
	}
}
