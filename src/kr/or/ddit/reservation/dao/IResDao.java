package kr.or.ddit.reservation.dao;

import java.util.List;

import kr.or.ddit.reservation.vo.ResVO;

public interface IResDao {
	public int insertRes (ResVO rv);

	public List<ResVO> getAllreslist();

	public List<ResVO> getReslist(String memId);
	
	//숙소별 예약현황조회 (마이페이지-호스트 숙소리스트)
	public List<ResVO> getResAccolist(String accoNo);

	public List<ResVO> getResSortAccoList(ResVO rv);
	
}
