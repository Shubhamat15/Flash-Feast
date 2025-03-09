package com.tap.models;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Objects;

public class Resturant {

    private  int resturantId;
    private String name;
    private String address;
    private String phoneNumber;
    private String cuisineType;
    private LocalDateTime deliveryTime;
    private  String adminUserId;
    private BigDecimal rating;
    private boolean active;
    private String imagePath;

    public Resturant(int resturantId, String name, String address, String phoneNumber, String cuisineType,
                      LocalDateTime deliveryTime, String adminUserId, BigDecimal rating, boolean active, String imagePath) {
        this.resturantId = resturantId;
        this.name = name;
        this.address = address;
        setPhoneNumber(phoneNumber);
        this.cuisineType = cuisineType;
        this.deliveryTime = deliveryTime;
        this.adminUserId = adminUserId;
        setRating(rating);
        this.active = active;
        this.imagePath = imagePath;
    }

    public int getResturantId() {
        return resturantId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public LocalDateTime getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(LocalDateTime deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public String getAdminUserId() {
        return adminUserId;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        if (rating.compareTo(BigDecimal.ZERO) < 0 || rating.compareTo(BigDecimal.valueOf(5)) > 0) {
            throw new IllegalArgumentException("Rating must be between 0 and 5.");
        }
        this.rating = rating;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Resturant that = (Resturant) o;
        return resturantId == that.resturantId && Objects.equals(adminUserId, that.adminUserId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(resturantId, adminUserId);
    }

    @Override
    public String toString() {
        return "Resturant{" +
                "resturantId=" + resturantId +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", cuisineType='" + cuisineType + '\'' +
                ", deliveryTime=" + deliveryTime +
                ", adminUserId='" + adminUserId + '\'' +
                ", rating=" + rating +
                ", active=" + active +
                ", imagePath='" + imagePath + '\'' +
                '}';
    }
    
    public Resturant() {
        // Empty constructor for object creation without parameters
    }
    
    public void setResturantId(int resturantId) {
        this.resturantId = resturantId;
    }

	


	
}
