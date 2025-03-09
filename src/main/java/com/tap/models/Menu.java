package com.tap.models;

public class Menu {

	private int menuId;
	private int resturantId;
	private String itemName;
	private String description;
	private double price;
	private String isAvailable;
	private double ratings;
	private String imagePath;
	
	public Menu() {
		// TODO Auto-generated constructor stub
	}

	public Menu(int menuId, int resturantId, String itemName, String description, double price, String isAvailable, double ratings, String imagePath) {
	    this.menuId = menuId;
	    this.resturantId = resturantId;
	    this.itemName = itemName;
	    this.description = description;
	    this.price = price;
	    this.isAvailable = isAvailable;
	    this.ratings = ratings;
	    this.imagePath = imagePath;
	}


	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getResturantId() {
		return resturantId;
	}

	public void setResturantId(int resturantId) {
		this.resturantId = resturantId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	
	public double getRatings() {
		return ratings;
	}

	public void setRatings(double ratings) {
		this.ratings = ratings;
	}

	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", resturantId=" + resturantId + ", itemName=" + itemName + ", description="
				+ description + ", price=" + price + ", isAvailable=" + isAvailable + ", ratings=" + ratings
				+ ", imagePath=" + imagePath + "]";
	}
	
	
}
