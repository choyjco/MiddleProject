package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
@WebServlet("/boardAnswer/update.do")
public class UpdateBoardAnswerController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String askNo = req.getParameter("askNo");
		
//		IBoardAskService boardAskService = BoardAskServiceImpl.getInstance();
		IBoardAnswerService boardAnswerService = BoardAnswerServiceImpl.getInstance();
		
//		BoardAskVO bav = boardAskService.getBoardAsk(askNo);
		BoardAnswerVO basv = boardAnswerService.getBoardAnswer(askNo);
//		List<BoardAnswerVO> basv = boardAnswerService.getBoardAnswer(askNo);
//		ArrayList<String> basv = new ArrayList<String>();
		
//		req.setAttribute("bav", bav);
		req.setAttribute("basv", basv);
		
		req.getRequestDispatcher("/views/board/answerUpdateForm.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String askNo = req.getParameter("askNo");
        String memId = req.getParameter("memId");
        String ansContent = req.getParameter("ansContent");
//		Date askDate = req.getParameter("askDate");
		
        IBoardAnswerService boardAnswerService = BoardAnswerServiceImpl.getInstance();

        BoardAnswerVO basv = new BoardAnswerVO(askNo, memId, ansContent);
        
        int cnt = boardAnswerService.modifyBoardAnswer(basv);
		
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
}
