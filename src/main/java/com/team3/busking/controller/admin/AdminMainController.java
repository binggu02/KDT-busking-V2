package com.team3.busking.controller.admin;

import com.team3.busking.domain.Member;
import com.team3.busking.service.admin.AdminDashboardService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminMainController {

    private final AdminDashboardService adminDashboardService;

    @GetMapping("/main")
    public String main(HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/member/login";

        model.addAttribute("memberCount", adminDashboardService.memberCount());
        model.addAttribute("placeReservationCount", adminDashboardService.placeReservationCount());
        model.addAttribute("gearReservationCount", adminDashboardService.gearReservationCount());
        model.addAttribute("boardCount", adminDashboardService.boardCount());

        model.addAttribute("recentBoards", adminDashboardService.recentBoards());
        model.addAttribute("recentPlaceReservations", adminDashboardService.recentPlaceReservations());
        model.addAttribute("recentGearReservations", adminDashboardService.recentGearReservations());
        model.addAttribute("recentMembers", adminDashboardService.recentMembers());

        return "admin/main";
    }

    private boolean isAdmin(HttpSession session) {
        Object obj = session.getAttribute("loginUser");
        if (obj == null) return false;

        Member member = (Member) obj;
        if (member.getRoles() == null) return false;

        return member.getRoles().stream()
                .anyMatch(mr -> mr.getRole() != null
                        && "ADMIN".equalsIgnoreCase(mr.getRole().getRoleName()));
    }
}
