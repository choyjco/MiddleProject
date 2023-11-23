package kr.or.ddit.login.dao;

import java.sql.SQLException;
import java.util.Map;

public interface IMemberDao {

	//로그인 체크(id-pw검증)
	//나를 호출하는 service측에 예외사항처리를 전가함
	public String loginChk(Map<String, Object> map) throws SQLException;

	public String passChk(Map<String, Object> map) throws SQLException;

}
