package com.team3.busking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.busking.domain.Member;
import com.team3.busking.domain.Place;
import com.team3.busking.domain.PlaceReservation;
import com.team3.busking.service.LocaleService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/locale")
public class LocaleController {

    private final LocaleService localeService;

    public LocaleController(LocaleService localeService) {
        this.localeService = localeService;
    }

    // 지역 목록
    @GetMapping("/list")
    public String cityList(Model model) {
        model.addAttribute("pageTitle", "지역별 장소 예약");
        model.addAttribute("cities", localeService.getCities());
        return "locale/list";
    }

    // 도시별 장소 목록
    @GetMapping("/{cityCode}")
    public String placeList(@PathVariable String cityCode, Model model) {
        model.addAttribute("pageTitle", "장소 목록");
        model.addAttribute("places", localeService.getPlacesByCityCode(cityCode));
        return "locale/placelist";
    }

    // 예약 페이지
    @GetMapping("/reserve")
    public String reservePage(
            @RequestParam Long placeId,
            HttpSession session,
            Model model
    ) {
        Place place = localeService.getPlace(placeId);
        if (place == null) {
            return "redirect:/locale/list";
        }

        Member loginUser = (Member) session.getAttribute("loginUser");

        model.addAttribute("pageTitle", "장소 예약");
        model.addAttribute("place", place);

        if (loginUser != null) {
            model.addAttribute("userName", loginUser.getName());
        }

        return "locale/reserve";
    }
    // 예약 저장 (POST)
    @PostMapping("/reserve")
    public String reserveSubmit(
            @RequestParam Long placeId,
            @RequestParam String bandName,
            @RequestParam int bandCount,
            @RequestParam(required = false) String phone,
            @RequestParam(required = false) String email,
            @RequestParam String reservationDate,
            @RequestParam String startTime,
            HttpSession session,
            RedirectAttributes ra
    ) {
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/member/login";
        }

        Long reservationId = localeService.createReservation(
                loginUser.getId(),
                placeId,
                bandName,
                bandCount,
                phone,
                email,
                reservationDate,
                startTime
        );

        ra.addAttribute("reservationId", reservationId);
        return "redirect:/locale/reserve/complete";
    }

    // 예약 완료 페이지
    @GetMapping("/reserve/complete")
    public String reserveComplete(
            @RequestParam Long reservationId,
            HttpSession session,
            Model model
    ) {
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/member/login";
        }

        PlaceReservation reservation = localeService.getReservation(reservationId);
        if (reservation == null) {
            return "redirect:/locale/list";
        }

        model.addAttribute("pageTitle", "예약 완료");
        model.addAttribute("reservation", reservation);
        model.addAttribute("userName", loginUser.getName());
        return "locale/reserveComplete";
    }
}