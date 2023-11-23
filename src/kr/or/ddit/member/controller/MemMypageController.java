package kr.or.ddit.member.controller;

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

@WebServlet("/member/mypage.do")
public class MemMypageController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		 HttpSession session = req.getSession();
		    String memId = (String) session.getAttribute("memId");
		    String memPass = (String) session.getAttribute("memPass");

		    if (memId != null) {
		        IMemberService memService = MemberServiceImpl.getInstance();
		        MemberVO mv2 = memService.getPass(memPass); // 비밀번호 정보를 가져옴

		        if (mv2 != null) {
		            memPass = mv2.getMemPass();
		            session.setAttribute("memPass", memPass);
		        }

		        RequestDispatcher rd = req.getRequestDispatcher("/views/member/mypage.jsp");
		        rd.forward(req, resp);
		    }
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memId = req.getParameter("memId");
		String memPass = req.getParameter("memPass");
		String memName = req.getParameter("memName");
		String memBir = req.getParameter("memBir");
		String memMail = req.getParameter("memMail");
		String memHp = req.getParameter("memHp");
		String memAdd1 = req.getParameter("memAdd1");
		String memZip = req.getParameter("memZip");
		String memAdd2 = req.getParameter("memAdd2");
		String memAth = req.getParameter("memAth");
		String memCf = req.getParameter("memCf");

		IMemberService memService = MemberServiceImpl.getInstance();

		MemberVO mv = new MemberVO(memId, memPass, memName, memBir,
						memMail, memHp, memAdd1, memZip, memAdd2, memAth, memCf);

		int cnt = memService.modifyMember(mv);


		HttpSession httpSession = req.getSession();
		
		httpSession.setAttribute("memId", memId);

		System.out.println("아이디값 : " + memId);
		resp.sendRedirect(req.getContextPath() + "/member/update.do?memId=" + memId);
	}
}
