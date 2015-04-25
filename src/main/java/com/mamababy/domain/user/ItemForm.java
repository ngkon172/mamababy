package com.mamababy.domain.user;


import org.springframework.web.multipart.MultipartFile;

public class ItemForm {
	
	private String category1;
	private String category2;
	private String prdname;
	private String sellprice;
	private String reserve;
	private String stock;
	private String strprice;
	private String del_type;
	private MultipartFile realimg;
	private String opttitle1;
	private String opttitle2;
	private String opttitle3;
	private String optcode1;
	private String optcode2;
	private String optcode3;
	private String content;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getOptcode1() {
		return optcode1;
	}
	public void setOptcode1(String optcode1) {
		this.optcode1 = optcode1;
	}
	public String getOptcode2() {
		return optcode2;
	}
	public void setOptcode2(String optcode2) {
		this.optcode2 = optcode2;
	}
	public String getOptcode3() {
		return optcode3;
	}
	public void setOptcode3(String optcode3) {
		this.optcode3 = optcode3;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getPrdname() {
		return prdname;
	}
	public void setPrdname(String prdname) {
		this.prdname = prdname;
	}
	public String getSellprice() {
		return sellprice;
	}
	public void setSellprice(String sellprice) {
		this.sellprice = sellprice;
	}
	public String getReserve() {
		return reserve;
	}
	public void setReserve(String reserve) {
		this.reserve = reserve;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getStrprice() {
		return strprice;
	}
	public void setStrprice(String strprice) {
		this.strprice = strprice;
	}
	public String getDel_type() {
		return del_type;
	}
	public void setDel_type(String del_type) {
		this.del_type = del_type;
	}
	public MultipartFile getRealimg() {
		return realimg;
	}
	public void setRealimg(MultipartFile realimg) {
		this.realimg = realimg;
	}
	public String getOpttitle1() {
		return opttitle1;
	}
	public void setOpttitle1(String opttitle1) {
		this.opttitle1 = opttitle1;
	}
	public String getOpttitle2() {
		return opttitle2;
	}
	public void setOpttitle2(String opttitle2) {
		this.opttitle2 = opttitle2;
	}
	public String getOpttitle3() {
		return opttitle3;
	}
	public void setOpttitle3(String opttitle3) {
		this.opttitle3 = opttitle3;
	}
	
}
