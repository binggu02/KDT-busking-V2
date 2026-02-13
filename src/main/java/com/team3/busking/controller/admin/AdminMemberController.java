package com.team3.busking.controller.admin;

import com.team3.busking.domain.Member;
import com.team3.busking.service.admin.AdminMemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/member")
public class AdminMemberController {

    private final AdminMemberService adminMemberService;

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("memberList", adminMemberService.findAll());
        return "admin/member/list";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        Member member = adminMemberService.findById(id);
        model.addAttribute("member", member);
        return "admin/member/edit";
    }

    @PostMapping("/{id}/edit")
    public String edit(
            @PathVariable Long id,
            @RequestParam(required = false) String pw,           // ✅ 비번은 비어있을 수 있음
            @RequestParam String name,
            @RequestParam(required = false) String nickname,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String phone,
            @RequestParam(required = false) LocalDate birthDate, // ✅ <input type="date">면 자동 변환됨
            @RequestParam(required = false) String gender
    ) {
        adminMemberService.updateMemberAll(
                id, pw, name, nickname, email, phone, birthDate, gender
        );
        return "redirect:/admin/member/list";
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id) {
        adminMemberService.deleteMember(id);
        return "redirect:/admin/member/list";
    }
}
