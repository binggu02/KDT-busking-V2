	package com.team3.busking.controller.admin;
	
	import com.team3.busking.domain.Member;
import com.team3.busking.service.GearReservationService;
import com.team3.busking.service.admin.AdminGearReservationService;
	import jakarta.servlet.http.HttpSession;
	import lombok.RequiredArgsConstructor;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.*;

@Controller
	@RequiredArgsConstructor
	@RequestMapping("/admin/gear") // ✅ 예약은 경로 분리!
	public class AdminGearReservationController {

        private final GearReservationService gearReservationService;
	
	    private final AdminGearReservationService adminGearReservationService;

	
	    @GetMapping("/list")
	    public String list(HttpSession session, Model model) {
	        if (!isAdmin(session)) return "redirect:/member/login";
	
	        model.addAttribute("reservationList", adminGearReservationService.findAll());
	        return "admin/gear/list"; // ✅ JSP도 분리 추천
	    }
	
	    @PostMapping("/{id}/delete")
	    public String delete(@PathVariable Long id, HttpSession session) {
	        if (!isAdmin(session)) return "redirect:/member/login";
	
	        gearReservationService.deleteReserve(id);
	        
	        
	        
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
	    
	    @GetMapping("/return")
	    public String returnGear(HttpSession session, @RequestParam Long id) {
	    	if (!isAdmin(session)) return "redirect:/member/login";
	    	
	    	gearReservationService.returnStatus(id);
	    	
	    	return "redirect:/admin/gear/list";
	    }
	}
