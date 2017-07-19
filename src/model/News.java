package model;

import java.util.Date;

public class News {
	private int n_Id;
	private String n_Name;
	private String n_Content;
	private String n_Address;
	private String n_Attribute;
	private int n_Clicks;
	private Date create_Date;
	public Date getCreate_Date() {
		return create_Date;
	}
	public void setCreate_Date(Date create_Date) {
		this.create_Date = create_Date;
	}
	public int getN_Id() {
		return n_Id;
	}
	public void setN_Id(int n_Id) {
		this.n_Id = n_Id;
	}
	public String getN_Name() {
		return n_Name;
	}
	public void setN_Name(String n_Name) {
		this.n_Name = n_Name;
	}
	public String getN_Content() {
		return n_Content;
	}
	public void setN_Content(String n_Content) {
		this.n_Content = n_Content;
	}
	public String getN_Address() {
		return n_Address;
	}
	public void setN_Address(String n_Address) {
		this.n_Address = n_Address;
	}
	public String getN_Attribute() {
		return n_Attribute;
	}
	public void setN_Attribute(String n_Attribute) {
		this.n_Attribute = n_Attribute;
	}
	public int getN_Clicks() {
		return n_Clicks;
	}
	public void setN_Clicks(int n_Clicks) {
		this.n_Clicks = n_Clicks;
	}
}
