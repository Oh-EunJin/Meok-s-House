package com.ssafy.happyhouse.model.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.Member;
import com.ssafy.happyhouse.model.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public Member login(Member m) throws Exception {
		if(m.getLogin_id() == null || m.getPassword() == null) {
			return null;
		}
		return sqlSession.getMapper(MemberMapper.class).login(m);
	}

	@Override
	public void regMember(String login_id, String password, String name, String address, String phone_number)
			throws Exception {
		Member m = new Member(login_id, password, name, address, phone_number);
		sqlSession.getMapper(MemberMapper.class).regMember(m);
	}

	@Override
	public Member getMember(String login_id) throws Exception {
		return sqlSession.getMapper(MemberMapper.class).getMember(login_id);
	}

	@Override
	public void updateMember(Member m) throws Exception {
		sqlSession.getMapper(MemberMapper.class).updateMember(m);
	}

	@Override
	public void deleteMember(String login_id) throws Exception {
		sqlSession.getMapper(MemberMapper.class).deleteMember(login_id);
	}

	@Override
	public String searchPwd(String login_id, String name, String phone_number) throws Exception {
		Map<String, String> m = new HashMap<>();
		m.put("login_id", login_id);
		m.put("name", name);
		m.put("phone_number", phone_number);
		
		return sqlSession.getMapper(MemberMapper.class).searchPwd(m);
	}

	@Override
	public int idCheck(String login_id) throws Exception {
		return sqlSession.getMapper(MemberMapper.class).idCheck(login_id);
	}

}
