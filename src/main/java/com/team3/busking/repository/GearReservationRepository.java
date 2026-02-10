package com.team3.busking.repository;

import com.team3.busking.domain.GearReservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface GearReservationRepository extends JpaRepository<GearReservation, Long> {

    @Query("""
        select gr
        from GearReservation gr
        join fetch gr.gear
        where gr.member.id = :memberId
        order by gr.id desc
    """)
    List<GearReservation> findMyGearReservationsWithGear(@Param("memberId") Long memberId);
    List<GearReservation> findByMember_IdOrderByIdDesc(Long memberId);
}
