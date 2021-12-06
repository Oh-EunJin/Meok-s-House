package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.Talk;
import com.ssafy.happyhouse.model.mapper.TalkMapper;

@Service
public class TalkServiceImpl implements TalkService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Talk> listTalk() {
		return sqlSession.getMapper(TalkMapper.class).listTalk();
	}
	
	@Override
	public List<Talk> listAptTalk(String apt) {
		return sqlSession.getMapper(TalkMapper.class).listAptTalk(apt);
	}

	@Override
	public Talk searchTalk(String talk_no) {
		return sqlSession.getMapper(TalkMapper.class).searchTalk(talk_no);
	}

	@Override
	public boolean createTalk(Talk talk) {
		return sqlSession.getMapper(TalkMapper.class).createTalk(talk) == 1;
	}

	@Override
	public boolean modifyTalk(Talk talk) {
		return sqlSession.getMapper(TalkMapper.class).modifyTalk(talk) == 1;
	}

	@Override
	@Transactional
	public boolean deleteTalk(String talk_no) {
		sqlSession.getMapper(TalkMapper.class).deleteComment(talk_no);
		return sqlSession.getMapper(TalkMapper.class).deleteTalk(talk_no) == 1;
	}

	
}
