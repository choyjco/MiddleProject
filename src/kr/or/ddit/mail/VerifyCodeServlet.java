package kr.or.ddit.mail;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VerifyCodeServlet extends HttpServlet{


    private static final long serialVersionUID = 1L;

    public VerifyCodeServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String memMail = req.getParameter("memMail");
        int code = Integer.parseInt(req.getParameter("code"));

        boolean result = verifyAuthentication(memMail, code);

        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        out.print("{\"success\": " + result + "}");
        out.flush();
    }

   
    private boolean verifyAuthentication(String memMail, int code) {
      
        return code == 1234;
    }
}