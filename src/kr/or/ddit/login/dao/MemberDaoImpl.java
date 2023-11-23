package kr.or.ddit.login.dao;


import kr.or.ddit.login.service.MemberServiceImpl;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.comm.dao.MyBatisDao;

public class MemberDaoImpl extends MyBatisDao implements IMemberDao {

	private static IMemberDao dao;
	
	//서비스측에서 호출할 dao객체 생성하기 - 싱글톤방식으로
	//1. private constructor
	private MemberDaoImpl() {
	}
	//2. static method
	public static IMemberDao getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	}
	
	@Override
	public String loginChk(Map<String, Object> map) {
		return selectOne("member.loginChk", map);
	}
	@Override
	public String passChk(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
