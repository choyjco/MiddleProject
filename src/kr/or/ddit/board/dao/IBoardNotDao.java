package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.board.vo.BoardNotVO;

public interface IBoardNotDao {

	 public int insertBoardNot(BoardNotVO bnv);


	 public boolean checkBoardNot(String notNo);

	
	 public List<BoardNotVO> getAllBoardNot();


	 public int updateBoardNot(BoardNotVO bnv);

	
	 public int deleteBoardNot(String notNo);
	 

	 public List<BoardNotVO> searchBoardNot(BoardNotVO bnv);

	 //게시판 상세 보기
	 public BoardNotVO getBoardNot(String notNo);
}
