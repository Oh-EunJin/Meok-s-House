package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.NoticeDto;

public interface NoticeMapper {
	
	void registerArticle(NoticeDto noticeDto) throws SQLException;
	List<NoticeDto> listArticle(Map<String, Object> map) throws SQLException;
	List<NoticeDto> listArticle() throws SQLException;
	NoticeDto searchArticle(int articleNo) throws SQLException;
	int getTotalCount(Map<String, String> map) throws SQLException;
	NoticeDto getArticle(int articleNo) throws SQLException;
	void updateArticle(NoticeDto noticeDto) throws SQLException;
	void deleteArticle(int articleNo) throws SQLException;
	
	void updateHits(NoticeDto noticeDto) throws SQLException;
}
