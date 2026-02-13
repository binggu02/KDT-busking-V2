package com.team3.busking.controller.admin;

import com.team3.busking.domain.Board;
import com.team3.busking.service.BoardService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {

    private final BoardService boardService;

    public AdminBoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    // 게시판 관리 페이지 (자유게시판)
    @GetMapping("/list")
    public String boardList(HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/member/login";

        List<Board> boards = boardService.getBoardsByBoardTypeId(1L);
        model.addAttribute("boardList", boards);

        return "admin/board/list";
    }

    // Q&A 관리 페이지
    @GetMapping("/qna_list")
    public String qnaList(HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/member/login";

        List<Board> boards = boardService.getBoardsByBoardTypeId(2L);
        model.addAttribute("boardList", boards);

        return "admin/board/qna_list";
    }

    // ✅ 게시글 삭제
    @PostMapping("/delete")
    public String deleteBoard(@RequestParam("boardId") Long boardId,
                              @RequestParam("boardTypeId") Long boardTypeId,
                              HttpSession session) {

        if (!isAdmin(session)) return "redirect:/member/login";

        boardService.deleteBoard(boardId);

        // 게시판 종류에 따라 다시 돌아갈 페이지 결정
        if (boardTypeId == 2L) {
            return "redirect:/admin/board/qna_list";
        }

        return "redirect:/admin/board/list";
    }

    private boolean isAdmin(HttpSession session) {
        Object obj = session.getAttribute("loginUser");
        if (obj == null) return false;

        com.team3.busking.domain.Member member =
                (com.team3.busking.domain.Member) obj;
        if (member.getRoles() == null) return false;

        return member.getRoles().stream()
                .anyMatch(mr -> mr.getRole() != null
                        && "ADMIN".equalsIgnoreCase(mr.getRole().getRoleName()));
    }
    
    
    
}
