package com.tap.DAO;

import java.util.List;

import com.tap.models.User;

public interface UserDAO {

	boolean addUser(User user);
	
	User getUser(int userID);
	
	User getUser(String email);
	
	void updateUser(User user);
	
	void deleteUser(int userId);
	
	User getUserByEmailAndPassword(String email, String password);
     
	List<User> getAllusers();	
}
