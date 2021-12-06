package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.Comment;

public interface CommentService {
	
	List<Comment> listComment(String talk_no);
	boolean createComment(Comment comment);
	boolean modifyComment(Comment comment);
	boolean deleteComment(int comment_no);

}
