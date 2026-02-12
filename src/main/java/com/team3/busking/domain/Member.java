package com.team3.busking.domain;

import java.time.LocalDate;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "member")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Member {

    // ✅ DB PK
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // 로그인 ID
    @Column(name = "member_id", length = 20, nullable = false, unique = true)
    private String memberId;

    @Column(length = 100, nullable = false)
    private String pw;

    @Column(length = 50, nullable = false)
    private String name;

    @Column(length = 50)
    private String nickname;

    @Column(length = 225)
    private String email;

    @Column(length = 11)
    private String phone;

    // 생년월일
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "birth_date")
    private LocalDate birthDate;

    @Column(length = 1)
    private String gender;

    // 생성일 (DB default 사용)
    @Column(
        name = "created_member_at",
        insertable = false,
        updatable = false
    )
    private LocalDateTime createdMemberAt;
    
    @OneToMany(mappedBy = "member", fetch = FetchType.LAZY)
    private List<MemberRole> roles = new ArrayList<>();
}
