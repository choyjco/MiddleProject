package kr.or.ddit.blacklist.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.blacklist.service.BlacklistServiceImpl;
import kr.or.ddit.blacklist.service.IBlacklistService;
import kr.or.ddit.blacklist.vo.BlacklistVO;

@WebServlet(value = "/blacklist/list.do")
public class ListBlacklistController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IBlacklistService blacklistService = BlacklistServiceImpl.getInstance();
		
		List<BlacklistVO> blacklistList = blacklistService.getAllBlacklist();
		
		req.setAttribute("blacklistList", blacklistList);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/blacklist/blkList.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
