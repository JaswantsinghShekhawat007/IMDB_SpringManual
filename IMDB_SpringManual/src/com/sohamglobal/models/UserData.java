package com.sohamglobal.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;

public class UserData 
{
	private String userid;
	private String pswd;
	private String name;
	private String email;
	private String mobileno;
	private String secquestion;
	private String secans;
	private String dob;
	private String gender;
	
	public UserData()
	{
		userid="";
		pswd="";
		name="";
		email="";
		mobileno="";
		secquestion="";
		secans="";
		dob="";
		gender="";		
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPswd() {
		return pswd;
	}

	public void setPswd(String pswd) {
		this.pswd = pswd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getSecquestion() {
		return secquestion;
	}

	public void setSecquestion(String secquestion) {
		this.secquestion = secquestion;
	}

	public String getSecans() {
		return secans;
	}

	public void setSecans(String secans) {
		this.secans = secans;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String registerUser()
	{
		String regstatus="";
		Connection con;
		PreparedStatement pst;
		
		try
		{
			DBConnector db = new DBConnector();
			con=db.getDbconnection();
			pst=con.prepareStatement("insert into userdata values(?,?,?,?,?,?,?,Now(),?,?);");
			pst.setString(1,userid);
			pst.setString(2,pswd);
			pst.setString(3,name);
			pst.setString(4,email);
			pst.setString(5,mobileno);
			pst.setString(6,secquestion);
			pst.setString(7,secans);
			pst.setString(8,dob);
			pst.setString(9,gender);
			int i=pst.executeUpdate();
			con.close();
			if(i>0)
			{
				sendemail eml= new sendemail("IMDB Movies","Registration Status","You Are Registered Successfully",email);
				regstatus="success";
			}
			else
			{
				regstatus="failed";
			}
			
		}
		catch(Exception e)
		{
			regstatus="failed";
			System.out.println(e);
		}
		return(regstatus);
	}
	
	
	
	
	

}
