package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.Restaurant;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.service.HappyHouseMapService;
import com.ssafy.happyhouse.model.service.MemberService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/map")
public class HappyHouseMapController {
	
	private static final Logger logger = LoggerFactory.getLogger(HappyHouseMapController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private HappyHouseMapService happyHouseMapService;
	
	@ApiOperation(value = "시도 정보", notes = "전국의 시도를 반환한다.", response = List.class)
	@GetMapping("/sido")
	public ResponseEntity<List<SidoGugunCodeDto>> sido() throws Exception {
		
		return new ResponseEntity<List<SidoGugunCodeDto>>(happyHouseMapService.getSido(), HttpStatus.OK);
	}
	
	@ApiOperation(value = "구군 정보", notes = "전국의 구군을 반환한다.", response = List.class)
	@GetMapping("/gugun")
	public ResponseEntity<List<SidoGugunCodeDto>> gugun(@RequestParam("sido") String sido) throws Exception {
		
		return new ResponseEntity<List<SidoGugunCodeDto>>(happyHouseMapService.getGugunInSido(sido), HttpStatus.OK);
	}
	
	@ApiOperation(value = "시군동 정보", notes = "동코드를 이용하여 시,군,동 이름을 반환한다.", response = List.class)
	@GetMapping("/sigundong")
	public ResponseEntity<List<HouseInfoDto>> sigundongName(@RequestParam("sgd") String sigundong) throws Exception {
//		System.out.println(sigundong);
		
		return new ResponseEntity<List<HouseInfoDto>>(happyHouseMapService.sigundongName(sigundong), HttpStatus.OK);
	}

	@ApiOperation(value = "근처 맛집 리스트", notes = "시, 구를 이용하여 맛집 리스트 반환한다.", response = List.class)
	@GetMapping("/restaurant")
	public ResponseEntity<List<Restaurant>> restaurantList(@RequestParam("addr") String addr) throws Exception {
		System.out.println(addr);
		
		return new ResponseEntity<List<Restaurant>>(happyHouseMapService.restaurantList(addr), HttpStatus.OK);
	}

}
