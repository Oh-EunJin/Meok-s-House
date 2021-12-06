package com.ssafy.happyhouse.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "Talk : Talk 정보", description = "Talk 상세 정보를 나타낸다.")
public class Talk {
	
	@ApiModelProperty(value = "Talk 번호")
	private String talk_no;
	@ApiModelProperty(value = "사용자 아이디")
	private String login_id;
	@ApiModelProperty(value = "글 제목")
	private String title;
	@ApiModelProperty(value = "글 내용")
	private String content;
	@ApiModelProperty(value = "글 작성일")
	private String talk_time;
	@ApiModelProperty(value = "아파트 이름")
	private String apt;
	
	public String getTalk_no() {
		return talk_no;
	}
	public void setTalk_no(String talk_no) {
		this.talk_no = talk_no;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTalk_time() {
		return talk_time;
	}
	public void setTalk_time(String talk_time) {
		this.talk_time = talk_time;
	}
	public String getApt() {
		return apt;
	}
	public void setApt(String apt) {
		this.apt = apt;
	}
	
	
}
