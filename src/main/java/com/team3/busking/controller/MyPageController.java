package com.team3.busking.controller;

import com.team3.busking.domain.Member;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

    /* =========================
       마이페이지 메인
       /mypage
       ========================= */
	@GetMapping("")
	public String main(HttpSession session, Model model) {

	    Member loginMember = (Member) session.getAttribute("loginUser");
	    if (loginMember == null) {
	        return "redirect:/member/login";
	    }

	    model.addAttribute("member", loginMember);
	    return "mypage/main";
	}


    /* =========================
       프로필 수정
       /mypage/update
       ========================= */
    @GetMapping("/update")
    public String update(HttpSession session, Model model) {

        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/member/login";
        }

        model.addAttribute("member", loginMember);
        return "mypage/update";
    }

    /* =========================
       회원 탈퇴
       /mypage/withdraw
       ========================= */
    @GetMapping("/withdraw")
    public String withdraw(HttpSession session) {

        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/member/login";
        }

        return "mypage/withdraw";
    }

    /* =========================
       내 게시글 목록
       /mypage/board
       ========================= */
    @GetMapping("/board")
    public String myBoard(HttpSession session) {

        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/member/login";
        }

        return "mypage/board/list";
    }

    /* =========================
       내 게시글 수정
       /mypage/board/update
       ========================= */
    @GetMapping("/board/update")
    public String boardUpdate(HttpSession session) {

        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/member/login";
        }

        return "mypage/board/update";
    }

    /* =========================
       장비 대여 내역
       /mypage/gear
       ========================= */
    @GetMapping("/gear")
    public String gearList(HttpSession session) {

        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/member/login";
        }

        return "mypage/gear/list";
    }

    /* =========================
       장소 예약 정보
       /mypage/reserve
       ========================= */
    @GetMapping("/reserve")
    public String reserveInfo(HttpSession session) {

        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/member/login";
        }

        return "mypage/reserve/info";
    }
}
