package kr.or.ddit.admin.controller;

import java.io.IOException;
import java.util.Enumeration;

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

@WebServlet("/admin/updatehost.do")
public class ModifyHostController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memId = req.getParameter("memId");
		
		IMemberService memService = MemberServiceImpl.getInstance();
		
		MemberVO mv = memService.getHost(memId);
		
		req.setAttribute("mv", mv);
		
		req.getRequestDispatcher("/views/admin/updatehost.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Enumeration en = req.getParameterNames();
		
		/*
		 name : memId
		name : memPass
		name : memHp
		name : memZip
		name : memAdd1
		name : memAdd2
		name : memCf
		 */
		while(en.hasMoreElements()) {
			String name = (String)en.nextElement();
			System.out.println("name : " + name + ", value : " + req.getParameter(name));
		}
		
		String memId = req.getParameter("memId");
		String memPass = req.getParameter("memPass");
		String memName = req.getParameter("memName");
		String memBir = req.getParameter("memBir");
		String memMail = req.getParameter("memMail");
		String memHp = req.getParameter("memHp");
		String memAdd1 = req.getParameter("memAdd1");
		String memZip = req.getParameter("memZip");
		String memAdd2 = req.getParameter("memAdd2");
		String memCf = req.getParameter("memCf");
	
		IMemberService memService = MemberServiceImpl.getInstance();
		
		MemberVO mv = new MemberVO(memId, memPass, memName, memBir, memMail, memHp, memAdd1, memZip, memAdd2, memCf);

		mv.setMemId(memId);
		mv.setMemPass(memPass);
		mv.setMemHp(memHp);
		mv.setMemZip(memZip);
		mv.setMemAdd1(memAdd1);
		mv.setMemAdd2(memAdd2);
		mv.setMemCf(memCf);
		
		System.out.println("mv : " + mv);
		int cnt = memService.modifyHost(mv);
		System.out.println("cnt : " + cnt);
		
		resp.sendRedirect(req.getContextPath() + "/admin/detailhost.do?memId=" + memId);

		
	}
}
