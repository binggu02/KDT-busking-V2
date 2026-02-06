package com.team3.busking.repository;

import com.team3.busking.domain.GearReservation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;

public interface GearRepository extends JpaRepository<GearReservation, Long> {

    @Query("""
        SELECT COUNT(r)
        FROM GearReservation r
        WHERE r.gear.gearId = :gearId
          AND r.status <> 'CANCELED'
          AND r.startDatetime < :endTime
          AND r.endDatetime > :startTime
    """)
    long countOverlap(
            @Param("gearId") Long gearId,
            @Param("startTime") LocalDateTime startTime,
            @Param("endTime") LocalDateTime endTime
    );
}
