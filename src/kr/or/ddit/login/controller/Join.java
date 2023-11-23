package kr.or.ddit.login.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig
@WebServlet("/Join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Join() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		request.setAttribute("joinCode", "yes");
		
		//요청된 위치로 데이터를 전달하거나 해당 url로 이동하게 만들어주는 객체 - request dispathcher
		RequestDispatcher req = request.getRequestDispatcher("/JejuOlleh/views/login/join.jsp");
		req.forward(request, response); //요청위치로 req,resp객체에 담긴 데이터 전달
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO 입력값 회원db 에 넣기
		
		String memNm = request.getParameter("memNm");
		String memId = request.getParameter("memId");
		String memPass = request.getParameter("memPass");
		String memBir = request.getParameter("memBir");
		String memZip = request.getParameter("memZip");
		String memAdd1 = request.getParameter("memAdd1");
		String memAdd2 = request.getParameter("memAdd2");
		String memHp = request.getParameter("memHp");
		String memMail = request.getParameter("memMail");
		String regFile = request.getParameter("regFile");
		String memAth = request.getParameter("memAth");
		String memCf = request.getParameter("memCf");
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("memNm : " + memNm);
		
		Part RegFile = request.getPart("regFile");
		InputStream is = RegFile.getInputStream();
		
		// TODO 파일명 어떻게 할지 정하기
		String fileName = "E:\\4.Highjava\\workspace\\JejuOlleh\\WebContent\\upload\\" + System.currentTimeMillis() + ".doc";
		
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fileName)));
		byte[] buffer = new byte[1024];
		
		int len;
        while ((len = is.read(buffer))!= -1) {
        	bos.write(buffer);
        }

        bos.close();
        is.close();
		
        // TODO 회원가입 실패할때 어떻게 할지 확인하기
        
		//요청된 위치로 데이터를 전달하거나 해당 url로 이동하게 만들어주는 객체 - request dispathcher
		RequestDispatcher req = request.getRequestDispatcher("/jejuOlleh/views/login/login3.jsp");
		req.forward(request, response); //요청위치로 req,resp객체에 담긴 데이터 전달
	}
}
