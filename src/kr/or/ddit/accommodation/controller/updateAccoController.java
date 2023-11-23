package kr.or.ddit.accommodation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.accommodation.service.AccoImgService;
import kr.or.ddit.accommodation.service.AccommodationService;
import kr.or.ddit.accommodation.service.IAccoImgService;
import kr.or.ddit.accommodation.service.IAccommodationService;
import kr.or.ddit.accommodation.vo.AccoImgVO;
import kr.or.ddit.accommodation.vo.AccommodationVO;

@MultipartConfig
@WebServlet("/acco/update.do")
public class updateAccoController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("update doget");

		//상세보기하려면 키값 > 숙소 id
		String accoNo = req.getParameter("accoNo");
//		System.out.println("update doget acco no" + accoNo );
		
		//서비스 생성
		IAccommodationService accoService = AccommodationService.getInstance();
		IAccoImgService accoImgService = AccoImgService.getInstance();
		
		//숙소 상세 정보 조회
		AccommodationVO accoVO = accoService.detail(accoNo);
		
		//이미지 파일이 있을때만 작업
		if(accoVO.getAccoImgNo() != 0) {
			AccoImgVO accoImgVO = new AccoImgVO();
			accoImgVO.setAccoImgNo(accoVO.getAccoImgNo());
			List<AccoImgVO> accoImgList = accoImgService.getAccoImgList(accoImgVO);
			
			req.setAttribute("accoImgList", accoImgList);
		}
		
		//요청객체에 데이터 저장
		req.setAttribute("accoVO", accoVO);
		
//		System.out.println("updateController doget accoVO"+ accoVO);
		
		req.getRequestDispatcher("/views/acco/update.jsp").forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,IOException {
		req.setCharacterEncoding("UTF-8");
//		System.out.println("update dopost");
		
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
		String accoInfo = req.getParameter("accoInfo");
		String accoCate = req.getParameter("accoCate");
		String accoType = req.getParameter("accoType");
		String accoRoom = req.getParameter("accoRoom");
		String accoBed  = req.getParameter("accoBed");
		String accoBath = req.getParameter("accoBath");
	    String[] accoOptValues = req.getParameterValues("accoOpt[]");
		String accoLoc2 = req.getParameter("accoLoc2");
		String accoImgNoStr = req.getParameter("accoImgNo");
		int accoImgNo = 0;
		if (accoImgNoStr != null) {
		    accoImgNo = Integer.parseInt(accoImgNoStr);
		}
		String accoOpt="";
		
		for(int i=0; i<accoOptValues.length; i++) {
			if(accoOptValues.length-1 > i ) {
				accoOpt += accoOptValues[i] + ",";
			}else {
				accoOpt += accoOptValues[i];
			}
		}
		
		//서비스 생성
		IAccommodationService accoService = AccommodationService.getInstance();
		IAccoImgService accoImgService = AccoImgService.getInstance();
		
		AccoImgVO accoImgVO = null;
		
		accoImgVO = accoImgService.uploadImgList(req);
		
		AccommodationVO accoVO = new AccommodationVO(accoNo, accoName, accoLoc, accoMax, accoPri, accoInfo, accoCate, accoType, accoRoom, accoBed, accoBath, accoOpt, accoLoc2);
//		System.out.println("updateController dopost accoVO"+ accoVO);

		//파일을 새로 선택할 때만 실행되게
		if(accoImgVO == null) {
			accoVO.setAccoImgNo(accoImgNo);
		}else {
			accoVO.setAccoImgNo(accoImgVO.getAccoImgNo());
		}
		
		int cnt = accoService.updateAcco(accoVO);
		
//		System.out.println("수정 cnt : " + cnt);
		
		resp.sendRedirect(req.getContextPath()+"/acco/Mdetail.do?accoNo="+accoVO.getAccoNo());
				
	}	

}

