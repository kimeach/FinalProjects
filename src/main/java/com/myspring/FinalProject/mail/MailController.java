package com.myspring.FinalProject.mail;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.FinalProject.member.General.vo.GenerVO;

@Controller("mailController")
public class MailController {
	@Autowired
	  private JavaMailSender mailSender;
	 

	  // mailSending 코드
	  @RequestMapping(value = "/mail/mailSending.do", method= {RequestMethod.GET,RequestMethod.POST})
	  public String mailSending(RedirectAttributes rAttr,@RequestParam("email")String em,@RequestParam("email2")String em3,GenerVO generVO,Model model,HttpServletRequest request) {
	 
		  
		  StringBuffer sb = new StringBuffer();
			Random rnd = new Random();
			
			
			for (int i = 0; i < 5; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:
			        // a-z
			        sb.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // A-Z
			        sb.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:
			        // 0-9
			        sb.append((rnd.nextInt(10)));
			        break;
			    }
			}  
		  
		  
	    String setfrom = "javavora@gmail.com";         
	    String tomail  =em+em3;     // 받는 사람 이메일
	    String title   = "인증번호입니다";      // 제목
	    String content = "인증번호를 확인하세요"+sb;    // 내용
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	     
	      mailSender.send(message);
	      
	    } catch(Exception e){
	      System.out.println(e);
	    }	    
	   System.out.println(tomail);
	   rAttr.addFlashAttribute("ema", em);
	   rAttr.addFlashAttribute("ema2", em3);
	    rAttr.addFlashAttribute("buffer", sb);
	    return "redirect:/mail/mailAuth.do";

	  } 
	  @RequestMapping(value = "/mail/mailAuth.do", method= {RequestMethod.GET,RequestMethod.POST})
	  public ModelAndView mailAuth(HttpServletResponse response,HttpServletRequest request) {	  
		  ModelAndView mav=new ModelAndView();
		  mav.setViewName("/mail/mailAuth");
		  return mav;
	  }
	  
	  
	  
	  
	  
	  
	  @RequestMapping(value = "/mail/mailSending2.do", method= {RequestMethod.GET,RequestMethod.POST})
	  public String mailSending2(RedirectAttributes rAttr,@RequestParam("emailall")String emailall,GenerVO generVO,Model model,HttpServletRequest request) {
	 
		  
		  StringBuffer sb = new StringBuffer();
			Random rnd = new Random();
			
			
			for (int i = 0; i < 5; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:
			        // a-z
			        sb.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // A-Z
			        sb.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:
			        // 0-9
			        sb.append((rnd.nextInt(10)));
			        break;
			    }
			}  
		  
		  
	    String setfrom = "javavora@gmail.com";         
	    String tomail  =emailall;     // 받는 사람 이메일
	    String title   = "인증번호입니다";      // 제목
	    String content = "인증번호를 확인하세요"+sb;    // 내용
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	     
	      mailSender.send(message);
	      
	    } catch(Exception e){
	      System.out.println(e);
	    }	    
	   System.out.println(tomail);
	    rAttr.addFlashAttribute("buffer", sb);
	    return "redirect:/mail/mailAuth2.do";

	  } 
	  @RequestMapping(value = "/mail/mailAuth2.do", method= {RequestMethod.GET,RequestMethod.POST})
	  public ModelAndView mailAuth2(HttpServletResponse response,HttpServletRequest request) {	  
		  ModelAndView mav=new ModelAndView();
		  mav.setViewName("/mail/mailAuth2");
		  return mav;
	  }
	  
	} 

