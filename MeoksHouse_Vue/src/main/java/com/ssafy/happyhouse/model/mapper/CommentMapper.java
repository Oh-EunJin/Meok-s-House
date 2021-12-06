package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.Comment;

@Mapper
public interface CommentMapper {
	
	List<Comment> listComment(String talk_no);
	int createComment(Comment comment);
	int modifyComment(Comment comment);
	int deleteComment(int comment_no);

}
