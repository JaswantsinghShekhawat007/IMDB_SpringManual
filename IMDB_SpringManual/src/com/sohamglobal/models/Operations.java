package com.sohamglobal.models;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public class Operations 
{
	
	private ArrayList<Films> film;
	
	public Operations()
	{
		film= new ArrayList<Films>();
	}
	
	public String LoginCheck(String userid,String pswd)
	{
		String status="";
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		try
		{
		DBConnector dbc = new DBConnector();
		con=dbc.getDbconnection();
		pst=con.prepareStatement("select * from userdata where userid=? and pswd=?;");
		pst.setString(1,userid);
		pst.setString(2, pswd);
		rs=pst.executeQuery();
		if(rs.next())
		{
			status="found";
		}
		else
		{
			status="notfound";
		}
		
		}
		catch(Exception e)
		{
		System.out.println(e);
		}
		
		return status;
	}
	
	public String updatePassword(String userid,String pswd)
	{
		String status="";
		Connection con;
		PreparedStatement pst;
		int i;
		try
		{
		DBConnector dbc = new DBConnector();
		con=dbc.getDbconnection();
		pst=con.prepareStatement("update userdata set pswd=? where userid=?;");
		pst.setString(2,userid);
		pst.setString(1, pswd);
		i=pst.executeUpdate();
		if(i>0)
		{
			status="updated";
			
		}
		else
		{
			status="wrong";
		}
		
		}
		catch(Exception e)
		{
		System.out.println(e);
		}
		
		return status;
	}
	
	
	public String forgetPasswordCheck(String userid,String secquestion,String secans)
	{
		String status="";
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		try
		{
		DBConnector dbc = new DBConnector();
		con=dbc.getDbconnection();
		pst=con.prepareStatement("select * from userdata where userid=? and secquestion=? and secans=?;");
		pst.setString(1,userid);
		pst.setString(2, secquestion);
		pst.setString(3,secans);
		rs=pst.executeQuery();
		if(rs.next())
		{
			char[] s= OtpGenerate.generateOTP();
			String otp=String.valueOf(s);
			sendemail eml= new sendemail("IMDB Movies","Verify Your Email","Your OTP Verification Code Is "+otp,rs.getString("email"));
			status=otp;
		}
		else
		{
			status="notfound";
		}
		
		}
		catch(Exception e)
		{
		System.out.println(e);
		}
		
		return status;
	}
	
	
	
	public ArrayList<Films> getFilms()
	{
		film.clear();
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		Films fm;
		try
		{
			DBConnector db = new DBConnector();
			con=db.getDbconnection();
			pst=con.prepareStatement("select * from films order by adddate desc;");
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				fm=new Films();
				fm.setFilmid(rs.getString("filmid"));
				fm.setFilmname(rs.getString("filmname"));
				fm.setLanguage(rs.getString("language"));
				fm.setCountry(rs.getString("country"));
				fm.setCategory(rs.getString("category"));
				fm.setRelyear(rs.getString("relyear"));
				fm.setCertificate(rs.getString("certificate"));
				fm.setDirector(rs.getString("director"));
				fm.setActor(rs.getString("actor"));
				fm.setActress(rs.getString("actress"));
				fm.setMusic(rs.getString("music"));
				fm.setPlatform(rs.getString("platform"));
				fm.setBudget(rs.getString("budget"));
				fm.setCollection(rs.getString("collection"));
				fm.setDescription(rs.getString("description"));
				fm.setYoutubetraillink(rs.getString("youtubetraillink"));
				film.add(fm);
			}

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
		
		return film;
	}
	
	
	public Films findFilm(String filmid)
	{
		film.clear();
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		Films fm=new Films();
		try
		{
			DBConnector db = new DBConnector();
			con=db.getDbconnection();
			pst=con.prepareStatement("select * from films where filmid=?;");
			pst.setString(1, filmid);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				fm.setFilmid(rs.getString("filmid"));
				fm.setFilmname(rs.getString("filmname"));
				fm.setLanguage(rs.getString("language"));
				fm.setCountry(rs.getString("country"));
				fm.setCategory(rs.getString("category"));
				fm.setRelyear(rs.getString("relyear"));
				fm.setCertificate(rs.getString("certificate"));
				fm.setDirector(rs.getString("director"));
				fm.setActor(rs.getString("actor"));
				fm.setActress(rs.getString("actress"));
				fm.setMusic(rs.getString("music"));
				fm.setPlatform(rs.getString("platform"));
				fm.setBudget(rs.getString("budget"));
				fm.setCollection(rs.getString("collection"));
				fm.setDescription(rs.getString("description"));
				fm.setYoutubetraillink(rs.getString("youtubetraillink"));
			}

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
		
		return fm;
	}
	
	
	public ArrayList<Films> findFilmByName(String filmname)
	{
		film.clear();
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		Films fm=new Films();
		try
		{
			DBConnector db = new DBConnector();
			con=db.getDbconnection();
			pst=con.prepareStatement("select * from films where filmname=?;");
			pst.setString(1, filmname);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				fm=new Films();
				fm.setFilmid(rs.getString("filmid"));
				fm.setFilmname(rs.getString("filmname"));
				fm.setLanguage(rs.getString("language"));
				fm.setCountry(rs.getString("country"));
				fm.setCategory(rs.getString("category"));
				fm.setRelyear(rs.getString("relyear"));
				fm.setCertificate(rs.getString("certificate"));
				fm.setDirector(rs.getString("director"));
				fm.setActor(rs.getString("actor"));
				fm.setActress(rs.getString("actress"));
				fm.setMusic(rs.getString("music"));
				fm.setPlatform(rs.getString("platform"));
				fm.setBudget(rs.getString("budget"));
				fm.setCollection(rs.getString("collection"));
				fm.setDescription(rs.getString("description"));
				fm.setYoutubetraillink(rs.getString("youtubetraillink"));
				film.add(fm);
			}

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
		
		return film;
	}
	
	
	public String ModifyFilm(String filmid,String platform,String collection)
	{
		String status="";
		Connection con;
		PreparedStatement pst;
		try
		{
		DBConnector dbc = new DBConnector();
		con=dbc.getDbconnection();
		pst=con.prepareStatement("update films set platform=?, collection=? where filmid=?;");
		pst.setString(1,platform);
		pst.setString(2, collection);
		pst.setString(3,filmid);
		int i =pst.executeUpdate();
		if(i>0)
		{
			status="modified";
		}
		else
		{
			status="not";
		}
		
		}
		catch(Exception e)
		{
		System.out.println(e);
		}
		
		return status;
	}
	
	public String deleteFilm(String filmid)
	{
		String status="";
		Connection con;
		PreparedStatement pst;
		try
		{
		DBConnector dbc = new DBConnector();
		con=dbc.getDbconnection();
		pst=con.prepareStatement("delete from likedislike where filmid=?;");
		pst.setString(1,filmid);
		pst.executeUpdate();
		pst=con.prepareStatement("delete from reviews where filmid=?;");
		pst.setString(1,filmid);
		pst.executeUpdate();
		pst=con.prepareStatement("delete from films where filmid=?;");
		pst.setString(1,filmid);
		int i=pst.executeUpdate();
		if(i>0)
		{
			status="deleted";
		}
		else
		{
			status="not";
		}
		
		}
		catch(Exception e)
		{
		System.out.println(e);
		}
		
		return status;
	}
	
	public ArrayList<Films> userFindFilm(Films f)
	{
		film.clear();
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		Films fm=new Films();
		int i=0;
		String query="select * from films where ";
		if(f.getFilmname().length() > 0 )
		{
			//query.concat("filmname="+f.getFilmname());
			query=query+"filmname='"+f.getFilmname()+"'";
			i=i+1;
		}
		if(!f.getCategory().equals("Category"))
		{
			if(i == 1)
			{
				//query.concat(" and category="+f.getCategory());
				query=query+" and category='"+f.getCategory()+"'";
				i++;
			}
			else if(i == 0)
			{
				//query.concat("category="+f.getCategory());
				query=query+"category='"+f.getCategory()+"'";
				i++;
			}
		}
		if(!f.getLanguage().equals("Language"))
		{
			if(i==1 || i==2)
			{
				//query.concat(" and language="+f.getLanguage());
				query=query+" and language='"+f.getLanguage()+"'";
				i++;
			}
			else if(i == 0)
			{
				//query.concat("language="+f.getLanguage());
				query=query+"language='"+f.getLanguage()+"'";
				i++;
			}
		}
		if(!f.getDirector().equals("Director"))
		{
			if(i==1 || i== 2 || i==3)
			{
				//query.concat(" and director="+f.getDirector());
				query=query+" and director='"+f.getDirector()+"'";
				i++;
			}
			else if(i == 0)
			{
				//query.concat("director="+f.getDirector());
				query=query+"director='"+f.getDirector()+"'";
				i++;
			}
		}
		if(!f.getActor().equals("Actor"))
		{
			if(i==1 || i== 2 || i==3 || i == 4)
			{
				//query.concat(" and actor="+f.getActor());
				query=query+" and actor='"+f.getActor()+"'";
				i++;
			}
			else if(i == 0)
			{
				//query.concat("actor="+f.getActor());
				query=query+"actor='"+f.getActor()+"'";
				i++;
			}
		}
		if(!f.getActress().equals("Actress"))
		{
			if(i==1 || i== 2 || i==3 || i == 4 || i== 5)
			{
				//query.concat(" and actress="+f.getActress());
				query=query+" and actress='"+f.getActress()+"'";
				i++;
			}
			else if(i == 0)
			{
				//query.concat("actress="+f.getActress());
				query=query+"actress='"+f.getActress()+"'";
				i++;
			}
		}
		query=query+";";
		
		try
		{
			DBConnector db = new DBConnector();
			con=db.getDbconnection();
			pst=con.prepareStatement(query);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				fm=new Films();
				fm.setFilmid(rs.getString("filmid"));
				fm.setFilmname(rs.getString("filmname"));
				fm.setLanguage(rs.getString("language"));
				fm.setCountry(rs.getString("country"));
				fm.setCategory(rs.getString("category"));
				fm.setRelyear(rs.getString("relyear"));
				fm.setCertificate(rs.getString("certificate"));
				fm.setDirector(rs.getString("director"));
				fm.setActor(rs.getString("actor"));
				fm.setActress(rs.getString("actress"));
				fm.setMusic(rs.getString("music"));
				fm.setPlatform(rs.getString("platform"));
				fm.setBudget(rs.getString("budget"));
				fm.setCollection(rs.getString("collection"));
				fm.setDescription(rs.getString("description"));
				fm.setYoutubetraillink(rs.getString("youtubetraillink"));
				film.add(fm);
			}

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
		
		return film;
	}
	
	public String setlikedislike(String filmid,String userid,String stat)
	{
		String status="";
		int conclusion;
		if(stat.equals("like"))
		{
			conclusion=1;
		}
		else
		{
			conclusion=0;
		}
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		try
		{
			DBConnector db = new DBConnector();
			con=db.getDbconnection();
			pst=con.prepareStatement("select * from likedislike where filmid=? and userid=?;");
			pst.setString(1, filmid);
			pst.setString(2,userid);
			rs=pst.executeQuery();
			if(rs.next())
			{
				pst=con.prepareStatement("update likedislike set conclusion=? where filmid=? and userid=?;");
				pst.setInt(1, conclusion);
				pst.setString(2, filmid);
				pst.setString(3,userid);
				pst.executeUpdate();
			}
			else
			{
				pst=con.prepareStatement("insert into likedislike values(?,?,?);");
				pst.setString(1, filmid);
				pst.setString(2,userid);
				pst.setInt(3, conclusion);
				pst.executeUpdate();
			}
			
			if(stat.equals("delete"))
			{
				pst=con.prepareStatement("delete from likedislike where filmid=? and userid=?;");
				pst.setString(1, filmid);
				pst.setString(2,userid);
				pst.executeUpdate();
			}
			
			status="success";
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
		return status;
	}
	
	public ArrayList<Reviews> getReviews(String filmid)
	{
		ArrayList<Reviews> list = new ArrayList<Reviews>();
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		Reviews rev;
		try
		{
			DBConnector db = new DBConnector();
			con=db.getDbconnection();
			pst=con.prepareStatement("select * from reviews where filmid=? order by reviewdate desc;");
			pst.setString(1, filmid);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				rev = new Reviews();
				rev.setReviewid(rs.getString("reviewid"));
				rev.setFilmid(rs.getString("filmid"));
				rev.setUserid(rs.getString("userid"));
				rev.setDetailreview(rs.getString("detailreview"));
				rev.setReviewdate(rs.getString("reviewdate"));
				list.add(rev);
			}

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
     	return list;
	}
	
	public String setReviews(String filmid,String userid,String detailreview)
	{
		String status="";
		Connection con;
		PreparedStatement pst;
		try
		{
		DBConnector dbc = new DBConnector();
		con=dbc.getDbconnection();
		pst=con.prepareStatement("insert into reviews values(?,?,?,?,Now());");
		pst.setString(1,ID_Generator.generateWalletID());
		pst.setString(2, filmid);
		pst.setString(3,userid);
		pst.setString(4, detailreview);
		int i=pst.executeUpdate();
		if(i>0)
		{
			status="inserted";
		}
		else
		{
			status="not";
		}
		
		}
		catch(Exception e)
		{
		System.out.println(e);
		}
		
		return status;
		
	}
	
	public String deleteReviews(String reviewid)
	{
		String status="";
		Connection con;
		PreparedStatement pst;
		try
		{
		DBConnector dbc = new DBConnector();
		con=dbc.getDbconnection();
		pst=con.prepareStatement("delete from reviews where reviewid=?;");
		pst.setString(1,reviewid);
		int i=pst.executeUpdate();
		if(i>0)
		{
			status="deleted";
		}
		else
		{
			status="not";
		}
		
		}
		catch(Exception e)
		{
		System.out.println(e);
		}
		
		return status;
		
	}
	
	public ArrayList<Films> userRecommendFilms(String category,String userid)
	{
		Operations op = new Operations();
		String certificate="all";
		String query;
		film.clear();
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		Films fm;
		try
		{
			DBConnector db = new DBConnector();
			con=db.getDbconnection();
			pst=con.prepareStatement("select * from userdata where userid=?;");
			pst.setString(1, userid);
			rs=pst.executeQuery();
			rs.next();
			int age=op.userFindAge(rs.getString("dob"));
			if(age>=18)
			{
				certificate="'18+','16+','13+'";
			}
			else if(age<18 && age>=16)
			{
				certificate="'16+','13+'";
			}
			else if(age<16 && age>=13)
			{
				certificate="'13+'";
			}
			if(certificate.equals("all"))
			{
				query="select * from films where category='"+category+"' and certificate='all' order by adddate desc;";
			}
			else
			{
				query="select * from films where category='"+category+"' and certificate in ('all',"+certificate+") order by adddate desc;";
			}
			pst=con.prepareStatement(query);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				fm=new Films();
				fm.setFilmid(rs.getString("filmid"));
				fm.setFilmname(rs.getString("filmname"));
				fm.setLanguage(rs.getString("language"));
				fm.setCountry(rs.getString("country"));
				fm.setCategory(rs.getString("category"));
				fm.setRelyear(rs.getString("relyear"));
				fm.setCertificate(rs.getString("certificate"));
				fm.setDirector(rs.getString("director"));
				fm.setActor(rs.getString("actor"));
				fm.setActress(rs.getString("actress"));
				fm.setMusic(rs.getString("music"));
				fm.setPlatform(rs.getString("platform"));
				fm.setBudget(rs.getString("budget"));
				fm.setCollection(rs.getString("collection"));
				fm.setDescription(rs.getString("description"));
				fm.setYoutubetraillink(rs.getString("youtubetraillink"));
				film.add(fm);
			}

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return film;
	}
	
	public int userFindAge(String dob)
	{
		int age=0;
		LocalDate d3 = LocalDate.parse(dob, DateTimeFormatter.ISO_LOCAL_DATE);
	    LocalDate d4 = LocalDate.now();
	        
	    Period period = Period.between(d3,d4);
	    age = Math.abs(period.getYears());
	
		return age;
	}
	
	
	public ArrayList<Films> searchFilm(String filmname)
	{
		film.clear();
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		Films fm=new Films();
		try
		{
			DBConnector db = new DBConnector();
			con=db.getDbconnection();
			pst=con.prepareStatement("select * from films where filmname=? or actress=? or actor=? or director=? or language=? or category=?;");
			pst.setString(1, filmname);
			pst.setString(2, filmname);
			pst.setString(3, filmname);
			pst.setString(4, filmname);
			pst.setString(5, filmname);
			pst.setString(6, filmname);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				fm=new Films();
				fm.setFilmid(rs.getString("filmid"));
				fm.setFilmname(rs.getString("filmname"));
				fm.setLanguage(rs.getString("language"));
				fm.setCountry(rs.getString("country"));
				fm.setCategory(rs.getString("category"));
				fm.setRelyear(rs.getString("relyear"));
				fm.setCertificate(rs.getString("certificate"));
				fm.setDirector(rs.getString("director"));
				fm.setActor(rs.getString("actor"));
				fm.setActress(rs.getString("actress"));
				fm.setMusic(rs.getString("music"));
				fm.setPlatform(rs.getString("platform"));
				fm.setBudget(rs.getString("budget"));
				fm.setCollection(rs.getString("collection"));
				fm.setDescription(rs.getString("description"));
				fm.setYoutubetraillink(rs.getString("youtubetraillink"));
				film.add(fm);
			}

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
		
		return film;
	}
	

}
