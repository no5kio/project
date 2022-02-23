package com.farmporter.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


import com.farmporter.model.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTests {
	@Autowired
	private UserMapper usermapper;			//MemberMapper.java 인터페이스 의존성 주입
	
//	//회원가입 쿼리 테스트 메서드
//	@Test
//	public void userJoin() throws Exception{
//		UserVO user = new UserVO();
//		
//		user.setUserId("spring-test1");
//		user.setUserPw("spring-test1");
//		user.setUserName("spring-test1");
//		user.setUserMail("spring-test1");
//		user.setUserAddr1("spring-test1");
//		user.setUserAddr2("spring-test1");
//		user.setUserAddr3("spring-test1");
//		user.setUserPhoneNo("spring-test1");
//		user.setBirthday("1992-06-07");
//
//		usermapper.userJoin(user);			//쿼리 메서드 실행
//	}
	
	// 아이디 중복검사
//	@Test
//	public void userIdChk() throws Exception{
//		String id = "spring-test";	// 존재하는 아이디
//		String id2 = "admin23";	// 존재하지 않는 아이디
//		usermapper.idCheck(id);
//		usermapper.idCheck(id2);
//	}
//	
    /* 로그인 쿼리 mapper 메서드 테스트 */
    @Test
    public void userLogin() throws Exception{
        
        UserVO user = new UserVO();    // MemberVO 변수 선언 및 초기화
        
        /* 올바른 아이디 비번 입력경우 */
//        user.setUserId("test");
//        user.setUserPw("test");
        
        /* 올바른 않은 아이디 비번 입력경우 */
        user.setUserId("admin");
        user.setUserPw("admin");
        
        usermapper.userLogin(user);
        System.out.println("결과 값 : " + usermapper.userLogin(user));
        
    }
	/*상품 정보 수정*/
//	@Test
//	public void editUserInfoTest() {
//		UserVO user = new UserVO();		
//		
//		user.setUserId("test1");
//		user.setUserPw("test");
//		user.setUserPhoneNo("010-8765-4321");
//		user.setUserAddr1("111111");
//		user.setUserAddr2("인천 미추홀구 용현동");
//		user.setUserAddr3("test2");
//		
//		usermapper.editUserInfo(user);
//	}

}
