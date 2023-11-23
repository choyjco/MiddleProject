package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.Map;

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

@WebServlet("/member/mempasscheck.do")
public class MemPassCheckController extends HttpServlet {

	public MemPassCheckController() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		String memId = (String) session.getAttribute("memId");
//		String memPass = (String) session.getAttribute("memPass");
		
		if(session.getAttribute("memId")!=null) {
			IMemberService memService = MemberServiceImpl.getInstance();
			
			MemberVO mv = memService.getInfo(memId);
			
			session.setAttribute("memPass", mv.getMemPass()); // memPass 값을 세션에 저장
			
			RequestDispatcher rd = req.getRequestDispatcher("/views/member/mempasscheck.jsp");
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
				
				RequestDispatcher rd = req.getRequestDispatcher("/views/member/update.jsp");
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
