package com.forme.biz.myme;

import java.util.List;

public interface MyMeService {

	List<MyMeVO> MyMeList(String id); 
	List<MyMeVO> MyMe(String id); 
	
	void changeDeliDate(MyMeVO mmvo);
}
