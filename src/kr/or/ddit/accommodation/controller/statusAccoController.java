package kr.or.ddit.accommodation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.accommodation.service.AccommodationService;
import kr.or.ddit.accommodation.service.IAccommodationService;
import kr.or.ddit.accommodation.vo.AccommodationVO;

@MultipartConfig
@WebServlet("/acco/statusChange.do")
public class statusAccoController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String accoNo = req.getParameter("accoNo");
//		System.out.println("statusController doget accoNo" + accoNo);
		
		IAccommodationService accoService = AccommodationService.getInstance();
		
		AccommodationVO accoVO = accoService.detailOne(accoNo);
		
		req.setAttribute("accoVO", accoVO);

		req.getRequestDispatcher("/views/acco/statusChange.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 req.setCharacterEncoding("UTF-8");
		    
		    String accoNo = req.getParameter("accoNo");
		    String accoState = req.getParameter("accoState");
		    String accoName = req.getParameter("accoName");
		    String accoLoc  = req.getParameter("accoLoc");
			String accoMax  = req.getParameter("accoMax");
			int accoPri;
			try {
			    accoPri = Integer.parseInt(req.getParameter("accoPri"));
			} catch (NumberFormatException ex) {
			    accoPri = 0; // 기본값 설정
			}
			String accoInfo = req.getParameter("accoInfo");
			String accoCate = req.getParameter("accoCate");
			String accoType = req.getParameter("accoType");
			String accoRoom = req.getParameter("accoRoom");
			String accoBed  = req.getParameter("accoBed");
			String accoBath = req.getParameter("accoBath");
			String accoOpt = req.getParameter("accoOpt");
			String accoLoc2 = req.getParameter("accoLoc2");
		    
		    IAccommodationService accoService = AccommodationService.getInstance();
		  
		    AccommodationVO accoVO = new AccommodationVO(accoNo, accoName, accoLoc, accoMax, accoPri, accoInfo, accoCate, accoType, accoRoom, accoBed, accoBath, accoOpt, accoLoc2, accoState);
		    
		    int cnt = accoService.statusChange(accoVO);
		    
		    System.out.println("statusAccoChange cnt" + cnt);
		    
		    resp.sendRedirect(req.getContextPath() + "/acco/Mdetail.do?accoNo=" + accoVO.getAccoNo());
}
}
