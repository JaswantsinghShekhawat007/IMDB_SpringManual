package com.sohamglobal.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Films 
{
	
	private String filmid;
	private String filmname;
	private String language;
	private String country;
	private String category;
	private String relyear;
	private String certificate;
	private String director;
	private String actor;
	private String actress;
	private String music;
	private String platform;
	private String budget;
	private String collection;
	private String description;
	private String youtubetraillink;
	
	public Films()
	{
		filmid="";
		filmname="";
		language="";
		country="";
		category="";
		relyear="";
		certificate="";
		director="";
		actor="";
		actress="";
		music="";
		platform="";
		budget="";
		collection="";
		description="";
		youtubetraillink="";		
	}

	public String getFilmid() {
		return filmid;
	}

	public void setFilmid(String filmid) {
		this.filmid = filmid;
	}

	public String getFilmname() {
		return filmname;
	}

	public void setFilmname(String filmname) {
		this.filmname = filmname;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getRelyear() {
		return relyear;
	}

	public void setRelyear(String relyear) {
		this.relyear = relyear;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getActress() {
		return actress;
	}

	public void setActress(String actress) {
		this.actress = actress;
	}

	public String getMusic() {
		return music;
	}

	public void setMusic(String music) {
		this.music = music;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public String getBudget() {
		return budget;
	}

	public void setBudget(String budget) {
		this.budget = budget;
	}

	public String getCollection() {
		return collection;
	}

	public void setCollection(String collection) {
		this.collection = collection;
	}
	
	
	

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getYoutubetraillink() {
		return youtubetraillink;
	}

	public void setYoutubetraillink(String youtubetraillink) {
		this.youtubetraillink = youtubetraillink;
	}
	
	public String addFilm()
	{
		String regstatus="";
		Connection con;
		PreparedStatement pst;
		
		try
		{
			DBConnector db = new DBConnector();
			con=db.getDbconnection();
			pst=con.prepareStatement("insert into films values(?,?,?,?,?,?,Now(),?,?,?,?,?,?,?,?,?,?);");
			pst.setString(1,filmid);
			pst.setString(2,filmname);
			pst.setString(3,language);
			pst.setString(4,country);
			pst.setString(5,category);
			pst.setString(6,relyear);
			pst.setString(7,certificate);
			pst.setString(8,director);
			pst.setString(9,actor);
			pst.setString(10,actress);
			pst.setString(11,music);
			pst.setString(12,platform);
			pst.setString(13,budget);
			pst.setString(14,collection);
			pst.setString(15, description);
			pst.setString(16,youtubetraillink);
							
			
			
			int i=pst.executeUpdate();
			if(i>0)
			{
				regstatus="success";
			}
			else
			{
				regstatus="failed";
			}
			con.close();
			
			
		}
		catch(Exception e)
		{
			regstatus="failed";
			System.out.println(e);
		}
		return(regstatus);
	}

}
