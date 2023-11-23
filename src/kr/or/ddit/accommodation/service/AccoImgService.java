	package kr.or.ddit.accommodation.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.accommoation.dao.AccoImgDao;
import kr.or.ddit.accommodation.vo.AccoImgVO;

public class AccoImgService implements IAccoImgService {
	
	private AccoImgDao accoImgDao;
	
	private static AccoImgService accoImgService;

	public AccoImgService() {
		accoImgDao = AccoImgDao.getInstance();
	}
	
	public static AccoImgService getInstance() {
		if(accoImgService==null) {
			accoImgService = new AccoImgService();
		}
		return accoImgService;
	}

	@Override
	public AccoImgVO uploadImgList(HttpServletRequest req) {

	    String path = "D:\\4.highjava\\workspace\\JejuOlleh\\WebContent\\images\\acco";
	    
	    File uploadDir = new File(path);

	    if (!uploadDir.exists()) { // 업로드 폴더 존재하지 않으면..
	        // 생성
	        uploadDir.mkdir();
	    }

	    AccoImgVO accoImgVO = null;
	    boolean isFirstFile = true; // 첫번째 파일 여부 

	    //한 번 만들어진 번호로 통일
	    int accoImgNo = this.accoImgDao.getAccoImgNo();
	    int accoImgSn = 1;
//	    System.out.println("accoImgNo : " + accoImgNo + ", accoImgSn : " + accoImgSn);

	    try {
	        for (Part part : req.getParts()) {

	            String fileName = part.getSubmittedFileName();

	            if (fileName != null && !fileName.equals("")) {

	                // 여기서부터 진짜 업로드 작업
	                String orgnFileName = fileName; // 원본 파일명
	                String saveFileName = ""; // 저장 파일명
	                String saveFilePath = ""; // 저장 파일 경로

	                // 랜덤한 아이디 부여
	                saveFileName = UUID.randomUUID().toString().replace("-", "");
	                saveFilePath = uploadDir + File.separator + saveFileName + "_" + orgnFileName;

//	                System.out.println("saveFileName" + saveFileName);
//	                System.out.println("saveFilePath" + saveFilePath);
//	                System.out.println("orgnFileName" + orgnFileName);

	                // 파일 업로드 처리
	                part.write(saveFilePath);
	                // part.write(saveFileName+"_"+orgnFileName);

	                // 파일 기본정보 저장하기
	                if (isFirstFile) { // 첫번째 파일인 경우...
	                    accoImgVO = new AccoImgVO();
	                    accoImgVO.setAccoImgNo(accoImgNo); //한 번 만들어진 번호로 통일
	                    isFirstFile = false;
	                }

	                // 파일 세부정보 저장
	                accoImgVO.setAccoImgPath("/images/acco/" + saveFileName + "_" + orgnFileName);
	                accoImgVO.setAccoImgSn(accoImgSn++); //1 2 3
	                accoImgDao.insertAccoImg(accoImgVO);

	                part.delete(); // 임시 업로드 파일 삭제하기
	            }
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return accoImgVO;
	}

	@Override
	public List<AccoImgVO> getAccoImgList(AccoImgVO accoImgVO) {
		return accoImgDao.getAccoImgList(accoImgVO);
	}

	
}
