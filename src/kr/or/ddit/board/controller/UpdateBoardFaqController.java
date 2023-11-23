package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.BoardFaqServiceImpl;
import kr.or.ddit.board.service.IBoardFaqService;
import kr.or.ddit.board.vo.BoardFaqVO;

@MultipartConfig
@WebServlet("/boardFaq/update.do")
public class UpdateBoardFaqController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String faqNo = req.getParameter("faqNo");
		
		IBoardFaqService boardFaqService = BoardFaqServiceImpl.getInstance();
		
		BoardFaqVO bfv = boardFaqService.getBoardFaq(faqNo);
		
		req.setAttribute("bfv", bfv);
		
		req.getRequestDispatcher("/views/board/faqUpdateForm.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String faqNo = req.getParameter("faqNo");
		String memId = req.getParameter("memId");
		String faqTitle = req.getParameter("faqTitle");
		String faqContent = req.getParameter("faqContent");
//		Date faqDate = req.getParameter("faqDate");
		
		IBoardFaqService boardFaqService = BoardFaqServiceImpl.getInstance();
		
		BoardFaqVO bfv = new BoardFaqVO(faqNo, memId, faqTitle, faqContent);
		
		int cnt = boardFaqService.modifyBoardFaq(bfv);
		
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
		
		resp.sendRedirect(req.getContextPath() + "/boardFaq/list.do");
	}
}
