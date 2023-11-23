package kr.or.ddit.reservation.service;

import java.util.List;

import kr.or.ddit.reservation.dao.IResDao;
import kr.or.ddit.reservation.dao.ResDaoImpl;
import kr.or.ddit.reservation.vo.ResVO;

public class ResServiceImpl implements IResService{

	private static IResService resService;
	
	private IResDao resDao;
	
	private ResServiceImpl() {
		resDao = ResDaoImpl.getInstance();
	}
	
	public static IResService getInstance() {
		if(resService == null) {
			resService = new ResServiceImpl();
		}
		return resService;
	}
	
	@Override
	public int insertRes(ResVO rv) {
		return resDao.insertRes(rv);
	}

	@Override
	public List<ResVO> getAllreslist() {
		return resDao.getAllreslist();
	}

	@Override
	public List<ResVO> getReslist(String memId) {
		return resDao.getReslist(memId);
	}

	@Override
	public List<ResVO> getResAccoList(String accoNo) {
		return resDao.getResAccolist(accoNo);
	}

	@Override
	public List<ResVO> getResSortAccoList(ResVO rv) {
		return resDao.getResSortAccoList(rv);
	}

}
