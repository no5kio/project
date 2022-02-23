package com.farmporter.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.core.io.FileSystemResource;
import java.io.File;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.farmporter.model.UserVO;
import com.farmporter.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired UserService userservice;
	
	@Autowired JavaMailSender mailSender;

	
	//회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void joinGET() {		
		logger.info("회원가입 페이지 진입");
	}
	
	//약관동의 페이지 이동
	@RequestMapping(value = "agreement", method = RequestMethod.GET)
	public void agreementGET() {		
		logger.info("약관동의 페이지 진입");				
	}
	
	// 로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGET() {		
		logger.info("로그인 페이지 진입");		
	}
	
	// My page 수정 이동
	@RequestMapping(value = "my_page_edit", method = RequestMethod.GET)
	public void editpageGET(HttpServletRequest request) {
		logger.info("정보 수정 페이지 진입");		
	}
	
	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(UserVO user) throws Exception{		
		logger.info("join 진입");	

		// 회원가입 서비스 실행
		userservice.userJoin(user);		
		logger.info("join Service 성공");
		
		return "redirect:/main";		
	}	

	// 아이디 중복 검사
	@RequestMapping(value = "/userIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String userIdChkPOST(String userId) throws Exception{
		
		logger.info("userIdChk() 진입");
		
		int result = userservice.idCheck(userId);
		
		logger.info("결과값 = " + result);		
		if(result != 0) {			
			return "fail";	// 중복 아이디가 존재			
		} else {			
			return "success";	// 중복 아이디 x			
		}
	} // userIdChkPOST() 종료	
	
	/* 이메일 인증 */
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		/* 뷰(view)로부터 넘어온 데이터 확인 */
		logger.info("이메일 데이터 전송 확인");
		logger.info("인증번호 :" + email);
		
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		logger.info("인증번호" + checkNum);
		
		/* 이메일 보내기 */
		String setFrom = "kiohaha3@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = 
				"홈페이지를 방문해 주셔서 감사합니다." +
				"<br><br>" +
				"인증 번호는" + checkNum + "입니다." +
				"<br>" +
				"해당 인증번호를 인증번호 확인란에 기입해 주세요.";	
		
        try {
        	MimeMessage message = mailSender.createMimeMessage();
        	MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
        	helper.setFrom(setFrom);
        	helper.setTo(toMail);
        	helper.setSubject(title);
        	helper.setText(content, true);
        	mailSender.send(message);
       } catch(Exception e) {
        	e.printStackTrace();
       }
       
        String num = Integer.toString(checkNum);
		
        return num;
	}
	
	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception {		
		HttpSession session = request.getSession();
		UserVO lvo = userservice.userLogin(user); 	// 제출한 아이디와 일치하는 아이디 유무 파악
		
		if(lvo == null) {							// 일치하는 아이디 존재 시
				int result = 0;
				rttr.addFlashAttribute("result", result);
				return "redirect:/user/login";			// 메인페이지 이동
			} else {
				session.setAttribute("user", lvo);
				return "redirect:/main";		// 로그인 페이지로 이동
			}

	}
	
    /* 메인페이지 로그아웃 */
    @RequestMapping(value="logout.do", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        logger.info("logoutMainGET method 진입");        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "redirect:/main";
    }
    
	/* My page 진입*/
	@RequestMapping(value= {"/my_page/{userId}"}, method=RequestMethod.GET)
	public String myPageGET(@PathVariable String userId, Model model, RedirectAttributes rttr) throws Exception {	
		UserVO user = userservice.getUserInfo(userId);
		model.addAttribute("user", user);
		
		return "/user/my_page";
	}
	
	// My page 수정
	@RequestMapping(value= {"/my_page_edit_submit"}, method= RequestMethod.POST)
	public String editPageGET(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception {
		logger.info("editUserInfo" + user);
		HttpSession session = request. getSession();
		UserVO userVO = (UserVO)session.getAttribute("user");
		int result = userservice.editUserInfo(user);
		
		rttr.addFlashAttribute("edit_result", result);
		
		return "redirect:/user/mypage/" + user.getUserId();
	}
}