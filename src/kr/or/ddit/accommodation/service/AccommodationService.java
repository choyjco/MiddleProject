package kr.or.ddit.accommodation.service;

import java.util.List;

import kr.or.ddit.accommoation.dao.AccommodationDao;
import kr.or.ddit.accommodation.vo.AccommodationVO;

public class AccommodationService implements IAccommodationService {

	private AccommodationDao accoDao;
	
	//싱글톤패턴
	private static AccommodationService accoService;
	
	private AccommodationService() {
		accoDao = AccommodationDao.getInstance();
	}
	
	public static AccommodationService getInstance() {
		if(accoService == null) {
			accoService = new AccommodationService();
		}
		return accoService;
	}
	
	//등록
	@Override
	public int registerAcco(AccommodationVO accoVO) {
		return accoDao.insertAcco(accoVO);
	}

	//조회
	@Override
	public AccommodationVO detail(String accoNo) {
		return accoDao.getDetail(accoNo);
	}

	//수정
	@Override
	public int updateAcco(AccommodationVO accoVO) {
		return accoDao.updateAcco(accoVO);
	}

	//상태변경
	@Override
	public int statusChange(AccommodationVO accoVO) {
	    return accoDao.statusChange(accoVO);
	}
	
	@Override
	public AccommodationVO detailOne(String accoNo) {
		return accoDao.getOneDetail(accoNo);
	}

	@Override
	public List<AccommodationVO> getAllacco() {
		// TODO Auto-generated method stub
		return accoDao.getAllacco();
	}

	//호스트 회원별 숙소 조회
	@Override
	public List<AccommodationVO> memAccoSelect(String memId) {
		return accoDao.memAccoSelect(memId);
	}
}
