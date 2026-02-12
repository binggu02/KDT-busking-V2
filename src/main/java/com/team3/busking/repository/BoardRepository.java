package com.team3.busking.repository;

import com.team3.busking.domain.Board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardRepository extends JpaRepository<Board, Long> {

    // 게시판별 글 조회
    List<Board> findByBoardTypeIdOrderByBoardIdDesc(Long boardTypeId);

    // 작성자별 글 조회
    List<Board> findByUserIdOrderByBoardIdDesc(Long userId);
}
