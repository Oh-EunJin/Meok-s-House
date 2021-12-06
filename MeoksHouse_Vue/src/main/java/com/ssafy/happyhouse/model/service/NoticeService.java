package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.util.PageNavigation;

public interface NoticeService {
	void registerArticle(NoticeDto noticeDto) throws Exception;
	List<NoticeDto> listArticle(Map<String, String> map) throws Exception;
	List<NoticeDto> listArticle() throws Exception;
	NoticeDto searchArticle(int articleNo) throws SQLException;
	PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
	NoticeDto getArticle(int articleNo) throws Exception;
	void updateArticle(NoticeDto noticeDto) throws Exception;
	void deleteArticle(int articleNo) throws Exception;
	
	void updateHits(NoticeDto noticeDto) throws Exception;
}
