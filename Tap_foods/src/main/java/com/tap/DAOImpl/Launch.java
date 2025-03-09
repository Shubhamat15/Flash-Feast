package com.tap.DAOImpl;

import com.tap.DAOImpl.ResturantDAOImpl;
import com.tap.models.Resturant;

public class Launch {
    public static void main(String[] args) {
        ResturantDAOImpl resturantDAO = new ResturantDAOImpl();

        
        int resturantId = 1;  
        String newImagePath = "/Tap_foods/src/main/webapp/ImageResturant/pexels-pixabay-262047.jpg";  

        
        Resturant resturant = new Resturant();  
        resturant.setResturantId(resturantId);  
        resturant.setImagePath(newImagePath);

        // Calling the update method
        resturantDAO.updateResturant(resturant);

        System.out.println("Image updated successfully for restaurant ID: " + resturantId);
    }
}
