<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.ddit.login.vo.MemberVO"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//  String key = getInitParameter("key");//단일 데이터 받음
//  String key = getInitParameter("pw"); //단일 데이터 받음
//  String key = getInitParameter("name");//단일 데이터 받음
MemberVO vo = new MemberVO();

//  직렬화 된 데이터를 쉽게 받아내기 위한 라이브러리 사용 - beanUtils
//  !! vo에 작성된 필드 항목과 넘어오는 데이터의 key가 일치해야 함 !! (join.jsp의 name = vo의 변수명)

//  BeanUtils.populate(데이터를  담을 bean공간 지정(=vo), 넘어오는 값)
BeanUtils.populate(vo, request.getParameterMap());

Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
Connection conn = DriverManager.getConnection(url, "team5_202304M", "java");
Statement stmt = conn.createStatement();
String sql = "Insert Into member(" + " mem_id, mem_pass, mem_name, mem_bir,"
		+ " mem_zip, mem_add1, mem_add2, mem_hp, mem_mail, reg_file, mem_ath, mem_cf)" 
		+ " values('" + vo.getMemId()+ "'," 
		+ "'" + vo.getMemPass() + "'," 
		+ "'" + vo.getMemNm() + "'," 
		+ "'" + vo.getMemBir() + "'," 
		+ "'" + vo.getMemZip() + "'," 
		+ "'" + vo.getMemAdd1() + "'," 
		+ "'" + vo.getMemAdd2() + "'," 
		+ "'" + vo.getMemHp()+ "'," 
		+ "'" + vo.getMemMail() + "'," 
		+ "'" + vo.getRegFile() + "'," 
		+ "'" + vo.getMemAth() + "'," 
		+ "'" + vo.getMemCf() + "')";

int result = stmt.executeUpdate(sql); // insert 성공 시 변경(추가)된 row수 반환
%>

<%=result%>






