package com.team3.busking.controller;

import com.team3.busking.domain.Member;

import com.team3.busking.service.*;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.beans.PropertyEditorSupport;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(LocalDate.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				if (text == null || text.isEmpty()) {
					setValue(null);
				} else {
					setValue(LocalDate.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
				}
			}
		});
	}

	// ================= 로그인 =================
	@GetMapping("/login")
	public String loginForm() {
		return "member/login";
	}

	@PostMapping("/login")
	public String login(@RequestParam String memberId, @RequestParam String pw, HttpSession session) {

		Member member = memberService.login(memberId, pw);

		if (member == null) {
			return "member/login";
		}

		session.setAttribute("loginUser", member);
		return "redirect:/";
	}

	// ================= 로그아웃 =================
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// ================= 회원가입 =================
	@GetMapping("/register")
	public String registerForm() {
		return "member/join";
	}

	@PostMapping("/register")
	public String register(Member member) {
		try {
			memberService.register(member);
		} catch (Exception e) {
			return "member/join"; // 또는 에러 메시지
		}
		return "redirect:/member/joinSuccess";

	}

	@GetMapping("/joinSuccess")
	public String joinSuccess() {
		return "member/joinfinal";
	}

	// ================= 아이디 찾기 =================
	@PostMapping("/find-id")
	public String findId(@RequestParam String name, @RequestParam String phone, @RequestParam String email,
			Model model) {

		String memberId = memberService.findMemberId(name, phone, email);
		model.addAttribute("memberId", memberId);

		return "member/findIdResult";
	}

	// ================= 비밀번호 찾기 =================
	@PostMapping("/find-pw")
	public String findPw(@RequestParam String name, @RequestParam String memberId, @RequestParam String phone,
			@RequestParam String email, Model model) {

		boolean result = memberService.checkMemberForPw(name, memberId, phone, email);

		model.addAttribute("result", result);
		model.addAttribute("memberId", memberId);

		return "member/findPwResult";
	}
}
