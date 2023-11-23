package kr.or.ddit.accommodationwish.service;

import java.util.List;

import kr.or.ddit.accommodationwish.vo.AccoWishVO;

public interface IAccommodationwishService {

//	public int insertwish(String accoWishNo);

	public int insertwish(AccoWishVO accowv);

	public List<AccoWishVO> getwishlist(String memId);

}
