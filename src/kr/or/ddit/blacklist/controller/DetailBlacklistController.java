package kr.or.ddit.blacklist.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.blacklist.service.BlacklistServiceImpl;
import kr.or.ddit.blacklist.service.IBlacklistService;
import kr.or.ddit.blacklist.vo.BlacklistVO;

@WebServlet("/blacklist/detail.do")
public class DetailBlacklistController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String blkNo = req.getParameter("blkNo");
		
		IBlacklistService blacklistService = BlacklistServiceImpl.getInstance();
		
		BlacklistVO bv = blacklistService.getBlacklist(blkNo);
		
		req.setAttribute("bv", bv);
		
		req.getRequestDispatcher("/views/blacklist/blkDetail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
