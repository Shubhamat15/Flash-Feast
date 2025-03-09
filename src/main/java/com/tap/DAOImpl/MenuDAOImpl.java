package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.Utility.DBConnection;
import com.tap.models.Menu;

public class MenuDAOImpl implements MenuDAO {

    @Override
    public Menu getMenu(int menuId) {
        String GET_MENU_BY_ID = "SELECT * FROM menu WHERE menuId = ?";
        Menu menu = null;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_MENU_BY_ID)) {
             
            preparedStatement.setInt(1, menuId);
            ResultSet res = preparedStatement.executeQuery();

            if (res.next()) {
                int resturantId = res.getInt("resturantId");
                String name = res.getString("itemName");
                String description = res.getString("description");
                double price = res.getDouble("price");
                String isAvailable = res.getString("isAvailable");
                double ratings = res.getDouble("ratings");
                String imagePath = res.getString("imagePath");

                menu = new Menu(menuId, resturantId, name, description, price, isAvailable, ratings, imagePath);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menu;
    }

    @Override
    public void updateMenu(Menu menu) {
        String UPDATE_MENU = "UPDATE menu SET itemName = ?, description = ?, price = ?, isAvailable = ? WHERE menuId = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_MENU)) {
             
            preparedStatement.setString(1, menu.getItemName());
            preparedStatement.setString(2, menu.getDescription());
            preparedStatement.setDouble(3, menu.getPrice());
            preparedStatement.setString(4, menu.getIsAvailable());
            preparedStatement.setInt(5, menu.getMenuId());

            int rowsUpdated = preparedStatement.executeUpdate();
            System.out.println(rowsUpdated + " Row(s) Updated");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMenu(int menuId) {
        String DELETE_MENU = "DELETE FROM menu WHERE menuId = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_MENU)) {
             
            preparedStatement.setInt(1, menuId);
            int rowsDeleted = preparedStatement.executeUpdate();
            System.out.println(rowsDeleted + " Row(s) Deleted");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Menu> getAllMenusByResturant(int resturantId) {
        List<Menu> menuList = new ArrayList<>();
        String GET_ALL_MENU = "SELECT * FROM menu WHERE resturantId = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_MENU)) {
             
            preparedStatement.setInt(1, resturantId);
            ResultSet res = preparedStatement.executeQuery();

            while (res.next()) {
                int menuId = res.getInt("menuId");
                String itemName = res.getString("itemName");
                String description = res.getString("description");
                double price = res.getDouble("price");
                String isAvailable = res.getString("isAvailable");
                double ratings = res.getDouble("ratings");
                String imagePath = res.getString("imagePath");

                Menu menu = new Menu(menuId, resturantId, itemName, description, price, isAvailable, ratings, imagePath);
                menuList.add(menu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuList;
    }

    @Override
    public void addMenu(Menu menu) {
        String INSERT = "INSERT INTO menu (resturantId, itemName, description, price, isAvailable, ratings, imagePath) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT)) {
             
            preparedStatement.setInt(1, menu.getResturantId());
            preparedStatement.setString(2, menu.getItemName());
            preparedStatement.setString(3, menu.getDescription());
            preparedStatement.setDouble(4, menu.getPrice());
            preparedStatement.setString(5, menu.getIsAvailable());
            preparedStatement.setDouble(6, menu.getRatings());
            preparedStatement.setString(7, menu.getImagePath());

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " Row(s) Added");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
