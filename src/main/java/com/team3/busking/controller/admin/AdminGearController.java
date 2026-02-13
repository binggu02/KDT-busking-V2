package com.team3.busking.controller.admin;

import com.team3.busking.domain.Member;
import com.team3.busking.service.admin.AdminGearReservationService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/gear")
public class AdminGearController {

    private final AdminGearReservationService adminGearReservationService;

    // ✅ 관리자 장비 예약 목록 (DB에서 전부 조회)
    @GetMapping("/list")
    public String gearList(HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/member/login";

        model.addAttribute("reservationList", adminGearReservationService.findAll());
        return "admin/gear/list"; // /WEB-INF/views/admin/gear/list.jsp
    }

    // ✅ 관리자: 장비 예약 삭제
    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/member/login";

        adminGearReservationService.deleteById(id);
        return "redirect:/admin/gear/list";
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
