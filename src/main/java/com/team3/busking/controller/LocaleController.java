package com.team3.busking.controller;

import com.team3.busking.domain.Place;
import com.team3.busking.service.LocaleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/locale")
public class LocaleController {

    private final LocaleService localeService;

    public LocaleController(LocaleService localeService) {
        this.localeService = localeService;
    }

    // 1) 도시 리스트
    @GetMapping("/list")
    public String cityList(Model model) {
        model.addAttribute("pageTitle", "지역 선택");
        model.addAttribute("cities", localeService.getCities());
        return "locale/list";
    }

    // 2) /locale/seoul -> 서울 예약가능 장소 목록
    @GetMapping("/{cityCode}")
    public String placeList(@PathVariable String cityCode, Model model) {
        List<Place> places = localeService.getPlacesByCityCode(cityCode);

        model.addAttribute("pageTitle", "장소 목록");
        model.addAttribute("places", places);
        model.addAttribute("cityCode", cityCode);

        return "locale/placelist";
    }
    
}
