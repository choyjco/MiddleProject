package kr.or.ddit.login.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.login.dao.IMemberDao;
import kr.or.ddit.login.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

public class MemberServiceImpl  implements IMemberService{

	private IMemberDao dao;
	private static IMemberService  service;
	
	//1 
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();	
	}
	//2
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
		
	@Override
	public String loginChk(Map<String, Object> map) {
		
		String memId = "";
		try {
			//dao에게 정보 반환 받기
			memId = dao.loginChk(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return memId;
	}
	

	@Override
	public String passChk(Map<String, Object> map) {
		
		String memId = "";
		try {
			//dao에게 정보 반환 받기
			memId = dao.loginChk(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return memId;
	}
	@Override
	public void updatePassword(String memMail, String memPw) {
		// TODO Auto-generated method stub
		
	}


}
