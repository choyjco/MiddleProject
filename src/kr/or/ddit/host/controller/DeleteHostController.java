package kr.or.ddit.host.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

@WebServlet("/host/delete.do")
public class DeleteHostController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IMemberService memService = MemberServiceImpl.getInstance();

		HttpSession session = req.getSession();
		
		String memId = (String) session.getAttribute("memId");
		
		int cnt = memService.deleteMember(memId);
		
		resp.sendRedirect(req.getContextPath() + "/index.jsp");
		
		if(cnt > 0) {
			req.setAttribute("result", true);
			session.invalidate();
		
		}else {
			req.setAttribute("result", false);
			
		}
		req.setAttribute("memId", memId);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}
	
	
}
