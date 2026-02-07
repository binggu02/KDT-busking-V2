package com.team3.busking.repository;

import com.team3.busking.domain.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.time.LocalTime;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

  boolean existsByPlace_IdAndReservationDateAndStartTime(Long placeId, LocalDate reservationDate, LocalTime startTime);
}
