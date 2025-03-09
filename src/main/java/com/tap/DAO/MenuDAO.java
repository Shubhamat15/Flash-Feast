package com.tap.DAO;

import java.util.List;

import com.tap.models.Menu;

public interface MenuDAO {

	Menu getMenu(int menuId);
	void updateMenu(Menu menu);
	void deleteMenu(int menuId);
	List<Menu> getAllMenusByResturant(int resturantId);
	void addMenu(Menu menu);
	
}
