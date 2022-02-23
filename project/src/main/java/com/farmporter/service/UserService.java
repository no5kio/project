package com.farmporter.service;

import com.farmporter.model.UserVO;

public interface UserService {
	// 회원가입
	public void userJoin(UserVO user) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String userId) throws Exception;
	
	// 로그인 
	public UserVO userLogin(UserVO user) throws Exception;
	
	// 가입자 정보 조회
	public UserVO getUserInfo(String userId) throws Exception;

	// 작가 정보 수정
	public int editUserInfo(UserVO user) throws Exception;
}

