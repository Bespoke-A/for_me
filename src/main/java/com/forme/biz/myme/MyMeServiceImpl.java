package com.forme.biz.myme;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("mymeService")
public class MyMeServiceImpl implements MyMeService {

	@Autowired
	public MyMeDAO myMeDAO;

	@Override
	public List<MyMeVO> MyMeList(String id) {
		System.out.println("MyMeList 실행");

		List<MyMeVO> mymeList = myMeDAO.MyMeList(id);

		return mymeList;
	}

	@Override
	public List<MyMeVO> MyMe(String id) {

		List<MyMeVO> mymeList = myMeDAO.MyMe(id);

		return mymeList;
	}
	@Override
	public void changeDeliDate(MyMeVO mmvo) {

		myMeDAO.changeDeliDate(mmvo);
	}


}
