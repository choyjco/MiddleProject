package kr.or.ddit.accommoation.dao;

import java.util.List;

import kr.or.ddit.accommodation.vo.AccommodationVO;

public interface IAccommodationDao {
	
	//숙소 등록
	public int insertAcco(AccommodationVO accoVO);
	
	//숙소 디테일 조회 >> accoNo로 조회
	public AccommodationVO getDetail(String accoNo);
	
	//숙소 수정
	public int updateAcco(AccommodationVO accoVO);
	
	//숙소 상태변경
//	public int statusChange(String accoState);
	public int statusChange(AccommodationVO accoVO);
	
	//숙소 상태변경을 위한 조회..
	public AccommodationVO getOneDetail(String accoNo); 
	
	//호스트별 숙소 조회
	public List <AccommodationVO> memAccoSelect(String memId);
}
