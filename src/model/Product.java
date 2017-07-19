package model;

import java.util.Date;

public class Product {
	private int p_Id;
	private String p_Name;
	private String p_Content;
	private String p_Attribute;
	private String p_Address;
	private int p_Clicks;
	private Date create_Date;
	public Date getCreate_Date() {
		return create_Date;
	}
	public void setCreate_Date(Date create_Date) {
		this.create_Date = create_Date;
	}
	public int getP_Id() {
		return p_Id;
	}
	public void setP_Id(int p_Id) {
		this.p_Id = p_Id;
	}
	public String getP_Name() {
		return p_Name;
	}
	public void setP_Name(String p_Name) {
		this.p_Name = p_Name;
	}
	public String getP_Content() {
		return p_Content;
	}
	public void setP_Content(String p_Content) {
		this.p_Content = p_Content;
	}
	public String getP_Attribute() {
		return p_Attribute;
	}
	public void setP_Attribute(String p_Attribute) {
		this.p_Attribute = p_Attribute;
	}
	public String getP_Address() {
		return p_Address;
	}
	public void setP_Address(String p_Address) {
		this.p_Address = p_Address;
	}
	public int getP_Clicks() {
		return p_Clicks;
	}
	public void setP_Clicks(int i) {
		this.p_Clicks = i;
	}
}
