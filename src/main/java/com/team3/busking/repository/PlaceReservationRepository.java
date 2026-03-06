package com.team3.busking.repository;

import com.team3.busking.domain.PlaceReservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public interface PlaceReservationRepository extends JpaRepository<PlaceReservation, Long> {

    boolean existsByPlace_IdAndReservationDateAndStartTime(
            Long placeId, LocalDate reservationDate, LocalTime startTime);

    // ✅ 마이페이지: 내 장소 예약 내역 (place까지 fetch join)
    @Query("""
        select r
        from PlaceReservation r
        join fetch r.place p
        where r.userId = :userId
        order by r.id desc
    """)
    List<PlaceReservation> findMyReservationsWithPlace(@Param("userId") Long userId);
    List<PlaceReservation> findByUserIdOrderByReservationDateDescStartTimeDesc(Long userId);
    
    @Query("""
            select r
            from PlaceReservation r
            join fetch r.place p
            order by r.id desc
        """)
        List<PlaceReservation> findAllWithPlace();
    
    @Query("""
    	    select case when count(r) > 0 then true else false end
    	    from PlaceReservation r
    	    where r.place.id = :placeId
    	      and r.reservationDate = :reservationDate
    	      and r.status = true                
    	      and r.startTime < :endTime
    	      and r.endTime > :startTime
    	""")
    	boolean existsByPlaceAndOverlappingTime(
    	        @Param("placeId") Long placeId,
    	        @Param("reservationDate") LocalDate reservationDate,
    	        @Param("startTime") LocalTime startTime,
    	        @Param("endTime") LocalTime endTime
    	);
    
    
}
