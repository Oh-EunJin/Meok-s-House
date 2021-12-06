package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.Comment;
import com.ssafy.happyhouse.model.mapper.CommentMapper;


@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Comment> listComment(String talk_no) {
		return sqlSession.getMapper(CommentMapper.class).listComment(talk_no);
	}

	@Override
	public boolean createComment(Comment comment) {
		return sqlSession.getMapper(CommentMapper.class).createComment(comment) == 1;
	}

	@Override
	public boolean modifyComment(Comment comment) {
		return sqlSession.getMapper(CommentMapper.class).modifyComment(comment) == 1;
	}

	@Override
	public boolean deleteComment(int comment_no) {
		return sqlSession.getMapper(CommentMapper.class).deleteComment(comment_no) == 1;
	}

}
