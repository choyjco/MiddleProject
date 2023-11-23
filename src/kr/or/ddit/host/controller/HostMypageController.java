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

@WebServlet("/host/mypage.do")
public class HostMypageController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 HttpSession session = req.getSession();
		    String memId = (String) session.getAttribute("memId");
		    String memPass = (String) session.getAttribute("memPass");

		    if (memId != null) {
		        IMemberService memService = MemberServiceImpl.getInstance();
		        MemberVO mv2 = memService.getPass(memId); // 비밀번호 정보를 가져옴

		        if (mv2 != null) {
		            memPass = mv2.getMemPass();
		            session.setAttribute("memPass", memPass);
		        }

		        RequestDispatcher rd = req.getRequestDispatcher("/views/host/mypage.jsp");
		        rd.forward(req, resp);
		    }

}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
	
}
