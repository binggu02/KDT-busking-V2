package com.team3.busking.controller;

import com.team3.busking.domain.Member;
import com.team3.busking.service.MyPageService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

    private final MyPageService myPageService;

    public MyPageController(MyPageService myPageService) {
        this.myPageService = myPageService;
    }

    private Member login(HttpSession session) {
        return (Member) session.getAttribute("loginUser"); // ✅ 통일
    }

    /* =========================
       마이페이지 메인
       /mypage?tab=place|gear|post
       ========================= */
    @GetMapping("")
    public String main(
            @RequestParam(required = false, defaultValue = "place") String tab,
            HttpSession session,
            Model model
    ) {
        Member loginMember = login(session);
        if (loginMember == null) return "redirect:/member/login";

        model.addAttribute("member", loginMember);
        model.addAttribute("activeTab", tab);

        // ✅ DB에서 내역 조회해서 JSP로 전달
        model.addAttribute("placeReservations",
                myPageService.getPlaceReservations(loginMember.getId()));
        model.addAttribute("gearReservations",
                myPageService.getGearReservations(loginMember.getId()));

        return "mypage/main";
    }

    /* =========================
       프로필 수정
       /mypage/update
       ========================= */
    @GetMapping("/update")
    public String update(HttpSession session, Model model) {
        Member loginMember = login(session);
        if (loginMember == null) return "redirect:/member/login";

        model.addAttribute("member", loginMember);
        return "mypage/update";
    }

    /* =========================
       회원 탈퇴
       /mypage/withdraw
       ========================= */
    @GetMapping("/withdraw")
    public String withdraw(HttpSession session, Model model) {
        Member loginMember = login(session);
        if (loginMember == null) return "redirect:/member/login";

        model.addAttribute("member", loginMember);
        return "mypage/withdraw";
    }

    /* =========================
       내 게시글 목록
       /mypage/board
       ========================= */
    @GetMapping("/board")
    public String myBoard(HttpSession session, Model model) {
        Member loginMember = login(session);
        if (loginMember == null) return "redirect:/member/login";

        model.addAttribute("member", loginMember);
        return "mypage/board/list";
    }

    /* =========================
       내 게시글 수정
       /mypage/board/update
       ========================= */
    @GetMapping("/board/update")
    public String boardUpdate(HttpSession session, Model model) {
        Member loginMember = login(session);
        if (loginMember == null) return "redirect:/member/login";

        model.addAttribute("member", loginMember);
        return "mypage/board/update";
    }

    /* =========================
       (선택) 분리 페이지로도 진입 가능하게 유지
       /mypage/gear → gear 탭으로 리다이렉트
       ========================= */
    @GetMapping("/gear")
    public String gear(HttpSession session) {
        Member loginMember = login(session);
        if (loginMember == null) return "redirect:/member/login";
        return "redirect:/mypage?tab=gear";
    }

    /* =========================
       (선택) /mypage/reserve → place 탭
       ========================= */
    @GetMapping("/reserve")
    public String reserve(HttpSession session) {
        Member loginMember = login(session);
        if (loginMember == null) return "redirect:/member/login";
        return "redirect:/mypage?tab=place";
    }
}
