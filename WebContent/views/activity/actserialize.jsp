<%@page import="kr.or.ddit.activity.vo.ActivityImgVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.ddit.activity.vo.ActivityVO"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ActivityVO vo = new ActivityVO();

BeanUtils.populate(vo, request.getParameterMap());

// 데이터베이스 연결 및 쿼리 실행
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
Connection conn = DriverManager.getConnection(url, "team5_202304M", "java");
Statement stmt = conn.createStatement();

    
    // activity 테이블에 데이터 삽입
    String sql = "INSERT All INTO activity ( ACT_NO, ACT_NAME, ACT_LOC, ACT_TEL, ACT_INTRO, ACT_CATE ) " +
                               "VALUES ( 'CNTS_' || LPAD(act_no_seq.nextval, 11, '0' ), " +
                               "'" + vo.getActName() + "'," +
                               "'" + vo.getActLoc() + "'," +
                               "'" + vo.getActTel() + "'," +
                               "'" + vo.getActIntro() + "'," +
                               "'" + vo.getActCate() + ")"
                               
    + " INTO act_img ( ACT_IMG_NO, ACT_NO, ACT_IMG_PATH ) " 
    + " VALUES ( act_img_no_seq.nextval, 'CNTS_' || LPAD(act_no_seq.nextval, 11, '0') " 
    + "( '/images/activity/" + vo.getActivityImgVO().getActImgPath() + "')";
                              


int result = stmt.executeUpdate(sql);
%>

<%= result %>
