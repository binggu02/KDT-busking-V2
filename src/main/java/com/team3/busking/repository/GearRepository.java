package com.team3.busking.repository;

import com.team3.busking.domain.Gear;
import com.team3.busking.domain.GearReservation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.Optional;

public interface GearRepository extends JpaRepository<Gear, Long> {

	
	@Query("""
		    select count(r)
		    from GearReservation r
		    where r.gear.gearId = :gearId
		      and r.startDatetime < :end
		      and r.endDatetime > :start
		""")
long countOverlap(@Param("gearId") Long gearId, @Param("start") LocalDateTime start,
		@Param("end") LocalDateTime end);

	// 기어 서비스쪽 에러 해결을 위한 메소드 추가 feat.병현
	Optional<Gear> findByGearId(Long gearId);
}
