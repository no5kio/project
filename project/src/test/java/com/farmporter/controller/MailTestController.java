package com.farmporter.controller;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
 
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MailTestController { 
	@Autowired
	JavaMailSenderImpl mailSender;
	
	// MimeMessage 객체를 직접 생성하여 메일을 발송하는 방법
	@Test
	public void sendMailTest() throws Exception {

		String subject = "test 메일";
		String content = "메일 테스트 내용" + "<img src=\"https://t1.daumcdn.net/cfile/tistory/214DCD42594CC40625\">";
		String from = "kiohaha3@gmail.com";
		String to = "kiohaha3@gmail.com";
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            // 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
            // MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");

			mailHelper.setFrom(from);
			//mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);

			// FileSystemResource file = new FileSystemResource(new File("경로\업로드할파일.형식")); 
			// helper.addAttachment("업로드파일.형식", file);
            // 단순한 텍스트만 사용 시 다음의 코드를 사용. mailHelper.setText(content);
            
			mailSender.send(mail);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// MimeMessagePreparator를 사용해서 메일을 전송하는 방법
	@Test
	public void sendMailTest2() throws Exception {
		String subject = "test 메일";
		String content = "메일 테스트 내용";
		String from = "kiohaha3@gmail.com";
		String to = "kiohaha3@gmail.com";
		
		try {
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					
					mailHelper.setFrom(from);
					mailHelper.setTo(to);
					mailHelper.setSubject(subject);
					mailHelper.setText(content, true);
					
					FileSystemResource file = new FileSystemResource(new File("G:\test.txt"));
					mailHelper.addAttachment("test.txt", file);
				}
			};
			mailSender.send(preparator);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
