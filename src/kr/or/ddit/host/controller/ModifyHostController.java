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
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/host/update.do")
public class ModifyHostController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IMemberService memService = MemberServiceImpl.getInstance();
		  
//		String memId = req.getParameter("memId");
		  
		HttpSession session = req.getSession();
		 
		String memId = (String) session.getAttribute("memId");
		
		MemberVO mv = memService.getInfo(memId);
	
		 if (mv != null) {
			 req.setAttribute("mv", mv);
			 req.setAttribute("memId", memId); // memId를 추가로 설정
			 req.getRequestDispatcher("/views/host/update.jsp").forward(req, resp);
			 
		 }else { // mv가 null인 경우 처리할 코드 작성
			 System.out.println("해당 멤버 정보가 존재하지 않습니다.");
				 // 또는 원하는 작업을 수행하도록 처리 }
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

		int cnt = memService.modifyHost(mv);

		String msg = "";
		if (cnt > 0) {
		} else {
			msg = "실패";
		}

		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		httpSession.setAttribute("memId", memId);

		System.out.println("아이디값 : " + memId);
		resp.sendRedirect(req.getContextPath() + "/host/update.do?memId=" + memId);
		
		
	
	}
	
}
