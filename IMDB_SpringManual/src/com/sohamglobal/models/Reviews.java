package com.sohamglobal.models;

public class Reviews 
{
	private String reviewid;
	private String filmid;
	private String userid;
	private String detailreview;
	private String reviewdate;
	
	public Reviews()
	{
		reviewid="";
		filmid="";
		userid="";
		detailreview="";
		reviewdate="";
	}

	public String getReviewid() {
		return reviewid;
	}

	public void setReviewid(String reviewid) {
		this.reviewid = reviewid;
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

	public String getDetailreview() {
		return detailreview;
	}

	public void setDetailreview(String detailreview) {
		this.detailreview = detailreview;
	}

	public String getReviewdate() {
		return reviewdate;
	}

	public void setReviewdate(String reviewdate) {
		this.reviewdate = reviewdate;
	}
	
	

}
