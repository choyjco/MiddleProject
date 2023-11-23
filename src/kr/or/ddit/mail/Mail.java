package kr.or.ddit.mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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


@WebServlet("/Mail")
public class Mail extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	 public Mail() {
	        super();
	    }

	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        forwardToLoginPage(request, response);
	    }
	

	 @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        String memMail = req.getParameter("memMail");
	        String memId = req.getParameter("memId");
	        String memPw = req.getParameter("memPw");

	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("memId", memId);
	        map.put("memMail", memMail);

	        IMemberService service = MemberServiceImpl.getInstance();

	        MemberVO memVo = kr.or.ddit.member.service.MemberServiceImpl.getInstance().getMember(memId);

	        String recipient = memMail;
	        int code = (int)(Math.random()*10000)+1;

	        System.out.println(memMail + " | " + code);
 
        // 1. 발신자의 메일 계정과 비밀번호 설정
        final String user = "pybin93@naver.com";
        final String password = "Nqnrhkeo93!";
 
        // 2. Property에 SMTP 서버 정보 설정
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.naver.com");
        prop.put("mail.smtp.port", 465);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.naver.com");
 
        // 3. SMTP 서버정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스 생성
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
 
        // 4. Message 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성한다.
        // 5. Transport 클래스를 사용하여 작성한 메세지를 전달한다.
 
        MimeMessage message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(user));
 
            // 수신자 메일 주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
 
            // Subject
            message.setSubject("JejuOlleh 임시 비밀번호 ");
 
            // Text
            message.setText("임시비밀번호는["+code+"]를 입니다");
 
            Transport.send(message);    // send message
 
 
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        PrintWriter writer = resp.getWriter();
        writer.print(code);
	 
	}
	
	private void forwardToLoginPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if(member != null) {
			RequestDispatcher req = request.getRequestDispatcher("/JejuOlleh/views/login/loggedInPage.jsp");
			req.forward(request, response);
		}else {
			RequestDispatcher req = request.getRequestDispatcher("/JejuOlleh/views/login/login3.jsp");
			req.forward(request, response);
		}
        
        
		
	}
	
	
}