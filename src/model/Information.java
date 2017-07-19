package model;

import java.util.Date;

public class Information {
	private int i_Id;
	private String i_Name;
	private String i_Content;
	private String i_Address;
	private String i_Attribute;
	private int i_Clicks;
	private String name;
	private Date create_Date;
	public Date getCreate_Date() {
		return create_Date;
	}
	public void setCreate_Date(Date create_Date) {
		this.create_Date = create_Date;
	}
	public int getI_Id() {
		return i_Id;
	}
	public void setI_Id(int i_Id) {
		this.i_Id = i_Id;
	}
	public String getI_Name() {
		return i_Name;
	}
	public void setI_Name(String i_Name) {
		this.i_Name = i_Name;
	}
	public String getI_Content() {
		return i_Content;
	}
	public void setI_Content(String i_Content) {
		this.i_Content = i_Content;
	}
	public String getI_Address() {
		return i_Address;
	}
	public void setI_Address(String i_Address) {
		this.i_Address = i_Address;
	}
	public String getI_Attribute() {
		return i_Attribute;
	}
	public void setI_Attribute(String i_Attribute) {
		this.i_Attribute = i_Attribute;
	}
	public int getI_Clicks() {
		return i_Clicks;
	}
	public void setI_Clicks(int clicks) {
		this.i_Clicks = clicks;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
