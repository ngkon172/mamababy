package com.mamababy.domain.user;

public class CartItem {
	private String itemId;
	private String filepath;
	private String prdName;
	private String reserve;
	private String count;
	private String sellPrice;
	
	
	
	public CartItem() {
	
	}
	public CartItem(String itemId, String filepath, String prdName,
			String reserve, String count,String sellPrice) {
		super();
		this.setItemId(itemId);
		this.filepath = filepath;
		this.prdName = prdName;
		this.reserve = reserve;
		this.count = count;
		this.sellPrice = sellPrice;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public String getReserve() {
		return reserve;
	}
	public void setReserve(String reserve) {
		this.reserve = reserve;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(String sellPrice) {
		this.sellPrice = sellPrice;
	}
	
	
	
	

}
