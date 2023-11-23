package kr.or.ddit.admin.controller;

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

@WebServlet("/admin/update.do")
public class ModifyMemberController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String memId = req.getSession().getAttribute("memId");
		String memId = req.getParameter("memId");
		
		IMemberService memService = MemberServiceImpl.getInstance();
		
		MemberVO mv = memService.getMember(memId);
		
		req.setAttribute("mv", mv);
		
		req.getRequestDispatcher("/views/admin/update.jsp").forward(req, resp);
		
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
	
		IMemberService memService = MemberServiceImpl.getInstance();
		
		MemberVO mv = new MemberVO(memId, memPass, memName, memBir, memMail, memHp, memAdd1, memZip, memAdd2);
//		MemberVO mv = new MemberVO();
//		mv.setMemId(memId);
//		mv.setMemName(memName);
//		mv.setMemBir(memBir);
//		mv.setMemMail(memMail);
//		mv.setMemHp(memHp);
//		mv.setMemAdd1(memAdd1);
//		mv.setMemZip(memZip);
//		mv.setMemAdd2(memAdd2);
//		System.out.println("mv : " + mv);
		
		int cnt = memService.modifyMember(mv);
//		int cnt = 1;
		
		
		HttpSession httpSession = req.getSession();
		
		resp.sendRedirect(req.getContextPath() + "/admin/detail.do?memId=" + memId);
		
	}
}
