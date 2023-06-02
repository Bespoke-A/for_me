package com.forme.biz.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.forme.biz.menu.MenuVO;

@Repository("menuService")
public class MenuDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MenuDAO() {
		System.out.println("📦 menuDAO1() 객체 생성");
	}
	
	// Menu Insert
	//정회님 컨트롤러 시작-------------------------------------------------------------------------------------------------------------
	public void insertMenu(MenuVO vo) {
		System.out.println("🌐 Mybatis insertMenu() 실행");
		mybatis.insert("menuDAO1.insertMenu", vo);
	}
	
	public void updateMenu(MenuVO vo) {
		System.out.println("🌐 Mybatis updateMenu() 실행");
		mybatis.update("menuDAO1.updateMenu", vo);
	}
	
	public void deleteMenu(int menuId) {
		System.out.println("🌐 Mybatis deleteMenu() 실행");
		mybatis.delete("menuDAO1.deleteMenu", menuId);
	}
	
	public MenuVO getMenu(MenuVO vo) {
		System.out.println("🌐️ Mybatis getMenu() 실행");
		return mybatis.selectOne("menuDAO1.getMenu", vo.getMenuId());
	}
	
	public List<MenuVO> getJsonMenuList(String searchKeyword) {
		System.out.println(" Mybatis getMenuList(vo) 실행");
		System.out.println("menuDAO1 searchKeyword : " + searchKeyword);
		List<MenuVO> list = null;
		// 검색조건 값이 없을 때 기본값 설정
		if (searchKeyword == null) {
			searchKeyword = "";
			System.out.println("searchKeyword : " + searchKeyword);
		}
		
		if(searchKeyword != null) {
			System.out.println("searchKeyword : " + searchKeyword);
			list = mybatis.selectList("menuDAO1.getSearchMenuList", searchKeyword);
		}
		return list;
	}
	
	public List<MenuVO> getMenuList(MenuVO vo) {
		return mybatis.selectList("menuDAO1.getMenuList", vo);
	}
	//정회님 컨트롤러 끝-------------------------------------------------------------------------------------------------------------
	
	//혜인님 컨트롤러 시작-------------------------------------------------------------------------------------------------------------
	public List<MenuVO> getThumSix() {
		System.out.println("==> MyBatis 사용 getThumSix()실행");
		List<MenuVO> list = null;
		int  subType = 6000;
		list = mybatis.selectList("menuDAO1.getThum", subType);
		return list;
	}
	public List<MenuVO> getThumEight() {
		System.out.println("==> MyBatis 사용 getThumEight()실행");
		List<MenuVO> list = null;
		int subType = 8000;
		list = mybatis.selectList("menuDAO1.getThum", subType);
		return list;
	}
	public List<MenuVO> getThumTen() {
		System.out.println("==> MyBatis 사용 getThumTen()실행");
		List<MenuVO> list = null;
		int subType = 10000;
		list = mybatis.selectList("menuDAO1.getThum", subType);
		return list;
	}
	public MenuVO viewDetail(MenuVO vo) {
		System.out.println("==>MyBatis 사용 getMenu()실행");
		return mybatis.selectOne("menuDAO1.viewDetail", vo.getMenuId());
	}
	//혜인님 컨트롤러 끝-------------------------------------------------------------------------------------------------------------
}
