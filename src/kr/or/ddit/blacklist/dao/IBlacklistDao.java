package kr.or.ddit.blacklist.dao;

import java.util.List;

import kr.or.ddit.blacklist.vo.BlacklistVO;

public interface IBlacklistDao {

	 public int insertBlacklist(BlacklistVO bv);


	 public boolean checkBlacklist(String blkNo);

	
	 public List<BlacklistVO> getAllBlacklist();


	 public int updateBlacklist(BlacklistVO bv);

	
	 public int deleteBlacklist(String blkNo);
	 

	 public List<BlacklistVO> searchBlacklist(BlacklistVO bv);

	 //게시판 상세 보기
	 public BlacklistVO getBlacklist(String blkNo);
}
