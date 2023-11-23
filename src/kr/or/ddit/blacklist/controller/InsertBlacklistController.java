package kr.or.ddit.blacklist.controller;

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

import kr.or.ddit.blacklist.service.BlacklistServiceImpl;
import kr.or.ddit.blacklist.service.IBlacklistService;
import kr.or.ddit.blacklist.vo.BlacklistVO;


@MultipartConfig
@WebServlet(value = "/blacklist/insert.do")
public class InsertBlacklistController extends HttpServlet {

	public InsertBlacklistController() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("joinCode", "yes");
		RequestDispatcher rd = req.getRequestDispatcher("/views/blacklist/blkinsert.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String blkNo = req.getParameter("blkNo");
		String memId = req.getParameter("memId");
		String blkContent = req.getParameter("blkContent");
	
		
		IBlacklistService blacklistService = BlacklistServiceImpl.getInstance();
		
		BlacklistVO bv = new BlacklistVO(blkNo, memId, blkContent);
		
		int cnt = blacklistService.registerBlacklist(bv);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/blacklist/list.do");
		
	}
	
}
