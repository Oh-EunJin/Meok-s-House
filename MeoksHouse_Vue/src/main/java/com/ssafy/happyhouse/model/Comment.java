package com.ssafy.happyhouse.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "Comment : Comment 정보", description = "Comment 상세 정보를 나타낸다.")
public class Comment {
	
	@ApiModelProperty(value = "댓글 번호")
	private String comment_no;
	@ApiModelProperty(value = "사용자 아이디")
	private String login_id;
	@ApiModelProperty(value = "댓글 내용")
	private String comment;
	@ApiModelProperty(value = "댓글 작성일")
	private String comment_time;
	@ApiModelProperty(value = "해당 글 번호")
	private String talk_no;
	
	
	public String getComment_no() {
		return comment_no;
	}
	public void setComment_no(String comment_no) {
		this.comment_no = comment_no;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getComment_time() {
		return comment_time;
	}
	public void setComment_time(String comment_time) {
		this.comment_time = comment_time;
	}
	public String getTalk_no() {
		return talk_no;
	}
	public void setTalk_no(String talk_no) {
		this.talk_no = talk_no;
	}
	
}
