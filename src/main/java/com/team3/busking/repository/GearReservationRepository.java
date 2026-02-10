package com.team3.busking.repository;

import com.team3.busking.domain.GearReservation;

import java.time.LocalDateTime;

import org.springframework.data.jpa.repository.JpaRepository;

// Gear 객체에서 GearReservation으로 변경 feat. 병현
public interface GearReservationRepository extends JpaRepository<GearReservation, Long> {
	
	// 예약된 id와 시작, 끝 비교 메소드 feat.병현
	boolean existsByReservationIdAndStartDatetimeAndEndDatetime(Long reservationId, LocalDateTime startDatetime, LocalDateTime endDatetime);
}
