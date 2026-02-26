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
import java.util.Optional;

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
	   public String login(@RequestParam String memberId,
	                       @RequestParam String pw,
	                       HttpSession session,
	                       Model model) {

	       try {
	           Member member = memberService.login(memberId, pw);

	           session.setAttribute("loginUser", member);

	           boolean isAdmin = member.getRoles().stream()
	                   .anyMatch(mr -> "ADMIN".equalsIgnoreCase(mr.getRole().getRoleName()));

	           if (isAdmin) {
	               return "redirect:/admin/main";
	           }

	           return "redirect:/";

	       } catch (IllegalArgumentException | IllegalStateException e) {
	           model.addAttribute("errorMessage", e.getMessage());
	           return "member/login";
	       }
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
	   public String register(Member member, Model model) {
	       try {
	           memberService.register(member);
	           return "redirect:/member/joinSuccess";
	       } catch (IllegalStateException e) {
	           // ✅ 중복 아이디 같은 "의도된" 예외 메시지
	           model.addAttribute("errorMessage", e.getMessage());
	           model.addAttribute("member", member); // ✅ 입력값 유지하고 싶으면
	           return "member/join";
	       } catch (IllegalArgumentException e) {
	           // ✅ 필수값 누락 등
	           model.addAttribute("errorMessage", e.getMessage());
	           model.addAttribute("member", member);
	           return "member/join";
	       } catch (Exception e) {
	           // ✅ 그 외 예상 못한 에러
	           model.addAttribute("errorMessage", "회원가입 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
	           model.addAttribute("member", member);
	           return "member/join";
	       }
	   }

	@GetMapping("/joinSuccess")
	public String joinSuccess() {
		return "member/join_final";
	}
	
	@GetMapping("/find-id")
	public String findId() {
		return "member/id_find";
	}

	// ================= 아이디 찾기 =================
	@PostMapping("/find-id")
	public String findId(@RequestParam String name, @RequestParam String phone, @RequestParam String email,
			Model model) {

		String memberId = memberService.findMemberId(name, phone, email);
		model.addAttribute("memberId", memberId);

		return "member/findIdResult";
	}
	
	@GetMapping("/find-pw")
	public String findPw() {
		return "member/pw_find";
	}

	// ================= 비밀번호 찾기 =================
	@PostMapping("/find-pw")
	public String findPw(@RequestParam String name, @RequestParam String memberId, @RequestParam String phone,
			@RequestParam String email, Model model) {

		// 기존 bool 타입을 String으로 변경 및 변수 명 result에서 pw로 변경 feat.병현
		String pw = memberService.checkMemberForPw(name, memberId, phone, email);

		// pw 검사 로직 추가 feat.병현
		if (pw.isEmpty()) {
			// pw를 찾지 못했을 때 처리 로직
			model.addAttribute("result", false);
			model.addAttribute("memberId", memberId);
			return "member/findPwResult";
		}

		// pw를 찾았을 때 처리 로직 feat.병현
		model.addAttribute("result", true);
		model.addAttribute("memberId", memberId);

		model.addAttribute("pw", pw);
		return "member/findPwResult";

	}
}
