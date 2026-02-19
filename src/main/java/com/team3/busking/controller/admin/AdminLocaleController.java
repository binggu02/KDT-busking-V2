package com.team3.busking.controller.admin;

import com.team3.busking.domain.Member;

import com.team3.busking.domain.Place;
import com.team3.busking.service.admin.AdminPlaceService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/locale")
public class AdminLocaleController {

    private final AdminPlaceService adminPlaceService;

    // ✅ (1) 장소 업데이트 목록: GET /admin/place/update_list
    @GetMapping("/update_list")
    public String updateList(HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/member/login";

        List<Place> placeList = adminPlaceService.findAllPlaces();
        model.addAttribute("placeList", placeList);
        return "admin/locale/update_list"; // /WEB-INF/views/admin/place/update_list.jsp
    }

    // ✅ (2) 수정 폼: GET /admin/place/update?id=1
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id,
                             HttpSession session,
                             Model model) {
        if (!isAdmin(session)) return "redirect:/member/login";

        Place place = adminPlaceService.getPlace(id);
        model.addAttribute("place", place);

        return "admin/locale/update"; // /WEB-INF/views/admin/place/update.jsp
    }

    // ✅ (3) 저장 처리: POST /admin/place/update
    @PostMapping("/update")
    public String update(@RequestParam("id") Long id,
                         @RequestParam(value = "cityId", required = false) Long cityId,
                         @RequestParam("placeName") String placeName,
                         @RequestParam("placeAddress") String placeAddress,
                         @RequestParam(value = "placePhone", required = false) String placePhone,
                         @RequestParam(value = "placeDescription", required = false) String placeDescription,
                         @RequestParam(value = "thumbnail", required = false) String thumbnail,
                         HttpSession session) {
        if (!isAdmin(session)) return "redirect:/member/login";

        adminPlaceService.updatePlace(
                id, cityId, placeName, placeAddress, placePhone, placeDescription, thumbnail
        );

        return "redirect:/admin/locale/update_list";
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
