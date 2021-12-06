package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.Restaurant;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;

public interface HappyHouseMapService {
	
	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	List<HouseInfoDto> getAptInDong(String dong) throws Exception;

	List<HouseInfoDto> sigundongName(String sigundong) throws Exception;
	HouseInfoDto convenientSearch(String aptName) throws Exception;
	List<Restaurant> restaurantList(String addr) throws SQLException;
}
