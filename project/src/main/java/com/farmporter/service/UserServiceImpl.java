package com.farmporter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmporter.mapper.UserMapper;
import com.farmporter.model.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper usermapper;
	
	// 회원 가입
	@Override
	public void userJoin(UserVO user) throws Exception {
		usermapper.userJoin(user);
	}

	// 아이디 중복 검사
	@Override
	public int idCheck(String userId) throws Exception {
		return usermapper.idCheck(userId);
	}

	// 로그인
	@Override
	public UserVO userLogin(UserVO user) throws Exception {
		return usermapper.userLogin(user);
	}

	// 가입자 정보 조회
	@Override
	public UserVO getUserInfo(String userId) throws Exception {
		UserVO user = usermapper.getUserInfo(userId);		
		return user;
	}	

	@Override
	public int editUserInfo(UserVO user) throws Exception{
		return usermapper.editUserInfo(user);
	}
		
	
}
