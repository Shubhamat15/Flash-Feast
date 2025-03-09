package com.tap.DAOImpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.ResturantDAO;
import com.tap.Utility.DBConnection;
import com.tap.models.Resturant;

public class ResturantDAOImpl implements ResturantDAO {

    @Override
    public void addResturant(Resturant resturant) {
        String INSERT = "INSERT INTO `resturant` (`name`, `address`, `phoneNumber`, `cuisineType`, `deliveryTime`, `adminUserId`, `rating`, `isActive`, `imagePath`) VALUES (?,?,?,?,?,?,?,?,?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT)) {

            preparedStatement.setString(1, resturant.getName());
            preparedStatement.setString(2, resturant.getAddress());
            preparedStatement.setString(3, resturant.getPhoneNumber());
            preparedStatement.setString(4, resturant.getCuisineType());
            preparedStatement.setTimestamp(5, Timestamp.valueOf(resturant.getDeliveryTime())); 
            preparedStatement.setString(6, resturant.getAdminUserId());
            preparedStatement.setBigDecimal(7, resturant.getRating()); 
            preparedStatement.setBoolean(8, resturant.isActive()); 
            preparedStatement.setString(9, resturant.getImagePath());

            int i = preparedStatement.executeUpdate();
            System.out.println(i + " row/s affected");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Resturant getResturant(int resturantId) {
        String GET_REST_BY_ID = "SELECT * FROM `resturant` WHERE `resturantId` = ?";
        Resturant resturant = null;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_REST_BY_ID)) {

            preparedStatement.setInt(1, resturantId);
            ResultSet res = preparedStatement.executeQuery();

            if (res.next()) {
                resturant = new Resturant(
                    res.getInt("resturantId"),
                    res.getString("name"),
                    res.getString("address"),
                    res.getString("phoneNumber"),
                    res.getString("cuisineType"),
                    res.getTimestamp("deliveryTime").toLocalDateTime(), 
                    res.getString("adminUserId"),
                    res.getBigDecimal("rating"), 
                    res.getBoolean("isActive"), 
                    res.getString("imagePath")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resturant;
    }

    @Override
    public void updateResturant(Resturant resturant) {
        String UPDATE_REST = "UPDATE `resturant` SET `name` = ?, `phoneNumber` = ?, `address` = ?, `cuisineType` = ?, `rating` = ?, `isActive` = ? WHERE `resturantId` = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_REST)) {

            preparedStatement.setString(1, resturant.getName());
            preparedStatement.setString(2, resturant.getPhoneNumber());
            preparedStatement.setString(3, resturant.getAddress());
            preparedStatement.setString(4, resturant.getCuisineType());
            preparedStatement.setBigDecimal(5, resturant.getRating()); 
            preparedStatement.setBoolean(6, resturant.isActive()); 
            preparedStatement.setInt(7, resturant.getResturantId());

            int n = preparedStatement.executeUpdate();
            System.out.println(n + " row/s updated");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    
   
    
    

    @Override
    public void deleteResturant(int resturantId) {
        String DELETE_REST = "DELETE FROM `resturant` WHERE `resturantId` = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_REST)) {

            preparedStatement.setInt(1, resturantId);
            int n = preparedStatement.executeUpdate();
            System.out.println(n + " row/s deleted");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Resturant> getAllResturant() {
        Connection con = DBConnection.getConnection();
        List<Resturant> restList = new ArrayList<>();

        String GET_ALL_RESTURANT = "SELECT * FROM resturant";

        try (Statement statement = con.createStatement();
             ResultSet res = statement.executeQuery(GET_ALL_RESTURANT)) {

            while (res.next()) {
                int resturantId = res.getInt("resturantId");
                String name = res.getString("name");
                String address = res.getString("address");
                String phoneNumber = res.getString("phoneNumber");
                String cuisineType = res.getString("cuisineType");

                // Handling potential NULL values
                Timestamp timestamp = res.getTimestamp("deliveryTime");
                LocalDateTime deliveryTime = (timestamp != null) ? timestamp.toLocalDateTime() : null;

                String adminUserId = res.getString("adminUserId");
                float rating = res.getFloat("rating");
                boolean isActive = res.getBoolean("isActive");
                String imagePath = res.getString("imagePath");

                Resturant rest = new Resturant(resturantId, name, address, phoneNumber, cuisineType, deliveryTime, adminUserId, BigDecimal.valueOf(rating), isActive, imagePath);
                restList.add(rest);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return restList;
    }
}