package com.team3.busking.controller;

import com.team3.busking.domain.Board;
import com.team3.busking.domain.Member;
import com.team3.busking.service.BoardService;
import com.team3.busking.service.GearReservationService;
import com.team3.busking.service.LocaleService;
import com.team3.busking.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor
public class MyPageController {

    private final MemberService memberService;

    private final GearReservationService gearReservationService;
    private final LocaleService reservationService;
    private final BoardService boardService;


    /* =========================
       마이페이지 메인
       /mypage
       ========================= */
    @GetMapping("")
    public String main(
            HttpSession session,
            Model model,
            @RequestParam(required = false, defaultValue = "place") String tab
    ) {
        Member loginMember = (Member) session.getAttribute("loginUser");
        if (loginMember == null) {
            return "redirect:/member/login";
        }

        model.addAttribute("member", loginMember);

        model.addAttribute("gearReservations",
                gearReservationService.findMyGearReservations(loginMember.getId()));

        // ✅ 여기 고침: LocaleService.findMyReservations(...) → reservationService.findMyReservations(...)
        model.addAttribute("placeReservations",
                reservationService.findMyReservations(loginMember.getId()));
        
        model.addAttribute("posts",
        		boardService.getBoardsByUserId(loginMember.getId()));

        model.addAttribute("activeTab", tab);

        return "mypage/main";
    }

    /* =========================
       프로필 수정
       /mypage/update
       ========================= */
    @GetMapping("/update")
    public String Getupdate(HttpSession session, Model model) {

        Member loginMember = (Member) session.getAttribute("loginUser");
        if (loginMember == null) {
            return "redirect:/member/login";
        }

        model.addAttribute("member", loginMember);
        return "mypage/update";
    }
    
    /* =========================
    프로필 수정 요청처리
    /mypage/update
    ========================= */
    @PostMapping("/update")
    public String Setupdate(HttpSession session, Member member,
    						@RequestParam String pw1, @RequestParam String pw2) {
    	
    	// 로그인 세션 처리
    	Member loginMember = (Member) session.getAttribute("loginUser");
        if (loginMember == null) {
            return "redirect:/member/login";
        }
        
        // 비번 두개가 맞는지 확인 로직
        if(pw1.equals(pw2)) {
        	loginMember.setPw(pw2);
        	memberService.updateMember(loginMember);
        } else {
        	return "redirect:/mypage/update";
        }
        
        
    	
    	return "redirect:/mypage";
    }
    
    

    /* =========================
       회원 탈퇴
       /mypage/withdraw
       ========================= */
    @GetMapping("/withdraw")
    public String withdraw(HttpSession session) {

        Member loginMember = (Member) session.getAttribute("loginUser");
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

        Member loginMember = (Member) session.getAttribute("loginUser");
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
    public String boardUpdate(HttpSession session, Model model) {

        Member loginMember = (Member) session.getAttribute("loginUser");
        if (loginMember == null) {
            return "redirect:/member/login";
        }
        
        

        return "mypage/board/update";
    }

    /* =========================
       장비 대여 내역 (별도 페이지)
       /mypage/gear
       ========================= */
    @GetMapping("/gear")
    public String gearList(HttpSession session, Model model) {

        Member loginMember = (Member) session.getAttribute("loginUser");
        if (loginMember == null) {
            return "redirect:/member/login";
        }

        model.addAttribute("gearReservations",
                gearReservationService.findMyGearReservations(loginMember.getId()));

        return "mypage/gear/list";
    }

    /* =========================
       장소 예약 정보 (별도 페이지)
       /mypage/reserve
       ========================= */
    @GetMapping("/reserve")
    public String reserveInfo(HttpSession session, Model model) {

        Member loginMember = (Member) session.getAttribute("loginUser");
        if (loginMember == null) {
            return "redirect:/member/login";
        }

        model.addAttribute("placeReservations",
                reservationService.findMyReservations(loginMember.getId()));

        return "mypage/reserve/info";
    }
    
    @GetMapping("/gear/return")
    public String returnGeardsfa(@RequestParam Long id, HttpSession session) {
    	
    	Member loginMember = (Member) session.getAttribute("loginUser");
        if (loginMember == null) {
            return "redirect:/member/login";
        }
        
        
    	
        gearReservationService.returnStatus(id);
        
        
        return "redirect:/mypage?tab=gear";
    }
    
    @GetMapping("/place/return")
    public String returnPlaceReservation(
            @RequestParam Long id, // PlaceReservation ID
            HttpSession session
    ) {
        Member loginMember = (Member) session.getAttribute("loginUser");
        if (loginMember == null) {
            return "redirect:/member/login";
        }

        try {
            // LocaleService에서 취소 로직 호출
            reservationService.cancelReservation(id, loginMember.getId());
        } catch (IllegalArgumentException | IllegalStateException ex) {
            // 실패 시 alert 띄우고 싶다면 FlashAttribute 사용 가능
            session.setAttribute("error", ex.getMessage());
        }

        // 취소 후 마이페이지 장소 탭으로 이동
        return "redirect:/mypage?tab=place";
    
    }
}
