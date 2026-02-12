package com.team3.busking.controller.admin;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {

    // 게시판 관리 페이지
    @GetMapping("/list")
    public String boardList(HttpSession session) {
        if (!isAdmin(session)) return "redirect:/member/login";
        return "admin/board/list"; // /WEB-INF/views/admin/board/list.jsp
    }

    // Q&A 관리 페이지
    @GetMapping("/qna_list")
    public String qnaList(HttpSession session) {
        if (!isAdmin(session)) return "redirect:/member/login";
        return "admin/board/qna_list"; // /WEB-INF/views/admin/board/qna_list.jsp
    }

    private boolean isAdmin(HttpSession session) {
        Object obj = session.getAttribute("loginUser");
        if (obj == null) return false;

        com.team3.busking.domain.Member member = (com.team3.busking.domain.Member) obj;
        if (member.getRoles() == null) return false;

        return member.getRoles().stream()
                .anyMatch(mr -> mr.getRole() != null
                        && "ADMIN".equalsIgnoreCase(mr.getRole().getRoleName()));
    }
}
