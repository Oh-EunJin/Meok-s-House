package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.Talk;

public interface TalkService {
	
	List<Talk> listTalk();
	List<Talk> listAptTalk(String apt);
	Talk searchTalk(String talk_no);
	boolean createTalk(Talk talk);
	boolean modifyTalk(Talk talk);
//	boolean deleteComment(String talk_no);
	boolean deleteTalk(String talk_no);

}
