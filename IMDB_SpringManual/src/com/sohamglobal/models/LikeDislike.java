package com.sohamglobal.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDislike 
{
	private String filmid;
	private String userid;
	private int conclusion;
	private int sum;
	private int count;
	
	public LikeDislike()
	{
		filmid="";
		userid="";
		conclusion=0;
		sum=0;
		count=0;
	}

	public String getFilmid() {
		return filmid;
	}

	public void setFilmid(String filmid) {
		this.filmid = filmid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getConclusion() {
		return conclusion;
	}

	public void setConclusion(int conclusion) {
		this.conclusion = conclusion;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	public String getLikeDislike()
	{
		String status="";
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		try
		{
			DBConnector db = new DBConnector();
			con=db.getDbconnection();
			pst=con.prepareStatement("select count(*) as cou,sum(conclusion) as su from likedislike where filmid=?;");
			pst.setString(1, filmid);
			rs=pst.executeQuery();
			if(rs.next())
			{
				if(rs.getInt("cou") == 0)
				{
					count=0;
					sum=0;
				}
				else
				{
					count=rs.getInt("cou");
					sum=rs.getInt("su");
					pst=con.prepareStatement("select * from likedislike where filmid=? and userid=?;");
					pst.setString(1, filmid);
					pst.setString(2,userid);
					rs=pst.executeQuery();
					if(rs.next())
					{
						if(rs.getInt("conclusion") == 1)
						{
							status="like";
						}
						else
						{
							status="dislike";
						}
					}
					else
					{
						status="nothing";
					}
				}
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	
	
}
