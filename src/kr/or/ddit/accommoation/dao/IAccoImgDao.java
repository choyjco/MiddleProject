package kr.or.ddit.accommoation.dao;

import java.util.List;

import kr.or.ddit.accommodation.vo.AccoImgVO;

public interface IAccoImgDao {

	public int insertAccoImg(AccoImgVO accoImgVO);

	//ACCO_IMG테이블의 ACCO_IMG_NO 다음 번호 가져오기
	public int getAccoImgNo();
	
	//저장파일리스트 가져오기
	public List<AccoImgVO> getAccoImgList(AccoImgVO accoImgVO);
	
	//이미지 업데이트
	public int UpdateAccoImg(AccoImgVO accoImgVO);
	
	
}
