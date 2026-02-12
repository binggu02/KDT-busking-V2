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
        // 관리자 세션 체크(키 이름은 너희가 쓰는 걸로 맞춰)
        // loginUser를 쓰는 경우 roles로 체크하거나, loginAdmin 같은 별도 세션을 두면 됨
        if (session.getAttribute("loginUser") == null) {
            return "redirect:/member/login";
        }
        return "admin/main";
    }
}
