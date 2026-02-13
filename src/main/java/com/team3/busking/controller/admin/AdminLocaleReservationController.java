package com.team3.busking.controller.admin;

import com.team3.busking.service.admin.AdminLocaleReservationService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/locale")
public class AdminLocaleReservationController {

    private final AdminLocaleReservationService adminLocaleReservationService;

    // ✅ 관리자: 전체 예약 목록
    @GetMapping("/list")
    public String list(Model model, HttpSession session) {
        model.addAttribute("reservationList", adminLocaleReservationService.findAll());
        return "admin/locale/list";
    }

    // ✅ 관리자: 예약 삭제
    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id, HttpSession session) {
        adminLocaleReservationService.deleteById(id);
        return "redirect:/admin/locale/list";
    }
}
