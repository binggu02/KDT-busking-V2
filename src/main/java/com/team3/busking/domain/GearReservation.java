package com.team3.busking.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter @Setter
@Table(name = "gear_reservation")
public class GearReservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reservation_id")
    private Long reservationId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gear_id", nullable = false)
    private Gear gear;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", nullable = false)
    private Member member;

    @Column(name = "start_datetime", nullable = false)
    private LocalDateTime startDatetime;

    @Column(name = "end_datetime", nullable = false)
    private LocalDateTime endDatetime;

    @Column(length = 20)
    private String status;

    @Column(name = "created_at", insertable = false, updatable = false)
    private LocalDateTime createdAt;

    /* ===== getter / setter ===== */

//    public Long getReservationId() { return reservationId; }
//
//    public Gear getGear() { return gear; }
//    public void setGear(Gear gear) { this.gear = gear; }
//
//    public Member getMember() { return member; }
//    public void setMember(Member member) { this.member = member; }
//
//    public LocalDateTime getStartDatetime() { return startDatetime; }
//    public void setStartDatetime(LocalDateTime startDatetime) { this.startDatetime = startDatetime; }
//
//    public LocalDateTime getEndDatetime() { return endDatetime; }
//    public void setEndDatetime(LocalDateTime endDatetime) { this.endDatetime = endDatetime; }
//
//    public String getStatus() { return status; }
//    public void setStatus(String status) { this.status = status; }
//
//    public LocalDateTime getCreatedAt() { return createdAt; }
}
