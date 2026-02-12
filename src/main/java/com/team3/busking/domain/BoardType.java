package com.team3.busking.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "board_type")
public class BoardType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "board_type_id")
    private Long boardTypeId;

    @Column(name = "board_name", nullable = false, unique = true, length = 50)
    private String boardName;
}
