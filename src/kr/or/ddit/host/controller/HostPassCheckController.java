package kr.or.ddit.host.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/host/hostpasscheck.do")
public class HostPassCheckController extends HttpServlet {
	
	public HostPassCheckController() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String memId = (String) session.getAttribute("memId");
		
		if(session.getAttribute("memId")!=null) {
			IMemberService memService = MemberServiceImpl.getInstance();
			
			MemberVO mv = memService.getInfo(memId);
			
			session.setAttribute("memPass", mv.getMemPass());
			
			RequestDispatcher rd = req.getRequestDispatcher("/views/host/hostpasscheck.jsp");
			rd.forward(req, resp);
			
		}else {
			RequestDispatcher rd = req.getRequestDispatcher("/views/login/login.jsp");
			rd.forward(req, resp);
		}
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String memId = (String) session.getAttribute("memId");
		
		String memPassS = (String) session.getAttribute("memPass");
		
		String memPass = req.getParameter("memPass");
		
		if(session.getAttribute("memId")!=null) {
			
			if(memPass == memPassS) {
				RequestDispatcher rd = req.getRequestDispatcher("/views/host/update.jsp");
				rd.forward(req, resp);
			
			}else {
				
				RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
				rd.forward(req, resp);
			}
			
		}else {
			RequestDispatcher rd = req.getRequestDispatcher("/views/login/login.jsp");
			rd.forward(req, resp);
		}
	}
}
