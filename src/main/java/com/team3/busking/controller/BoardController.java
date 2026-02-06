package com.team3.busking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

@Controller
@RequestMapping("/board")
public class BoardController {

    // 게시판 메인 (자유 / QnA)
    @GetMapping("/main")
    public String boardMain(
            @RequestParam(defaultValue = "free") String type,
            Model model
    ) {
        model.addAttribute("type", type); // free or qna
        return "board/main";
    }

    // 자유게시판 글 상세
    @GetMapping("/view")
    public String boardView() {
        return "board/board_view";
    }

    // QnA 글 상세
    @GetMapping("/qna/view")
    public String qnaView() {
        return "board/qna_view";
    }

    // 글쓰기
    @GetMapping("/create")
    public String create() {
        return "board/create";
    }

    // 글 수정
    @GetMapping("/update")
    public String update() {
        return "board/update";
    }
}
