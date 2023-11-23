package kr.or.ddit.login.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Logout() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		HttpSession session = request.getSession();
		session.removeAttribute("memId");
		session.removeAttribute("memNm");
		
		
		//요청된 위치로 데이터를 전달하거나 해당 url로 이동하게 만들어주는 객체 - request dispathcher
		//RequestDispatcher req = request.getRequestDispatcher("/JejuOlleh/index.jsp");
		//req.forward(request, response); //요청위치로 req,resp객체에 담긴 데이터 전달
		
		response.sendRedirect("/JejuOlleh/index.do");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
	}
}
