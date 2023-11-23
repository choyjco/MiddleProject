package kr.or.ddit.blacklist.service;

import java.util.List;

import kr.or.ddit.blacklist.vo.BlacklistVO;

public interface IBlacklistService {

	public int registerBlacklist(BlacklistVO bv);
	
	public boolean checkBlacklist(String blkNo);
	
	public List<BlacklistVO> getAllBlacklist();
	
	public int modifyBlacklist(BlacklistVO bv);
	
	public int removeBlacklist(String blkNo);

	public List<BlacklistVO> searchBlacklist(BlacklistVO bv);

	public BlacklistVO getBlacklist(String bltNo);
}
