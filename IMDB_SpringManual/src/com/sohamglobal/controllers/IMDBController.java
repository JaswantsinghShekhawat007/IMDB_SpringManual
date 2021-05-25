package com.sohamglobal.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sohamglobal.models.Films;
import com.sohamglobal.models.ID_Generator;
import com.sohamglobal.models.LikeDislike;
import com.sohamglobal.models.Operations;
import com.sohamglobal.models.UserData;

@Controller
public class IMDBController {
	
	@Autowired
	private Operations op;
	
	private String landingurl;
	
	@RequestMapping("/")
	public ModelAndView index(HttpServletRequest request)
	{
		landingurl=request.getRequestURL().toString();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("/signup")
	public String signup()
	{
		return "SignUp";
	}
	
	@RequestMapping("/adduser")
	public ModelAndView addNewUser(@RequestParam("oriotp") String oriotp,@RequestParam("otp") String otp,@RequestParam("userid") String userid,@RequestParam("pswd") String pswd,@RequestParam("name") String name,@RequestParam("email") String email,@RequestParam("mobileno") String mobileno,@RequestParam("secquestion") String secquestion,@RequestParam("secans") String secans,@RequestParam("dob") String dob,@RequestParam("gender") String gender)
	{
		ModelAndView mv=new ModelAndView();
		String status="";
		if(oriotp.equals(otp))
		{
			UserData u = new UserData();
			u.setUserid(userid);
			u.setPswd(pswd);
			u.setName(name);
			u.setEmail(email);
			u.setMobileno(mobileno);
			u.setSecquestion(secquestion);
			u.setSecans(secans);
			u.setDob(dob);
			u.setGender(gender);
			status=u.registerUser();
		}
		else
		{
			status="wrongotp";
		}
		mv.addObject("status", status);
		mv.setViewName("SignUpStatus");
			
		return(mv);
	}
	
	@RequestMapping("/signin")
	public String signin()
	{
		return "SignIn";
	}
	
	@RequestMapping("/check")
	public ModelAndView checkUser(String userid,String pswd,HttpServletRequest request)
	{
		HttpSession session = request.getSession(true);
		ModelAndView mv=new ModelAndView();
		if((userid.equals("adminimdb")) && (pswd.equals("adminopinthechat")))
		{
			session.setAttribute("userid",userid);			
			mv = new ModelAndView ("redirect:/adminhome");
		}
		else
		{
			if(op.LoginCheck(userid, pswd).equals("found"))
			{
				session.setAttribute("userid",userid);	
				mv = new ModelAndView ("redirect:/userhome");
			}
			else
			{
				mv.addObject("status","notfound");
				mv.setViewName("Failure");
			}
		}
		
		return(mv);
	}
	
	@RequestMapping("/adminhome")
	public ModelAndView adminHome()
	{
		ArrayList<Films> films = new ArrayList<Films>();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("Admin");
		films=op.getFilms();
		mv.addObject("films",films);
		return mv;
	}
	
	@RequestMapping("/userchangepassword")
	public ModelAndView userChangePassword()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("UserChangePassword");
		return mv;
	}
	
	@RequestMapping("/userchangepasswordstatus")
	public ModelAndView userChangePasswordStatus(HttpServletRequest request,@RequestParam("currpswd") String currpswd,@RequestParam("newpswd") String newpswd)
	{
		ModelAndView mv=new ModelAndView();
		HttpSession session = request.getSession(true);
		String userid=String.valueOf(session.getAttribute("userid"));
		String status=op.LoginCheck(userid, currpswd);
		if(status.equals("found"))
		{
			status=op.updatePassword(userid, newpswd);
		}
		mv.addObject("status",status);
		mv.setViewName("UserChangePasswordStatus");
		return mv;
	}
	
	@RequestMapping("/forgetpassword")
	public ModelAndView forgetPassword()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ForgetPassword");
		return mv;
	}
	
	@RequestMapping("/forgetpasswordotp")
	public ModelAndView forgetPasswordOtp(UserData u)
	{
		ModelAndView mv=new ModelAndView();
		String status;
		status=op.forgetPasswordCheck(u.getUserid(), u.getSecquestion(),u.getSecans());

		mv.addObject("status",status);
		mv.addObject("userid",u.getUserid());
		mv.setViewName("ForgetPasswordOtp");
		return mv;
	}
	
	
	@RequestMapping("/forgetpasswordstatus")
	public ModelAndView forgetPasswordStatus(String userid,String otp,String oriotp,String newpswd)
	{
		ModelAndView mv=new ModelAndView();
		String status;
		if(oriotp.equals(otp))
		{
			status=op.updatePassword(userid, newpswd);
		}
		else
		{
			status="wrongotp";
		}
		mv.addObject("status",status);
		mv.setViewName("ForgetPasswordStatus");
		return mv;
	}
	

	@RequestMapping(value = "/adminmodify/{filmid}")
	public ModelAndView adminModify(@PathVariable("filmid")String filmid)
	{
		ModelAndView mv=new ModelAndView();
		Films film=op.findFilm(filmid);
		mv.addObject("film",film);
		mv.setViewName("AdminModifyFilm");
		return mv;
	}
	
	@RequestMapping(value = "/adminfindfilm")
	public ModelAndView adminFindFilm(String filmname)
	{
		ModelAndView mv=new ModelAndView();
		ArrayList<Films> films = new ArrayList<Films>();
		films=op.findFilmByName(filmname);
		mv.addObject("films",films);
		mv.setViewName("AdminShowFilm");
		return mv;
	}
	
	@RequestMapping(value = "/admindelete/{filmid}")
	public ModelAndView adminDelete(@PathVariable("filmid")String filmid) throws IOException
	{
		ModelAndView mv=new ModelAndView();
		String film=op.deleteFilm(filmid);
		File fileToDelete = new File("D:/Developer/Workspace_Java/java/IMDB_SpringManual/WebContent/WEB-INF/uploads/"+filmid+".jpg");
		boolean success = fileToDelete.delete();
		mv.addObject("film",film);
		mv.addObject("homeurl",landingurl+"adminhome");
		mv.setViewName("AdminDeleteFilmStatus");
		return mv;
	}
	
	@RequestMapping(value = "/userfilmdetails/userlikedislike/{filmid}/{stat}")
	public ModelAndView userLikeDislike(@PathVariable("filmid")String filmid,@PathVariable("stat")String stat,HttpServletRequest request)
	{
		HttpSession session = request.getSession(true);
		String userid=String.valueOf(session.getAttribute("userid"));
		String status=op.setlikedislike(filmid, userid, stat);
		
		ModelAndView mv=new ModelAndView();
		mv = new ModelAndView ("redirect:/userfilmdetails/"+filmid);
		return mv;
	}
	
	@RequestMapping(value = "/userfilmdetails/usersetreview/{filmid}")
	public ModelAndView userSetReview(@PathVariable("filmid")String filmid,@RequestParam("detailreview") String detailreview,HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		HttpSession session = request.getSession(true);
		String userid=String.valueOf(session.getAttribute("userid"));
		String stat=op.setReviews(filmid, userid, detailreview);
		if(stat.equals("inserted"))
		{
			mv = new ModelAndView ("redirect:/userfilmdetails/"+filmid);
		}
    	return mv;
	}
	
	@RequestMapping(value = "/userfilmdetails/userdeletereview/{reviewid}/{filmid}")
	public ModelAndView userDeleteReview(@PathVariable("reviewid")String reviewid,@PathVariable("filmid")String filmid)
	{
		ModelAndView mv=new ModelAndView();
		String stat=op.deleteReviews(reviewid);
		if(stat.equals("deleted"))
		{
			mv = new ModelAndView ("redirect:/userfilmdetails/"+filmid);
		}
		
		
		return mv;
	}
	
	
	@RequestMapping(value = "/userfindfilm")
	public ModelAndView userFindFilm(Films f)
	{
		ModelAndView mv=new ModelAndView();
		ArrayList<Films> films = new ArrayList<Films>();
		films=op.userFindFilm(f);
		mv.addObject("films",films);
		mv.setViewName("UserShowFilm");
		return mv;
	}
	
	@RequestMapping("/adminmodify/adminmodifystatus")
	public ModelAndView adminModifyStatus(Films fm)
	{
		ModelAndView mv=new ModelAndView();
		mv.addObject("homeurl",landingurl+"adminhome");
		mv.addObject("status", op.ModifyFilm(fm.getFilmid(),fm.getPlatform(), fm.getCollection()));
		mv.setViewName("AdminModifyFilmStatus");
		return mv;
	}

	@RequestMapping("/adminallfilms")
	public ModelAndView adminAllFilms()
	{
		ArrayList<Films> films = new ArrayList<Films>();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("AdminAllFilms");
		films=op.getFilms();
		mv.addObject("films",films);
		
		return mv;
	}
	
	@RequestMapping("/userallfilms")
	public ModelAndView userAllFilms()
	{
		ArrayList<Films> films = new ArrayList<Films>();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("UserAllFilms");
		films=op.getFilms();
		mv.addObject("films",films);
		
		return mv;
	}
	
	@RequestMapping("/userhome")
	public ModelAndView userHome()
	{
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("User");
		ArrayList<Films> films = new ArrayList<Films>();
		films=op.getFilms();
		mv.addObject("films",films);
		return mv;
	}
	
	
	@RequestMapping("/usersearch")
	public ModelAndView userSearch(String filmname)
	{
		
		ModelAndView mv=new ModelAndView();
		ArrayList<Films> films = new ArrayList<Films>();
		films=op.searchFilm(filmname);
		mv.addObject("films",films);
		mv.setViewName("UserShowFilm");
		return mv;
	}
	
	

	@RequestMapping("/usersearchfilmsform")
	public ModelAndView userSearchFilmsForm()
	{
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("UserSearchFilmsForm");
		ArrayList<Films> films = new ArrayList<Films>();
		films=op.getFilms();
		mv.addObject("films",films);
		return mv;
	}
	
	
	@RequestMapping("/userrecommendfilmform")
	public ModelAndView userRecommendFilm()
	{
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("UserRecommendFilms");
		ArrayList<Films> films = new ArrayList<Films>();
		films=op.getFilms();
		mv.addObject("films",films);
		return mv;
	}
	
	@RequestMapping(value = "/userrecommendfilmlist")
	public ModelAndView userRecommendFilmList(String category,HttpServletRequest request)
	{
		HttpSession session = request.getSession(true);
		String userid=String.valueOf(session.getAttribute("userid"));
		ModelAndView mv=new ModelAndView();
		ArrayList<Films> films = new ArrayList<Films>();
		films=op.userRecommendFilms(category, userid);
		mv.addObject("films",films);
		mv.setViewName("UserShowFilm");
		return mv;
	}
	
	
	
	
	@RequestMapping(value = "/userfilmdetails/{filmid}")
	public ModelAndView userFilmDetails(@PathVariable("filmid")String filmid,HttpServletRequest request)
	{
		HttpSession session = request.getSession(true);
		String userid=String.valueOf(session.getAttribute("userid"));
		ModelAndView mv=new ModelAndView();
		Films film=op.findFilm(filmid);
		mv.addObject("film",film);
		
		LikeDislike ld = new LikeDislike();
		ld.setFilmid(filmid);
		ld.setUserid(userid);
		mv.addObject("ld",ld);
		mv.addObject("reviews",op.getReviews(filmid));
		mv.addObject("homeurl",landingurl+"userhome");
		mv.setViewName("UserFilmDetails");
		return mv;
	}
	
	
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request)
	{
		HttpSession session = request.getSession(true);
		session.invalidate();
		return "Logout";
	}
	
	@RequestMapping("/addnewfilmform")
	public String addnewfilmform()
	{
		return "AdminAddNewFilm";
	}
	
	
	@RequestMapping("/addnewfilm")
	public ModelAndView addnewfilm(Films f,@RequestParam CommonsMultipartFile file, HttpSession session) throws Exception
	{
		ModelAndView mv=new ModelAndView();
		
		f.setFilmid(ID_Generator.generateWalletID());
		String status=f.addFilm();
		if(status.equals("success"))
		{
		
		String filename=f.getFilmid()+".jpg";  
	    String path = "D:/Developer/Workspace_Java/java/IMDB_SpringManual/WebContent/WEB-INF/uploads";   
	  
	  
	    byte[] bytes = file.getBytes();  
	    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
	         new File(path + File.separator + filename)));  
	    stream.write(bytes);  
	    stream.flush();  
	    stream.close();  
		}
		
		mv.addObject("status",status);
		mv.setViewName("AdminAddNewFilmStatus");
		return mv;
	}

}
