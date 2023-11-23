package kr.or.ddit.board.dao;

import java.util.List;
import kr.or.ddit.board.vo.BoardAnswerVO;

public interface IBoardAnswerDao {

	public int insertBoardAnswer(BoardAnswerVO basv);

	
	public List<BoardAnswerVO> getAllBoardAnswer();
	
	
	public List<BoardAnswerVO> getBoardAnswer2(String askNo);


	public int updateBoardAnswer(BoardAnswerVO basv);
	
	
	public int updateBoardAnswerY(BoardAnswerVO basv);

	
	public int updateBoardAnswerN(BoardAnswerVO basv);
	
	
	public int deleteBoardAnswer(String askNo);
	 
	
	public BoardAnswerVO getBoardAnswer(String askNo);
	
}
