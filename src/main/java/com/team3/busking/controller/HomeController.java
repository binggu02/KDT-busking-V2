package com.team3.busking.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team3.busking.domain.Board;
import com.team3.busking.domain.Place;
import com.team3.busking.service.BoardService;
import com.team3.busking.service.LocaleService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	

    private final LocaleService localeService;
    private final BoardService boardService;

    @GetMapping("/")
    public String home(Model model) {
        // 최신 장소 3개
        List<Place> latestLocales = localeService.getLatestLocales();
        model.addAttribute("latestLocales", latestLocales); // JSP 변수명 그대로 유지

        // 최신 게시글 5개
        List<Board> latestBoards = boardService.getLatestBoards();
        model.addAttribute("latestBoards", latestBoards);

        return "home";
    }

}
