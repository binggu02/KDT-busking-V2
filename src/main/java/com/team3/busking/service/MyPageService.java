package com.team3.busking.service;

import com.team3.busking.repository.GearReservationRepository;
import com.team3.busking.repository.PlaceRepository;
import com.team3.busking.repository.PlaceReservationRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class MyPageService {

    private final PlaceReservationRepository reservationRepository;
    private final GearReservationRepository gearReservationRepository;

    public MyPageService(PlaceReservationRepository reservationRepository,
                         GearReservationRepository gearReservationRepository) {
        this.reservationRepository = reservationRepository;
        this.gearReservationRepository = gearReservationRepository;
    }

	public Object getPlaceReservations(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

 
}
