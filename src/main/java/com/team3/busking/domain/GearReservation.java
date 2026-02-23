package com.team3.busking.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;



@Entity
@Getter
@Setter
@Table(name = "gear_reservation")
public class GearReservation {
	public enum GearReservationStatus{
		RESERVED,
	    RETURNED,
	    CANCELED
	}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id") // ✅ DB: gear_reservation.id
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gear_id", nullable = false) // ✅ DB: gear_id (FK → gear.id)
    private Gear gear;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", nullable = false) // ✅ DB: member_id (FK → member.id)
    private Member member;

    @Column(name = "start_datetime", nullable = false)
    private LocalDateTime startDatetime;

    @Column(name = "end_datetime", nullable = false)
    private LocalDateTime endDatetime;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false, length = 20)
    private GearReservationStatus status;

    @Column(name = "created_at", insertable = false, updatable = false) // ✅ DB: DEFAULT CURRENT_TIMESTAMP
    private LocalDateTime createdAt;
}
