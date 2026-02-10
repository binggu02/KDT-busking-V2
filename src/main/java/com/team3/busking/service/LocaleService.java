package com.team3.busking.service;

import com.team3.busking.domain.City;
import com.team3.busking.domain.Place;
import com.team3.busking.domain.PlaceReservation;
import com.team3.busking.repository.CityRepository;
import com.team3.busking.repository.PlaceRepository;
import com.team3.busking.repository.ReservationRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalTime;
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
		return placeRepository.findByCity_CityCodeOrderByIdDesc(cityCode);
	}

	public Place getPlace(Long placeId) {
		return placeRepository.findById(placeId)
				.orElseThrow(() -> new IllegalArgumentException("존재하지 않는 장소: " + placeId));
	}

	@Transactional
	public Long createReservation(Long userId, Long placeId, String bandName, int bandCount, String phone, String email,
			String reservationDate, // "YYYY-MM-DD"
			String startTime // "HH:mm"
	) {
		if (userId == null)
			throw new IllegalStateException("로그인이 필요합니다.");
		if (bandName == null || bandName.isBlank())
			throw new IllegalArgumentException("밴드명은 필수");
		if (bandCount < 1)
			throw new IllegalArgumentException("인원은 1 이상");
		if (reservationDate == null || reservationDate.isBlank())
			throw new IllegalArgumentException("날짜 필수");
		if (startTime == null || startTime.isBlank())
			throw new IllegalArgumentException("시간 필수");

		Place place = getPlace(placeId);

		LocalDate date = LocalDate.parse(reservationDate);
		LocalTime time = LocalTime.parse(startTime);

		if (reservationRepository.existsByPlace_IdAndReservationDateAndStartTime(placeId, date, time)) {
			throw new IllegalStateException("이미 예약된 시간입니다.");
		}

		PlaceReservation r = new PlaceReservation();
		r.setUserId(userId);
		r.setPlace(place);
		r.setBandName(bandName);
		r.setBandCount(bandCount);
		r.setPhone(phone);
		r.setEmail(email);
		r.setReservationDate(date);
		r.setStartTime(time);
		r.setEndTime(null);
		r.setStatus(true);

		return reservationRepository.save(r).getId();
	}

	public PlaceReservation getReservation(Long reservationId) {
		return reservationRepository.findById(reservationId)
				.orElseThrow(() -> new IllegalArgumentException("예약 정보 없음: " + reservationId));
	}
}
