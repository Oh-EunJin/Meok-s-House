package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.Talk;


@Mapper
public interface TalkMapper {
	
	List<Talk> listTalk();
	List<Talk> listAptTalk(String apt);
	Talk searchTalk(String talk_no);
	int createTalk(Talk talk);
	int modifyTalk(Talk talk);
	void deleteComment(String talk_no);
	int deleteTalk(String talk_no);

}
