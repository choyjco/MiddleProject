package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.board.vo.BoardFaqVO;

public interface IBoardFaqDao {

	 public int insertBoardFaq(BoardFaqVO bfv);


	 public boolean checkBoardFaq(String faqNo);

	
	 public List<BoardFaqVO> getAllBoardFaq();


	 public int updateBoardFaq(BoardFaqVO bfv);

	
	 public int deleteBoardFaq(String faqNo);
	 

	 public List<BoardFaqVO> searchBoardFaq(BoardFaqVO bfv);

	 
	 public BoardFaqVO getBoardFaq(String faqNo);
}
