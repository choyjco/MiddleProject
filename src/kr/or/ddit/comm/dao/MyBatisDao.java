package kr.or.ddit.comm.dao;

import java.util.Collections;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.reservation.vo.ResVO;
import kr.or.ddit.util.MyBatisUtil;

public class MyBatisDao {

	public <T> T selectOne(String statemnet) {

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		T obj = null;

		try {

			obj = sqlSession.selectOne(statemnet);

		} catch (PersistenceException ex) {
			throw new RuntimeException("마이바티스에서 데이터 조회 중 예외 발생!", ex);
		} finally {
			sqlSession.close();
		}

		return obj;
	}

	public <T> T selectOne(String statemnet, Object parameter) {

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		T obj = null;

		try {

			obj = sqlSession.selectOne(statemnet, parameter);

		} catch (PersistenceException ex) {
			throw new RuntimeException("마이바티스에서 데이터 조회 중 예외 발생!", ex);
		} finally {
			sqlSession.close();
		}

		return obj;
	}

	public <T> List<T> selectList(String statement) {

		SqlSession session = MyBatisUtil.getInstance(true);

		List<T> list = Collections.EMPTY_LIST;

		try {

			list = session.selectList(statement);

		} catch (PersistenceException ex) {
			throw new RuntimeException("마이바티스에서 목록 조회중 예외 발생 !", ex);
		} finally {
			session.close();
		}

		return list;
	}

	public <T> List<T> selectList(String statement, Object parameter) {

		SqlSession session = MyBatisUtil.getInstance(true);

		List<T> list = Collections.EMPTY_LIST;

		try {

			list = session.selectList(statement, parameter);

		} catch (PersistenceException ex) {
			throw new RuntimeException("마이바티스에서 목록 조회중 예외 발생 !", ex);
		} finally {
			session.close();
		}

		return list;
	}

	public int insert(String statement, Object parameter) {

		SqlSession session = MyBatisUtil.getInstance();

		int cnt = 0;

		try {

			cnt = session.insert(statement, parameter);

			session.commit();

		} catch (PersistenceException ex) {
			session.rollback();
			throw new RuntimeException("마이바티스에서 데이터 등록 중 예외 발생!", ex);
		} finally {
			session.close();
		}
		return cnt;
	}

	public int update(String statement, Object parameter) {
		SqlSession session = MyBatisUtil.getInstance();

		int cnt = 0;

		try {

			cnt = session.update(statement, parameter);

			session.commit();

		} catch (PersistenceException ex) {
			session.rollback();
			throw new RuntimeException("마이바티스에서 데이터 수정 중 예외 발생!", ex);
		} finally {
			session.close();
		}
		return cnt;
	}

	public int delete(String statement, Object parameter) {
		SqlSession session = MyBatisUtil.getInstance();

		int cnt = 0;

		try {

			cnt = session.delete(statement, parameter);

			session.commit();

		} catch (PersistenceException ex) {
			session.rollback();
			throw new RuntimeException("마이바티스에서 데이터 삭제 중 예외 발생!", ex);
		} finally {
			session.close();
		}
		return cnt;
	}


}
