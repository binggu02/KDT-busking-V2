package com.team3.busking.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "board")
@Getter @Setter
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long boardId;

    // ✅ 작성자 FK
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private Member member;

    @Column(name = "board_type_id", nullable = false)
    private Long boardTypeId;

    @Column(nullable = false, length = 200)
    private String title;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String content;

    @Column(name = "create_writer_at", columnDefinition = "DATETIME")
    private LocalDateTime createWriterAt = LocalDateTime.now();

    @Column(name = "thumbnail_writer", length = 255)
    private String thumbnailWriter;

    @Column(columnDefinition = "TEXT")
    private String answer;
    
}
