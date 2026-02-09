package com.team3.busking.service;

import com.team3.busking.domain.GearReservation;
import com.team3.busking.domain.Reservation;
import com.team3.busking.repository.GearReservationRepository;
import com.team3.busking.repository.ReservationRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class MyPageService {

    private final ReservationRepository reservationRepository;
    private final GearReservationRepository gearReservationRepository;

    public MyPageService(ReservationRepository reservationRepository,
                         GearReservationRepository gearReservationRepository) {
        this.reservationRepository = reservationRepository;
        this.gearReservationRepository = gearReservationRepository;
    }

    // 장소 예약 내역 (reservation 테이블)
    public List<Reservation> getPlaceReservations(Long userId) {
        return reservationRepository.findMyReservationsWithPlace(userId);
    }

    // 장비 대여 내역 (gear_reservation 테이블)
    public List<GearReservation> getGearReservations(Long memberId) {
        return gearReservationRepository.findMyGearReservationsWithGear(memberId);
    }
}
