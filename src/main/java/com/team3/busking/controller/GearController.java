package com.team3.busking.controller;

import com.team3.busking.domain.Gear;
import com.team3.busking.domain.Member;
import com.team3.busking.service.GearReservationService;
import com.team3.busking.service.GearService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/gear")
@RequiredArgsConstructor
public class GearController {

    private final GearService gearService;
    private final GearReservationService gearReservationService;

    // 장비 목록
    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("gearList", gearService.findAll());
        return "gear/list";
    }

    // 장비 클릭 → 예약 페이지
    @GetMapping("/reserve")
    public String reservePage(@RequestParam("gearId") Long gearId, Model model) {
        Gear gear = gearService.findById(gearId);
        model.addAttribute("gear", gear);
        return "gear/reserve";
    }

    // 예약 확정
    @PostMapping("/reserve/confirm")
    public String confirm(@RequestParam Long gearId,
                          @RequestParam String startDT,
                          @RequestParam String endDT,
                          HttpSession session,
                          RedirectAttributes ra) {

        // ✅ 수정: loginMemberId 대신 loginUser(Member)에서 id 꺼내기
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            ra.addFlashAttribute("error", "로그인이 필요합니다.");
            return "redirect:/member/login";
        }
        Long memberId = loginUser.getId();

        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime start = LocalDateTime.parse(startDT, formatter);
            LocalDateTime end = LocalDateTime.parse(endDT, formatter);

            gearReservationService.reserve(gearId, memberId, start, end);

            ra.addFlashAttribute("msg", "예약이 완료되었습니다.");
            return "redirect:/gear/reserveComplete";

        } catch (IllegalStateException ex) {
            ra.addFlashAttribute("error", ex.getMessage());
            return "redirect:/gear/reserve?gearId=" + gearId;
        }
    }

    // 예약 완료 페이지
    @GetMapping("/reserveComplete")
    public String reserveComplete() {
        return "gear/reserveComplete";
    }
}
