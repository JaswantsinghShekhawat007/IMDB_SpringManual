package com.sohamglobal.models;

import com.email.durgesh.Email;

public class sendemail 
{
	public sendemail(String Topic,String subject,String content,String recpient)
	{
		try
		{
		Email email = new Email("imdbmovies@gmail.com","sohamglobal");
		email.setFrom("imdbmovies@gmail.com", Topic);
		email.setSubject(subject);
		email.setContent(content, "text/html");
		email.addRecipient(recpient);
		email.send();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
