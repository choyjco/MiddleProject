package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardFaqVO;

public interface IBoardFaqService {

	public int registerBoardFaq(BoardFaqVO bfv);
	
	public boolean checkBoardFaq(String faqNo);
	
	public List<BoardFaqVO> getAllBoardFaq();
	
	public int modifyBoardFaq(BoardFaqVO bfv);
	
	public int removeBoardFaq(String faqNo);

	public List<BoardFaqVO> searchBoardFaq(BoardFaqVO bfv);

	public BoardFaqVO getBoardFaq(String faqNo);
}
