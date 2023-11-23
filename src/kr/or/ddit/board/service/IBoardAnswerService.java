package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardAnswerVO;

	public interface IBoardAnswerService {

		public int registerBoardAnswer(BoardAnswerVO basv);

		
		public List<BoardAnswerVO> getAllBoardAnswer();

		
		public List<BoardAnswerVO> getBoardAnswer2(String askNo);

		
		public int modifyBoardAnswer(BoardAnswerVO basv);

		
		public int modifyBoardAnswerY(BoardAnswerVO basv);
		
		
		public int modifyBoardAnswerN(BoardAnswerVO basv);
	
		
		public int removeBoardAnswer(String askNo);
		 
		
		public BoardAnswerVO getBoardAnswer(String askNo);
	
}
