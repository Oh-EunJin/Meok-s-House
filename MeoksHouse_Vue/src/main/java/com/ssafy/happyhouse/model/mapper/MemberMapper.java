package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.Map;

import com.ssafy.happyhouse.model.Member;

public interface MemberMapper {
	
	Member login(Member m) throws SQLException;
	void regMember(Member m) throws SQLException;
	Member getMember(String login_id) throws SQLException;
	void updateMember(Member m) throws SQLException;
	void deleteMember(String login_id) throws SQLException;
	
	String searchPwd(Map m) throws SQLException;
	int idCheck(String login_id) throws SQLException;

}
