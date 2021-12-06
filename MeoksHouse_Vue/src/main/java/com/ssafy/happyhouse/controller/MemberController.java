package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.Member;
import com.ssafy.happyhouse.model.service.JwtServiceImpl;
import com.ssafy.happyhouse.model.service.MemberService;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private JwtServiceImpl jwtService;
	
	@Autowired
	private MemberService memberService;
	
	@ApiOperation(value = "새로운 회원을 등록한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PostMapping
	public ResponseEntity<String> regMember(@RequestBody Member member) throws Exception {
		logger.debug("regMember - 호출");
		
		boolean flag = false;		// 회원등록 성공 여부 판별
		String login_id = member.getLogin_id();
		String password = member.getPassword();
		String name = member.getName();
		String address = member.getAddress();
		String phone_number = member.getPhone_number();
		
		if(member != null) {
			flag = true;
			memberService.regMember(login_id, password, name, address, phone_number);
		}
		
		if(flag) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@ApiOperation(value = "아이디 중복 체크", notes = "입력한 아이디가 존재하는지 확인 후 존재하면 1, 존재하지 않으면 0을 반환한다.", response = Map.class)
	@GetMapping("/idcheck/{ckid}")
	public ResponseEntity<Integer> idCheck(@PathVariable("ckid") String ckid) throws Exception {
		int idCount = memberService.idCheck(ckid);
		
		return new ResponseEntity<Integer>(idCount, HttpStatus.OK);
	}
	
	@ApiOperation(value = "로그인", notes = "Access-token과 로그인 결과 메세지를 반환한다.", response = Map.class)
	@PostMapping("/login")
	public ResponseEntity<Map<String, Object>> login(@RequestBody Member member) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = null;
		
		try {
			Member loginUser = memberService.login(member);
			if (loginUser != null) {
				String token = jwtService.create("login_id", loginUser.getLogin_id(), "access-token");// key, data, subject
				logger.debug("로그인 토큰정보 : {}", token);
				resultMap.put("access-token", token);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
			} else {
				resultMap.put("message", FAIL);
				status = HttpStatus.ACCEPTED;
			}
		} catch (Exception e) {
			logger.error("로그인 실패 : {}", e);
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
	
	@ApiOperation(value = "회원 정보를 입력하고 해당 비밀번호를 가져온다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PostMapping("/passwordSearch")
	public ResponseEntity<String> searchPwd(@RequestBody Member member) throws Exception {
		logger.debug("searchPwd - 호출");
		String password = memberService.searchPwd(member.getLogin_id(), member.getName(), member.getPhone_number());
		
		return new ResponseEntity<String>(password, HttpStatus.OK);
	}
	
	@ApiOperation(value = "loginid에 해당하는 회원 정보를 반환한다.", response = String.class)
	@GetMapping("{login_id}")
	public ResponseEntity<Member> viewMember(@PathVariable("login_id") String login_id) throws Exception {
		logger.debug("viewMember - 호출");
		
		return new ResponseEntity<Member>(memberService.getMember(login_id), HttpStatus.OK);
	}
	
	@ApiOperation(value = "회원인증", notes = "회원 정보를 담은 Token을 반환한다.", response = Map.class)
	@GetMapping("/info/{login_id}")
	public ResponseEntity<Map<String, Object>> getInfo(
			@PathVariable("login_id") @ApiParam(value = "인증할 회원의 아이디.", required = true) String login_id,
			HttpServletRequest request) {
//		logger.debug("userid : {} ", userid);
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		if (jwtService.isUsable(request.getHeader("access-token"))) {
			logger.info("사용 가능한 토큰!!!");
			try {
//				로그인 사용자 정보.
				Member memberDto = memberService.getMember(login_id);
				resultMap.put("userInfo", memberDto);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
			} catch (Exception e) {
				logger.error("정보조회 실패 : {}", e);
				resultMap.put("message", e.getMessage());
				status = HttpStatus.INTERNAL_SERVER_ERROR;
			}
		} else {
			logger.error("사용 불가능 토큰!!!");
			resultMap.put("message", FAIL);
			status = HttpStatus.ACCEPTED;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
	
	@ApiOperation(value = "회원 정보를 수정한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PutMapping
	public ResponseEntity<String> updateMember(@RequestBody Member m) throws Exception {
		logger.debug("updateMember - 호출");
		logger.debug("" + m);
		
		boolean flag = false;	// 회원 정보 얻어온 것에 대한 성공 여부 판별
		Member member = new Member(m.getLogin_id(), m.getPassword(), m.getName(), m.getAddress(), m.getPhone_number());
		
		if(member != null) {
			flag = true;
			memberService.updateMember(member);
		}
		
		if(flag) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@ApiOperation(value = "login_id에 해당하는 회원 정보를 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@DeleteMapping("{login_id}")
	public ResponseEntity<String> deleteMember(@PathVariable("login_id") String login_id) throws Exception {
		logger.debug("deleteMember - 호출");
		
		memberService.deleteMember(login_id);
		return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
	}
	
}
