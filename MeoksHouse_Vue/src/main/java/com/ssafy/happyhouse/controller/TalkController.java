package com.ssafy.happyhouse.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.Talk;
import com.ssafy.happyhouse.model.service.TalkService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/talk")
public class TalkController {
	
	private static final Logger logger = LoggerFactory.getLogger(TalkController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	TalkService service;
	
	@ApiOperation(value = "모든 글의 정보를 반환한다.", response = List.class)
	@GetMapping
	public ResponseEntity<List<Talk>> listTalk() {
		logger.debug("listTalk - 호출");
		return new ResponseEntity<>(service.listTalk(), HttpStatus.OK);
	}
	
	@ApiOperation(value = "아파트명에 대한 글의 정보를 반환한다.", response = List.class)
	@GetMapping("apt/{apt}")
	public ResponseEntity<List<Talk>> listAptTalk(@PathVariable String apt) {
		logger.debug("listAptTalk - 호출");
		return new ResponseEntity<>(service.listAptTalk(apt), HttpStatus.OK);
	}

	@ApiOperation(value = "talk_no에 해당하는 글의 정보를 반환한다.", response = Talk.class)
	@GetMapping("/{talk_no}")
	public ResponseEntity<Talk> searchTalk(@PathVariable String talk_no) {
		logger.debug("searchTalk - 호출");
		return new ResponseEntity<>(service.searchTalk(talk_no), HttpStatus.OK);
	}

	@ApiOperation(value = "새로운 글 정보를 입력한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PostMapping
	public ResponseEntity<String> createTalk(@RequestBody Talk talk) {
		logger.debug("createTalk - 호출");
		if(service.createTalk(talk)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@ApiOperation(value = "talk_no에 해당하는 글의 정보를 수정한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PutMapping("{talk_no}")
	public ResponseEntity<String> modifyTalk(@RequestBody Talk talk) {
		logger.debug("modifyTalk - 호출");
		logger.debug("" + talk);
		if(service.modifyTalk(talk)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@ApiOperation(value = "talk_no에 해당하는 글의 정보를 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@DeleteMapping("{talk_no}")
	public ResponseEntity<String> deleteTalk(@PathVariable("talk_no") String talk_no) {
		logger.debug("deleteTalk - 호출");
		if(service.deleteTalk(talk_no)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

}
