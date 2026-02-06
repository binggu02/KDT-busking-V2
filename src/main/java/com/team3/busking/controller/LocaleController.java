package com.team3.busking.controller;

import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/locale")
public class LocaleController {

    private static final Map<String, String> REGION_NAME = Map.of(
            "seoul", "서울 광역시",
            "incheon", "인천 광역시",
            "busan", "부산 광역시",
            "daegu", "대구 광역시",
            "gwangju", "광주 광역시",
            "ulsan", "울산 광역시",
            "daejeon", "대전 광역시"
    );

    private static final Map<String, List<Place>> DATA = new HashMap<>();

    static {
        DATA.put("seoul", List.of(
                new Place("도산대로 666-2", "서울 강남구 도산대로 666-2", "02-0000-0000", "/images/01.jpg"),
                new Place("도산대로 668-2", "서울 강남구 도산대로 668-2", "02-0000-0000", "/images/02.jpg")
        ));
        DATA.put("busan", List.of(
                new Place("광안리 해변", "부산 수영구 광안해변로", "051-0000-0000", "/images/03.jpg")
        ));
        DATA.put("incheon", List.of(
                new Place("송도 센트럴파크", "인천 연수구 송도동", "032-000-0000", "/images/04.jpg")
        ));
        DATA.put("daegu", List.of(
                new Place("동성로", "대구 중구 동성로", "053-000-0000", "/images/05.jpg")
        ));
        DATA.put("gwangju", List.of(
                new Place("충장로", "광주 동구 충장로", "062-000-0000", "/images/06.jpg")
        ));
        DATA.put("ulsan", List.of(
                new Place("태화강공원", "울산 중구 태화동", "052-000-0000", "/images/07.jpg")
        ));
        DATA.put("daejeon", List.of(
                new Place("둔산동 카페거리", "대전 서구 둔산동", "042-000-0000", "/images/08.jpg")
        ));
    }


    @GetMapping("/list")
    public String localeList(Model model) {
        model.addAttribute("pageTitle", "지역별 장소 예약");
        return "locale/list"; // ✅ /WEB-INF/views/locale/list.jsp
    }

    @GetMapping("/{region:seoul|incheon|busan|daegu|gwangju|ulsan|daejeon}")
    public String placeList(@PathVariable String region, Model model) {
        String regionName = REGION_NAME.get(region);
        List<Place> places = DATA.getOrDefault(region, Collections.emptyList());

        model.addAttribute("places", places);
        model.addAttribute("regionName", regionName);
        model.addAttribute("pageTitle", regionName + " 장소 목록");

        return "locale/placelist"; // ✅ /WEB-INF/views/locale/placelist.jsp
    }

    @GetMapping("/reserve")
    public String reservePage(Model model) {
        model.addAttribute("pageTitle", "장소 예약");
        return "locale/reserve"; // ✅ /WEB-INF/views/locale/reserve.jsp
    }

    @GetMapping("/reserve/complete")
    public String reserveComplete(Model model) {
        model.addAttribute("pageTitle", "예약 완료");
        return "locale/reserveComplete"; // ✅ /WEB-INF/views/locale/reserveComplete.jsp
    }

    public static class Place {
        private final String name;
        private final String address;
        private final String phone;
        private final String img;

        public Place(String name, String address, String phone, String img) {
            this.name = name;
            this.address = address;
            this.phone = phone;
            this.img = img;
        }
        public String getName() { return name; }
        public String getAddress() { return address; }
        public String getPhone() { return phone; }
        public String getImg() { return img; }
    }
}
