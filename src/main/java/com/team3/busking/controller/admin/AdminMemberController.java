package com.team3.busking.controller.admin;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {

    @GetMapping("/main")
    public String main(HttpSession session) {
        if (session.getAttribute("loginUser") == null) {
            return "redirect:/member/login";
        }
        return "admin/main";
    }

    // ✅ 로그아웃 추가
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();   // 세션 전체 삭제
        return "redirect:/member/login";
    }
}
