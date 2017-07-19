package model;

import java.util.Date;

//import java.util.Date;

public class Photo {
	private int ph_Id;
	private String ph_Name;
	private String ph_Address;
	private String ph_Attribute;
	private String atlas_Name;
	private Date time_p;
	public Date getTime_p() {
		return time_p;
	}
	public void setTime_p(Date time_p) {
		this.time_p = time_p;
	}
	public int getPh_Id() {
		return ph_Id;
	}
	public void setPh_Id(int ph_Id) {
		this.ph_Id = ph_Id;
	}
	public String getPh_Name() {
		return ph_Name;
	}
	public void setPh_Name(String ph_Name) {
		this.ph_Name = ph_Name;
	}
	public String getPh_Address() {
		return ph_Address;
	}
	public void setPh_Address(String ph_Address) {
		this.ph_Address = ph_Address;
	}
	public String getPh_Attribute() {
		return ph_Attribute;
	}
	public void setPh_Attribute(String ph_Attribute) {
		this.ph_Attribute = ph_Attribute;
	}
	public String getAtlas_Name() {
		return atlas_Name;
	}
	public void setAtlas_Name(String atlas_Name) {
		this.atlas_Name = atlas_Name;
	}
}
