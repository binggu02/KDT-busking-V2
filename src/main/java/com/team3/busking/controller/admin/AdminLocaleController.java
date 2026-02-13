package com.team3.busking.controller.admin;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/locale")
public class AdminLocaleController {

    // ✅ 이 메서드가 /admin/locale/list 를 잡고 있어서 충돌남
    // ✅ 예약 관리가 /admin/locale/list 를 쓸거면 이건 URL을 바꿔야 함
    @GetMapping("/place/list") // ✅ 기존 "/list" -> "/place/list"로 변경
    public String localeList(HttpSession session) {
        return "admin/locale/place_list"; // 너희 place 관리 JSP로 바꿔
    }
}
