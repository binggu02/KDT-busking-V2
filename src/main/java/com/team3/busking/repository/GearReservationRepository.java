package com.team3.busking.repository;

import com.team3.busking.domain.GearReservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.time.LocalDateTime;

public interface GearReservationRepository extends JpaRepository<GearReservation, Long> {

    // 기존 메서드(쓰고 있으면 남겨도 됨)
    boolean existsByReservationIdAndStartDatetimeAndEndDatetime(
            Long reservationId, LocalDateTime startDatetime, LocalDateTime endDatetime);

    // ✅ 마이페이지: 내 장비 대여 내역 (gear까지 fetch join)
    @Query("""
        select gr
        from GearReservation gr
        join fetch gr.gear g
        where gr.member.id = :memberId
        order by gr.reservationId desc
    """)
    List<GearReservation> findMyGearReservationsWithGear(@Param("memberId") Long memberId);
}
