	package kr.or.ddit.accommodation.service;
	
	import java.util.List;

import kr.or.ddit.accommodation.vo.AccommodationVO;
	
	public interface IAccommodationService {
	
		//등록
		public int registerAcco(AccommodationVO accoVO);
		
		//조회
		public AccommodationVO detail(String accoNo);
		
		//수정
		public int updateAcco(AccommodationVO accoVO);
		
		//상태변경
		public int statusChange(AccommodationVO accoVO);
		
		//상태변경을 위한 조회
		public AccommodationVO detailOne(String accoNo);

		public List<AccommodationVO> getAllacco();
	
		//호스트회원별 숙소조회
		public List<AccommodationVO> memAccoSelect(String memId);
	}
