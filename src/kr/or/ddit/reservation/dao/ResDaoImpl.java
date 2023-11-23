package kr.or.ddit.reservation.dao;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.reservation.vo.ResVO;

public class ResDaoImpl extends MyBatisDao implements IResDao {

	private static IResDao resDao;

	private ResDaoImpl() {
	}

	public static IResDao getInstance() {
		if (resDao == null) {
			resDao = new ResDaoImpl();
		}

		return resDao;
	}

	@Override
	public int insertRes(ResVO rv) {
		int cnt = insert("reservation.insertRes", rv);
		return cnt;
	}

	@Override
	public List<ResVO> getAllreslist() {
		
		List<ResVO> reslist = new ArrayList<ResVO>(); 
		
		reslist = selectList("reservation.getalllist");
		
		return reslist;
	}
	
	@Override
	public List<ResVO> getReslist(String memId) {
		
		List<ResVO> reslist = new ArrayList<ResVO>();
		
		reslist = selectList("reservation.memreslist", memId);
		
		return reslist;
	}

	
	//숙소별 예약현황조회 (마이페이지-호스트 숙소리스트)
	@Override
	public List<ResVO> getResAccolist(String accoNo) {

		List<ResVO> resAccoList = new ArrayList<ResVO>();
		
		resAccoList = selectList("reservation.resaccolist", accoNo);
		
		return resAccoList;
	}

	@Override
	public List<ResVO> getResSortAccoList(ResVO rv) {
		List<ResVO> ressortList = selectList("reservation.ressoartlist", rv);
		return ressortList;
	}
}
