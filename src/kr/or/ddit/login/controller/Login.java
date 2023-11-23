package kr.or.ddit.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.login.service.IMemberService;
import kr.or.ddit.login.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;


@WebServlet("/Login")
public class Login extends HttpServlet {
   private static final long serialVersionUID = 1L;
       

    public Login() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {      
      
      //요청된 위치로 데이터를 전달하거나 해당 url로 이동하게 만들어주는 객체 - request dispathcher
      RequestDispatcher req = request.getRequestDispatcher("/JejuOlleh/views/login/login3.jsp");
      req.forward(request, response); //요청위치로 req,resp객체에 담긴 데이터 전달
   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {      
      
      String memId = request.getParameter("memId");
      String memPass = request.getParameter("memPass");
      String memNm = request.getParameter("memNm");

      System.out.println("==> userId : " + memId);

      System.out.println("==> userPass : " + memPass);

      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("memId", memId);
      map.put("memPass", memPass);
            
      //서비스 객체가 필요 - 싱글톤 방식
      IMemberService service = MemberServiceImpl.getInstance();
      String loginMemId = service.loginChk(map);
      System.out.println(loginMemId);
      
      
      System.out.println("db조회 결과>>" + loginMemId);
      
      if(loginMemId !=null) {
         // 세션의 정보를 담아서 메인페이지로 이동
         
         MemberVO memVo = kr.or.ddit.member.service.MemberServiceImpl.getInstance().getMember2(loginMemId);
         if("HOST".equals(memVo.getMemAth()) && "N".equals(memVo.getMemCf()) ) { // 권한이 HOST 고 승인이 안났으면
            response.sendRedirect("/JejuOlleh/views/login/loginFail.jsp?errorCode=01"); //새로운 url을 요청
            return;
         }
         
         HttpSession session = request.getSession();
         session.setAttribute("memId", memVo.getMemId());
         session.setAttribute("memNm", memVo.getMemName());
         session.setAttribute("memAth",memVo.getMemAth());
         
         //root 적용시 >> contextroot하위 webContent위치를 나타냄(=index페이지로 이동)
         //request.getRequestDispatcher("/").forward(request, response);
         
         response.sendRedirect("/JejuOlleh/index.do");
         
      }else {
         // 기존페이지(login.html)에 머무르기
         response.sendRedirect("/JejuOlleh/views/login/loginFail.jsp?errorCode=02"); //새로운 url을 요청
      }
   }
}