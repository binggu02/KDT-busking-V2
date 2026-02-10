package com.team3.busking.repository;

import com.team3.busking.domain.PlaceReservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public interface ReservationRepository extends JpaRepository<PlaceReservation, Long> {

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
    // Reservation -> PlaceReservation 으로 변경 feat. 병현
    List<PlaceReservation> findMyReservationsWithPlace(@Param("userId") Long userId);
    // Reservation -> PlaceReservation 으로 변경 feat. 병현
    List<PlaceReservation> findByUserIdOrderByReservationDateDescStartTimeDesc(Long userId);
}
