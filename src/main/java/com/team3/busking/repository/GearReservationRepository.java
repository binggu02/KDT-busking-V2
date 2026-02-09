package com.team3.busking.repository;

import com.team3.busking.domain.GearReservation;


import java.time.LocalDateTime;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

// Gear 객체에서 GearReservation으로 변경 feat. 병현

public interface GearReservationRepository extends JpaRepository<GearReservation, Long> {

	@Query("""
			    select count(r)
			    from GearReservation r
			    where r.gear.gearId = :gearId
			      and r.startDatetime < :end
			      and r.endDatetime > :start
			""")
	long countOverlap(@Param("gearId") Long gearId, @Param("start") LocalDateTime start,
			@Param("end") LocalDateTime end);
}

//boolean existsByReservationIdAndStartDatetimeAndEndDatetime(Long reservationId, LocalDateTime startDatetime, LocalDateTime endDatetime);