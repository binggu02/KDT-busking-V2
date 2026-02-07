package com.team3.busking.repository;

import com.team3.busking.domain.Gear;
import com.team3.busking.domain.GearReservation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.Optional;

public interface GearRepository extends JpaRepository<Gear, Long> {

	
	// 기존 @Query 방식 주석 처리함 feat.병현
//    @Query("""
//        SELECT COUNT(r)
//        FROM GearReservation r
//        WHERE r.gear.gearId = :gearId
//          AND r.status <> 'CANCELED'
//          AND r.startDatetime < :endTime
//          AND r.endDatetime > :startTime
//    """)
//    long countOverlap(
//            @Param("gearId") Long gearId,
//            @Param("startTime") LocalDateTime startTime,
//            @Param("endTime") LocalDateTime endTime
//    );
	
	// 기어 서비스쪽 에러 해결을 위한 메소드 추가 feat.병현
	Optional<Gear> findByGearId(Long gearId);
}
