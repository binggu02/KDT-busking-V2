package com.team3.busking.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.team3.busking.domain.Board;
import com.team3.busking.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    /* =========================
       게시판 목록
       ========================= */
    @GetMapping("/main")
    public String boardMain(
            @RequestParam(defaultValue = "1") Long typeId, // 1: 홍보, 2: Q&A
            Model model) {

        List<Board> list = boardService.getBoardsByBoardTypeId(typeId);
        model.addAttribute("list", list);
        model.addAttribute("typeId", typeId);

        return "board/main"; // JSP / Thymeleaf 뷰
    }

    /* =========================
       게시글 상세
       ========================= */
    @GetMapping("/view")
    public String view(@RequestParam Long id, Model model) {

        Board board = boardService.getBoardById(id)
                .orElseThrow(() -> new IllegalArgumentException("글 없음"));

        model.addAttribute("board", board);

        // 게시판 타입에 따라 다른 뷰
        if (board.getBoardTypeId() == 2) {
            return "board/qna_view";
        }
        return "board/board_view";
    }

    /* =========================
       글쓰기 폼
       ========================= */
    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("board", new Board());
        return "board/create";
    }

    /* =========================
       글쓰기 처리
       ========================= */
    @PostMapping("/create")
    public String createSubmit(Board board) {

        // 🔥 임시 작성자 (로그인 기능 연동 시 교체)
        board.setUserId(1L);

        boardService.createBoard(
                board.getUserId(),
                board.getBoardTypeId(),
                board.getTitle(),
                board.getContent(),
                board.getThumbnailWriter()
        );

        return "redirect:/board/main?typeId=" + board.getBoardTypeId();
    }

    /* =========================
       수정 폼
       ========================= */
    @GetMapping("/update")
    public String updateForm(@RequestParam Long id, Model model) {
        Board board = boardService.getBoardById(id)
                .orElseThrow(() -> new IllegalArgumentException("글 없음"));

        model.addAttribute("board", board);
        return "board/update";
    }

    /* =========================
       수정 처리
       ========================= */
    @PostMapping("/update")
    public String updateSubmit(Board board) {
        // 기존 글 불러오기
        Board existing = boardService.getBoardById(board.getBoardId())
                .orElseThrow(() -> new IllegalArgumentException("글 없음"));

        // 업데이트
        existing.setTitle(board.getTitle());
        existing.setContent(board.getContent());
        existing.setThumbnailWriter(board.getThumbnailWriter());
        boardService.createBoard(
                existing.getUserId(),
                existing.getBoardTypeId(),
                existing.getTitle(),
                existing.getContent(),
                existing.getThumbnailWriter()
        );

        return "redirect:/board/view?id=" + board.getBoardId();
    }

    /* =========================
       삭제
       ========================= */
    @PostMapping("/delete")
    public String delete(@RequestParam Long id) {
        boardService.deleteBoard(id);
        return "redirect:/board/main";
    }
}
