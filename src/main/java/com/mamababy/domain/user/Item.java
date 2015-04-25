package com.mamababy.domain.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="product")
public class Item{
	@Id
	@Column(name="id")
	private String id;
	@Column(name="category1")
	private String category1;
	@Column(name="category2")
	private String category2;
	@Column(name="prdname")
	private String prdname;
	@Column(name="sellprice")
	private String sellprice;
	@Column(name="reserve")
	private String reserve;
	@Column(name="stock")
	private String stock;
	@Column(name="strprice")
	private String strprice;
	@Column(name="del_type")
	private String del_type;
	@Column(name="filePath")
	private String filePath;
	@Column(name="opttitle1")
	private String opttitle1;
	@Column(name="optcode1")
	private String optcode1;
	@Column(name="opttitle2")
	private String opttitle2;
	@Column(name="optcode2")
	private String optcode2;
	@Column(name="opttitle3")
	private String opttitle3;	
	@Column(name="optcode3")
	private String optcode3;
	@Column(name="contents")
	private String contents;
	

	
	
	
	
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Item(String id, String category1, String category2, String prdname,
			String sellprice, String reserve, String stock, String strprice,
			String del_type, String filePath, String opttitle1,
			String optcode1, String opttitle2, String optcode2,
			String opttitle3, String optcode3,String contents) {
		super();
		this.id = id;
		this.category1 = category1;
		this.category2 = category2;
		this.prdname = prdname;
		this.sellprice = sellprice;
		this.reserve = reserve;
		this.stock = stock;
		this.strprice = strprice;
		this.del_type = del_type;
		this.filePath = filePath;
		this.opttitle1 = opttitle1;
		this.optcode1 = optcode1;
		this.opttitle2 = opttitle2;
		this.optcode2 = optcode2;
		this.opttitle3 = opttitle3;
		this.optcode3 = optcode3;
		this.contents = contents;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
	
	
}
