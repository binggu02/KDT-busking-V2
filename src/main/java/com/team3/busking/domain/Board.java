package com.team3.busking.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "board")
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "board_id")
    private Long boardId;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "board_type_id", nullable = false)
    private Long boardTypeId; // BoardType 엔티티 없이 FK 컬럼만 관리

    @Column(nullable = false, length = 200)
    private String title;

    @Lob
    @Column(nullable = false)
    private String content;

    @Column(name = "create_writer_at", columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime createWriterAt;

    @Column(name = "thumbnail_writer")
    private String thumbnailWriter;

    @PrePersist
    public void prePersist() {
        if (createWriterAt == null) {
            createWriterAt = LocalDateTime.now();
        }
    }
}
