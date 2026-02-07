package com.team3.busking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.busking.domain.Place;
import com.team3.busking.domain.Reservation;
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
		return "locale/placeList";
	}

	// 예약 페이지
	@GetMapping("/reserve")
	public String reservePage(@RequestParam Long placeId, HttpSession session, Model model) {
		Place place = localeService.getPlace(placeId);

		model.addAttribute("pageTitle", "장소 예약");
		model.addAttribute("place", place);
		model.addAttribute("userName", session.getAttribute("userName"));

		return "locale/reserve";
	}

	// 예약 저장
	@PostMapping("/reserve")
	public String reserveSubmit(@RequestParam Long placeId, @RequestParam String bandName, @RequestParam int bandCount,
			@RequestParam(required = false) String phone, @RequestParam(required = false) String email,
			@RequestParam String reservationDate, @RequestParam String startTime, HttpSession session,
			RedirectAttributes ra) {
		Long userId = (Long) session.getAttribute("userId");

		Long reservationId = localeService.createReservation(userId, placeId, bandName, bandCount, phone, email,
				reservationDate, startTime);

		ra.addAttribute("reservationId", reservationId);
		return "redirect:/locale/reserve/complete";
	}

	// 예약 완료
	@GetMapping("/reserve/complete")
	public String reserveComplete(@RequestParam Long reservationId, HttpSession session, Model model) {
		Reservation reservation = localeService.getReservation(reservationId);

		model.addAttribute("pageTitle", "예약 완료");
		model.addAttribute("reservation", reservation);
		model.addAttribute("userName", session.getAttribute("userName"));

		return "locale/complete";
	}
}
