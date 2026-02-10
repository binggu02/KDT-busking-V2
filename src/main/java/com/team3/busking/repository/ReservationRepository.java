package com.team3.busking.repository;

import com.team3.busking.domain.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

    boolean existsByPlace_IdAndReservationDateAndStartTime(
            Long placeId, LocalDate reservationDate, LocalTime startTime);

    // ✅ 마이페이지: 내 장소 예약 내역 (place까지 fetch join)
    @Query("""
        select r
        from Reservation r
        join fetch r.place p
        where r.userId = :userId
        order by r.id desc
    """)
    List<Reservation> findMyReservationsWithPlace(@Param("userId") Long userId);
    List<Reservation> findByUserIdOrderByReservationDateDescStartTimeDesc(Long userId);
}
