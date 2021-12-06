package com.ssafy.happyhouse.model.service;

import java.util.Map;

public interface JwtService {

	<T> String create(String key, T data, String subject);
	Map<String, Object> get(String key);
	String getLogin_id();
	boolean isUsable(String jwt);
	
}
