package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.Restaurant;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;

public interface HouseMapMapper {
	
	List<SidoGugunCodeDto> getSido() throws SQLException;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws SQLException;
	List<HouseInfoDto> getDongInGugun(String gugun) throws SQLException;
	List<HouseInfoDto> getAptInDong(String dong) throws SQLException;

	List<HouseInfoDto> sigundongName(String sigundong) throws SQLException;
	HouseInfoDto convenientSearch(String aptName) throws SQLException;
	List<Restaurant> restaurantList(String addr) throws SQLException;
}
