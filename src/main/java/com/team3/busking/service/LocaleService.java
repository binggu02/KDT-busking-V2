package com.team3.busking.service;

import com.team3.busking.domain.City;
import com.team3.busking.domain.Place;
import com.team3.busking.domain.Reservation;
import com.team3.busking.repository.CityRepository;
import com.team3.busking.repository.PlaceRepository;
import com.team3.busking.repository.ReservationRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class LocaleService {

    private final CityRepository cityRepository;
    private final PlaceRepository placeRepository;
    private final ReservationRepository reservationRepository; // ✅ 추가

    public LocaleService(CityRepository cityRepository,
                         PlaceRepository placeRepository,
                         ReservationRepository reservationRepository) { // ✅ 생성자에 추가
        this.cityRepository = cityRepository;
        this.placeRepository = placeRepository;
        this.reservationRepository = reservationRepository;
    }

    public List<City> getCities() {
        return cityRepository.findAll();
    }

    public List<Place> getPlacesByCityCode(String cityCode) {
        return placeRepository.findByCity_CityCodeAndPlaceStatusTrueOrderByIdDesc(cityCode);
    }

    // ✅ 장소 단건 조회
    public Place getPlace(Long placeId) {
        return placeRepository.findById(placeId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 장소입니다."));
    }

    // ✅ 내 장소 예약 내역 조회 (마이페이지용)
    public List<Reservation> findMyReservations(Long memberId) {
        return reservationRepository.findByUserIdOrderByReservationDateDescStartTimeDesc(memberId);
    }
}
