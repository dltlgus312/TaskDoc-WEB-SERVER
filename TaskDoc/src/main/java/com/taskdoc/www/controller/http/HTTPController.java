package com.taskdoc.www.controller.http;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HTTPController {

	@RequestMapping(value = "/")
	public String pagde() {
		return "home";
	}
	//header side footer 고정
	//body change
	
	/*
	 *1.메인 , 로그인 , 회원가입, 회원정보수정
	 *
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String TaskDocMain() {
		return "/active/home";
	}
	@RequestMapping(value = "/userLogin", method = RequestMethod.GET)
	public String userLogin() {
		return "userLogin";
	}
	@RequestMapping(value = "/userJoin", method = RequestMethod.GET)
	public String userJoin() {
		return "userJoin";
	}
	@RequestMapping(value = "/userInfoEdit", method = RequestMethod.GET)
	public String userInfoEdit() {
		return "userInfoEdit";
	}
	
	/*
	 * 2.프로젝트 메인 , 생성 , 프로젝트 멤버 초대, 프로젝트(이름, 멤버 삭제 등등,,) 수정 , 프로젝트 공지사항,
	 * 
	 */
	@RequestMapping(value = "/proMain", method = RequestMethod.GET)
	public String proMain() {
		return "proMain";
	}
	@RequestMapping(value = "/proCreate", method = RequestMethod.GET)
	public String proCreate() {
		return "proCreate";
	}
	@RequestMapping(value = "/proUserInvite", method = RequestMethod.GET)
	public String proUserInvite() {
		return "proUserInvite";
	}
	@RequestMapping(value = "/proInfoEdit", method = RequestMethod.GET)
	public String proInfoEdit() {
		return "proInfoEdit";
	}
	@RequestMapping(value = "/proNotice", method = RequestMethod.GET)
	public String proNotice() {
		return "proNotice";
	}
	
	/*
	 * 3.공용업무리스트메인, 공용업무 생성, 공용업무 수정 , 개인업무리스트, 개인업무리스트 생성, 개인업무리스트 수정 , 
	 * 
	 */
	
	@RequestMapping(value = "/chatMain", method = RequestMethod.GET)
	public String chatMain() {
		return "chatMain";
	}
	@RequestMapping(value = "/chatCreate", method = RequestMethod.GET)
	public String chatCreate() {
		return "chatCreate";
	}
	@RequestMapping(value = "/chatFileUpload", method = RequestMethod.GET)
	public String chatFileUpload() {
		return "chatFileUpload";
	}
	@RequestMapping(value = "/documentFeedback", method = RequestMethod.GET)
	public String documentFeedback() {
		return "documentFeedback";
	}
	@RequestMapping(value = "/chatDecision", method = RequestMethod.GET)
	public String chatDecision() {
		return "chatDecision";
	}
	@RequestMapping(value = "/chatFocus", method = RequestMethod.GET)
	public String chatFocus() {
		return "chatFocus";
	}
	
	/*
	 * 4.채팅방 메인, 채팅방 생성 , 파일업로드  , 의사결정, 회의록  ,피드백 
	 * 
	 */
	
	@RequestMapping(value = "/publicTaskMain", method = RequestMethod.GET)
	public String publicTaskMain() {
		return "publicTaskMain";
	}
	@RequestMapping(value = "/publicTaskCreate", method = RequestMethod.GET)
	public String publicTaskCreate() {
		return "publicTaskCreate";
	}
	@RequestMapping(value = "/publicTaskEdit", method = RequestMethod.GET)
	public String publicTaskEdit() {
		return "publicTaskEdit";
	}
	@RequestMapping(value = "/privateTaskMain", method = RequestMethod.GET)
	public String privateTaskMain() {
		return "privateTaskMain";
	}
	@RequestMapping(value = "/privateTaskCreate", method = RequestMethod.GET)
	public String privateTaskCreate() {
		return "privateTaskCreate";
	}
	@RequestMapping(value = "/privateTaskEdit", method = RequestMethod.GET)
	public String privateTaskEdit() {
		return "privateTaskEdit";
	}
	
	/*
	 * 5.방법론 게시판메인, 게시판 수정
	 * 
	 */
	
	@RequestMapping(value = "/methodBoard", method = RequestMethod.GET)
	public String methodBoard() {
		return "methodBoard";
	}
	@RequestMapping(value = "/methodBoardEdit", method = RequestMethod.GET)
	public String methodBoardEdit() {
		return "methodBoardEdit";
	}
	
	
	
	
}
