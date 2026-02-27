package com.team3.busking.repository;

import com.team3.busking.domain.Board;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Pageable;
import java.util.List;

@Repository
public interface BoardRepository extends JpaRepository<Board, Long> {

    // 게시판별 글 조회
    List<Board> findByBoardTypeIdOrderByBoardIdDesc(Long boardTypeId);

    // 작성자별 글 조회
    List<Board> findByMember_IdOrderByBoardIdDesc(Long memberId);
    

    @Query("""
        select b
        from Board b
        join fetch b.member m
        where b.boardTypeId = :boardTypeId
        order by b.boardId desc
    """)
    List<Board> findByBoardTypeIdWithMember(@Param("boardTypeId") Long boardTypeId);

    @Query("""
        select b
        from Board b
        join fetch b.member m
        where m.id = :userId
        order by b.boardId desc
    """)
    List<Board> findByUserIdWithMember(@Param("userId") Long userId);
  

    @Query("""
        select b
        from Board b
        join fetch b.member m
        order by b.boardId desc
    """)
    List<Board> findRecentWithMember(Pageable pageable);
}
  

