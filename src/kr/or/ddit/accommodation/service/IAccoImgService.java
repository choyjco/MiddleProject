package kr.or.ddit.accommodation.service;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.accommodation.vo.AccoImgVO;

public interface IAccoImgService {

	// 이미지저장하기
	public AccoImgVO uploadImgList (HttpServletRequest req);
	
	//이미지 불러오기
	public List<AccoImgVO> getAccoImgList(AccoImgVO accoImgVO);

}
