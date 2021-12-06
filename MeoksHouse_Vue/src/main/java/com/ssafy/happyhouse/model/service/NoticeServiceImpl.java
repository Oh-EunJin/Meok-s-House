package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.model.mapper.NoticeMapper;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	@Transactional
	public void registerArticle(NoticeDto noticeDto) throws Exception {
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		noticeMapper.registerArticle(noticeDto);
	}

	@Override
	public List<NoticeDto> listArticle(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		String key = map.get("key");
		if("login_id".equals(key))
			key = "login_id";
		param.put("key", key == null ? "" : key);
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		int currentPage = Integer.parseInt(map.get("pg") == null ? "1" : map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		return sqlSession.getMapper(NoticeMapper.class).listArticle(param);
	}
	
	@Override
	public List<NoticeDto> listArticle() throws Exception {
		return sqlSession.getMapper(NoticeMapper.class).listArticle();
	}
	
	@Override
	public NoticeDto searchArticle(int articleNo) throws SQLException {
		return sqlSession.getMapper(NoticeMapper.class).searchArticle(articleNo);
	}
	

	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
		PageNavigation pageNavigation = new PageNavigation();
		
		int naviSize = 10;
//		System.out.println(map.get("pg"));
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = sqlSession.getMapper(NoticeMapper.class).getTotalCount(map);
		//System.out.println(sqlSession.getMapper(NoticeMapper.class).getTotalCount(map));
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		
		return pageNavigation;
	}
	
	@Override
	public NoticeDto getArticle(int articleNo) throws Exception {
		return sqlSession.getMapper(NoticeMapper.class).getArticle(articleNo);
	}

	@Override
	public void updateArticle(NoticeDto noticeDto) throws Exception {
		sqlSession.getMapper(NoticeMapper.class).updateArticle(noticeDto);
	}

	@Override
	public void deleteArticle(int articleNo) throws Exception {
		NoticeMapper guestBookMapper = sqlSession.getMapper(NoticeMapper.class);
		guestBookMapper.deleteArticle(articleNo);
	}

	@Override
	public void updateHits(NoticeDto noticeDto) throws Exception {
		sqlSession.getMapper(NoticeMapper.class).updateHits(noticeDto);
	}

}
