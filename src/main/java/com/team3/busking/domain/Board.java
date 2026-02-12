package com.team3.busking.domain;

import jakarta.persistence.*;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name = "board")
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long boardId;

    @Column(nullable = false)
    private Long userId;

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

	
}
