package com.team3.busking.controller.admin;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/locale")
public class AdminLocaleController {

	@GetMapping("/list")
	public String localeList(HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/member/login";
		return "admin/locale/list"; // /WEB-INF/views/admin/locale/list.jsp
	}


	private boolean isAdmin(HttpSession session) {
		Object obj = session.getAttribute("loginUser");
		if (obj == null)
			return false;
		com.team3.busking.domain.Member member = (com.team3.busking.domain.Member) obj;
		if (member.getRoles() == null)
			return false;
		return member.getRoles().stream()
				.anyMatch(mr -> mr.getRole() != null && "ADMIN".equalsIgnoreCase(mr.getRole().getRoleName()));
	}
}
