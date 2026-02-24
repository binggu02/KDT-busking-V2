package com.team3.busking.controller.admin;

import com.team3.busking.domain.Gear;
import com.team3.busking.domain.Member;
import com.team3.busking.service.admin.AdminGearService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/gear")
public class AdminGearController {

    private final AdminGearService adminGearService;

    // ✅ (1) 장비 업데이트 목록: /admin/gear/update_list
    @GetMapping("/update_list")
    public String updateList(HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/member/login";

        List<Gear> gearList = adminGearService.findAllGears();
        model.addAttribute("gearList", gearList);
        return "admin/gear/update_list"; // /WEB-INF/views/admin/gear/update_list.jsp
    }

    // ✅ (2) 수정 폼: /admin/gear/update?id=1
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id,
                             HttpSession session,
                             Model model) {
        if (!isAdmin(session)) return "redirect:/member/login";

        Gear gear = adminGearService.getGear(id);
        model.addAttribute("gear", gear);
        return "admin/gear/update"; // /WEB-INF/views/admin/gear/update.jsp
    }

    // ✅ (3) 저장 처리: POST /admin/gear/update
    @PostMapping("/update")
    public String update(@RequestParam("id") Long id,
                         @RequestParam("gearQuantity") Integer gearQuantity,
                         @RequestParam("gearName") String gearName,
                         @RequestParam(value = "gearDescription", required = false) String gearDescription,
                         @RequestParam("gearPrice") Integer gearPrice,
                         @RequestParam(value = "gearThumbnail", required = false) String gearThumbnail,
                         HttpSession session) {

        if (!isAdmin(session)) return "redirect:/member/login";

        adminGearService.updateGear(id, gearQuantity, gearName, gearDescription, gearPrice, gearThumbnail);

        // ✅ 저장 후 목록으로
        return "redirect:/admin/gear/update_list";
    }
    
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id, HttpSession session) {
    	if (!isAdmin(session)) return "redirect:/member/login";
    	adminGearService.deleteGear(id);
    	
    	
    	return "redirect:/admin/gear/update_list";
    }
    
    @GetMapping("/create")
    public String createGear(HttpSession session) {
    	if (!isAdmin(session)) return "redirect:/member/login";
    	
    	
    	return "admin/gear/create";
    }
    
    @PostMapping("/create")
    public String createGearComplete(HttpSession session, 
            @RequestParam Integer gearQuantity,
            @RequestParam String gearName,
            @RequestParam(required = false) String gearDescription,
            @RequestParam Integer gearPrice,
            @RequestParam(required = false) String gearThumbnail
    		) {
    	if (!isAdmin(session)) return "redirect:/member/login";
    	
    	adminGearService.createGear(
    			gearName,
                gearQuantity,
                gearDescription,
                gearPrice,
                gearThumbnail);    	
    	
    	return "redirect:/admin/gear/update_list";
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
