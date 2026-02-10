package com.team3.busking.service;

import com.team3.busking.domain.GearReservation;
import com.team3.busking.domain.Reservation;
import com.team3.busking.repository.GearReservationRepository;
import com.team3.busking.repository.ReservationRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class MyPageService {

    private final ReservationRepository reservationRepository;
    private final GearReservationRepository gearReservationRepository;

    public MyPageService(ReservationRepository reservationRepository,
                         GearReservationRepository gearReservationRepository) {
        this.reservationRepository = reservationRepository;
        this.gearReservationRepository = gearReservationRepository;
    }

	public Object getPlaceReservations(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

 
}
