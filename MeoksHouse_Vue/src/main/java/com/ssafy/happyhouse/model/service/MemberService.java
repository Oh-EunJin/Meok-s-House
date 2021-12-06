package com.ssafy.happyhouse.model.service;

import java.util.Map;

import com.ssafy.happyhouse.model.Member;

public interface MemberService {
	
	Member login(Member m) throws Exception;
	void regMember(String login_id, String password, String name, String address, String phone_number) throws Exception;
	Member getMember(String login_id) throws Exception;
	void updateMember(Member m) throws Exception;
	void deleteMember(String login_id) throws Exception;
	
	String searchPwd(String login_id, String name, String phone_number) throws Exception;
	int idCheck(String login_id) throws Exception;

}
