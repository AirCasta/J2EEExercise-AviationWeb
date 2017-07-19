package model;

public class User {
	private String u_Id;
	private String u_Name;
	private String u_Password;
	private String email;
	private int sex;
	public String getU_Id() {
		return u_Id;
	}
	public void setU_Id(String u_Id) {
		this.u_Id = u_Id;
	}
	public String getU_Name() {
		return u_Name;
	}
	public void setU_Name(String u_Name) {
		this.u_Name = u_Name;
	}
	public String getU_Password() {
		return u_Password;
	}
	public void setU_Password(String u_Password) {
		this.u_Password = u_Password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
}
