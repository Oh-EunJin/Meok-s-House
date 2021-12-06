package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.happyhouse.model.Member;
import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.model.service.NoticeService;
import com.ssafy.happyhouse.util.PageNavigation;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/notice")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private NoticeService noticeService;
	
	@ApiOperation(value = "새로운 공지사항을 입력한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PostMapping
	public ResponseEntity<String> register(@RequestBody NoticeDto noticeDto)
			throws Exception {
		logger.debug("register - 호출");
		
		boolean flag = false;	// 공지사항 입력 성공 여부 판별
		if(noticeDto != null) {
			flag = true;
			noticeService.registerArticle(noticeDto);
		}
		
		if(flag) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@ApiOperation(value = "공지사항 글목록", notes = "모든 공지사항의 정보를 반환한다.", response = List.class)
	@GetMapping
	public ResponseEntity<List<NoticeDto>> list() throws Exception {
		logger.debug("list - 호출");
		
		return new ResponseEntity<List<NoticeDto>>(noticeService.listArticle(), HttpStatus.OK);
	}

	@ApiOperation(value = "공지사항 글수정", notes = "새로운 공지사항 정보를 입력한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PutMapping("{articleNo}")
	public ResponseEntity<String> modify(@RequestBody NoticeDto noticeDto) throws Exception {
		logger.debug("modify - 호출");
		
		boolean flag = false;	// 공지사항 글 수정 성공 여부 판별
		
		if(noticeDto != null) {
			flag = true;
			noticeService.updateArticle(noticeDto);
			System.out.println(noticeDto.getSubject());
		}
		
		if(flag) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.OK);
	}

	@ApiOperation(value = "공지사항 글삭제", notes = "글번호에 해당하는 공지사항 정보를 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@DeleteMapping("/{articleno}")
	public ResponseEntity<String> delete(@PathVariable("articleno") int articleNo)
			throws Exception {
		logger.debug("delete - 호출");
		
		noticeService.deleteArticle(articleNo);
		return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
	}
	
	@ApiOperation(value = "글번호에 해당하는 조회 수를 증가시키면서 세부 정보를 보여준다.", response = String.class)
	@GetMapping("/{articleno}")
	public ResponseEntity<NoticeDto> updateHits(@PathVariable("articleno") int articleNo) throws Exception {
		logger.debug("updateHits - 호출");
		
		boolean flag = false;	// 공지사항 조회 수 반환 성공 여부 판별
		NoticeDto noticeDto = noticeService.getArticle(articleNo);
		
		if(noticeDto != null) {
			flag = true;
			noticeService.updateHits(noticeDto);
		}
		
		if(flag) {
			return new ResponseEntity<NoticeDto>(noticeService.searchArticle(articleNo), HttpStatus.OK);
		}
		return new ResponseEntity<NoticeDto>(noticeService.searchArticle(articleNo), HttpStatus.OK);
	}
	
}
