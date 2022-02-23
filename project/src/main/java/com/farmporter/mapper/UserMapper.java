package com.farmporter.mapper;

import com.farmporter.model.UserVO;

public interface UserMapper {
	
	// 회원가입
	public void userJoin(UserVO user);

	// 아이디 중복 확인
	public int idCheck(String userId);
	
	// 로그인
	public UserVO userLogin(UserVO user);
	
	// 가입자 정보 조회
	public UserVO getUserInfo(String userId);
	
	// 상품 수정
	public int editUserInfo(UserVO user);
}
