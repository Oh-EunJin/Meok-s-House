package com.ssafy.happyhouse.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "Notice : Notice 정보", description = "Notice 상세 정보를 나타낸다.")
public class NoticeDto {
	
	@ApiModelProperty(value = "글 번호")
	private int articleNo;
	@ApiModelProperty(value = "회원 아이디")
	private String login_id;
	@ApiModelProperty(value = "제목")
	private String subject;
	@ApiModelProperty(value = "내용")
	private String content;
	@ApiModelProperty(value = "작성일")
	private String regTime;
	@ApiModelProperty(value = "조회 수")
	private int hits;

	public NoticeDto() {
		super();
	}

	public NoticeDto(int articleNo, String login_id, String subject, String content, String regTime, int hits) {
		super();
		this.articleNo = articleNo;
		this.login_id = login_id;
		this.subject = subject;
		this.content = content;
		this.regTime = regTime;
		this.hits = hits;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegTime() {
		return regTime;
	}

	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}
	
}
