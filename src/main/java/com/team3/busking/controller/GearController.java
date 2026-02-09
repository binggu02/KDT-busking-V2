package com.team3.busking.controller;

import com.team3.busking.service.GearService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/gear")
public class GearController {

    private final GearService gearService;

    public GearController(GearService gearService) {
            this.gearService = gearService;
        }

    /**
     * 장비 목록 페이지
     */
    @GetMapping("/list")
    public String gearList(Model model) {
        // TODO: 나중에 DB에서 장비 리스트 조회
        model.addAttribute("gearList", gearService.findAll());
        return "gear/list";
    }

    /**
     * 장비 예약 페이지
     * gear/list → 장비 클릭 시 이동
     * 예) /gear/reserve?id=1
     */
    // 정훈이랑 인찬이 코드 중복됨
    // GearReservationController.java 참고
    // @GetMapping("/reserve")
    // public String reserve(@RequestParam int id, Model model) {

    //     model.addAttribute("gearId", id);
    //     model.addAttribute("gearName", "기타");
    //     model.addAttribute("gearPrice", 0);
    //     model.addAttribute("gearDesc", "장비 설명");

    //     return "gear/reserve";
    // }

    /**
     * 예약 완료 페이지
     */

    @GetMapping("/complete")
    public String reserveComplete(
            @RequestParam int gearId,
            @RequestParam String address,
            @RequestParam String startDT,
            @RequestParam String endDT,
            Model model
    ) {
        model.addAttribute("gearName", "기타");
        model.addAttribute("gearPrice", 0);
        model.addAttribute("gearDesc", "장비 설명");

        model.addAttribute("address", address);
        model.addAttribute("startDT", startDT);
        model.addAttribute("endDT", endDT);

        return "gear/reserveComplete";
    }



}
