package kr.or.ddit.reservation.service;

import java.util.List;

import kr.or.ddit.reservation.vo.ResVO;

public interface IResService {
	
	public int insertRes(ResVO rv);
	
	public List<ResVO> getAllreslist();
	
	public List<ResVO> getReslist(String memId);
	
	public List<ResVO> getResAccoList(String accoNo);
	
	public List<ResVO> getResSortAccoList(ResVO rv);
	
}
