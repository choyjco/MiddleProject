package kr.or.ddit.accommodation.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import kr.or.ddit.accommodation.service.AccoImgService;
import kr.or.ddit.accommodation.service.AccommodationService;
import kr.or.ddit.accommodation.service.IAccoImgService;
import kr.or.ddit.accommodation.service.IAccommodationService;
import kr.or.ddit.accommodation.vo.AccoImgVO;
import kr.or.ddit.accommodation.vo.AccommodationVO;

@MultipartConfig
@WebServlet("/acco/insert.do")
public class insertAccoController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("insertAccoController->doGet");
		RequestDispatcher rd = req.getRequestDispatcher("/views/acco/insert.jsp");
		rd.forward(req, resp);
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{		
		req.setCharacterEncoding("UTF-8");
//		System.out.println("insertAccoController->doPost");
		
		String accoNo   = req.getParameter("accoNo");
		String accoName = req.getParameter("accoName");
		String accoLoc  = req.getParameter("accoLoc");
		String accoMax  = req.getParameter("accoMax");
		int accoPri;
		try {
		    accoPri = Integer.parseInt(req.getParameter("accoPri"));
		} catch (NumberFormatException ex) {
		    accoPri = 0; // 기본값 설정
		}
		accoPri  = Integer.parseInt(req.getParameter("accoPri"));
		String accoInfo = req.getParameter("accoInfo");
		String accoCate = req.getParameter("accoCate");
		String accoType = req.getParameter("accoType");
		String accoRoom = req.getParameter("accoRoom");
		String accoBed  = req.getParameter("accoBed");
		String accoBath = req.getParameter("accoBath");
	    String[] accoOptValues = req.getParameterValues("accoOpt[]");
		String accoLoc2 = req.getParameter("accoLoc2");
		String accoState = req.getParameter("accoState");
		
		String accoOpt="";
		for(int i=0; i<accoOptValues.length; i++) {
			if(accoOptValues.length-1 > i ) {
				accoOpt += accoOptValues[i] + ",";
			}else {
				accoOpt += accoOptValues[i];
			}
		}
		
		IAccommodationService accoService = AccommodationService.getInstance();
		IAccoImgService accoImgService = AccoImgService.getInstance();
		
		
		AccoImgVO accoImgVO = new AccoImgVO();
		accoImgVO = accoImgService.uploadImgList(req);
		
		AccommodationVO accoVO = new AccommodationVO(accoNo, accoName, accoLoc, accoMax, accoPri, accoInfo, accoCate, accoType, accoRoom, accoBed, accoBath, accoOpt, accoLoc2, accoState);
		
		//로그인한 memId가져오기
		accoVO.setMemId((String)req.getSession().getAttribute("memId"));
		
		if(accoImgVO != null) {
			accoVO.setAccoImgNo(accoImgVO.getAccoImgNo());
		}
		
		int cnt = accoService.registerAcco(accoVO);
		
		System.out.println("insert cnt : " + cnt);
		
		resp.sendRedirect(req.getContextPath()+ "/acco/Mdetail.do?accoNo="+accoVO.getAccoNo());

	}
}
