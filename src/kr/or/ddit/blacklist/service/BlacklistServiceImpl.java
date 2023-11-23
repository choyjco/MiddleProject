package kr.or.ddit.blacklist.service;

import java.util.List;

import kr.or.ddit.blacklist.dao.BlacklistDaoImpl;
import kr.or.ddit.blacklist.dao.IBlacklistDao;
import kr.or.ddit.blacklist.vo.BlacklistVO;

public class BlacklistServiceImpl implements IBlacklistService{

	private IBlacklistDao blacklistDao;
	private static IBlacklistService blacklistService;
	
	public BlacklistServiceImpl() {
		blacklistDao = new BlacklistDaoImpl();
	}
	
	public static IBlacklistService getInstance() {
		
		if(blacklistService == null) {
			blacklistService = new BlacklistServiceImpl();
		}
		return blacklistService;
	}
	
	@Override
	public int registerBlacklist(BlacklistVO bv) {
		return blacklistDao.insertBlacklist(bv)
		;
	}

	@Override
	public boolean checkBlacklist(String blkNo) {
		return blacklistDao.checkBlacklist(blkNo);
	}

	@Override
	public List<BlacklistVO> getAllBlacklist() {
		return blacklistDao.getAllBlacklist();
	}

	@Override
	public int modifyBlacklist(BlacklistVO bv) {
		return blacklistDao.updateBlacklist(bv);
	}

	@Override
	public int removeBlacklist(String blkNo) {
		return blacklistDao.deleteBlacklist(blkNo);
	}

	@Override
	public List<BlacklistVO> searchBlacklist(BlacklistVO bv) {
		return blacklistDao.searchBlacklist(bv);
	}

	@Override
	public BlacklistVO getBlacklist(String blkNo) {
		return  blacklistDao.getBlacklist(blkNo);
	}

}
