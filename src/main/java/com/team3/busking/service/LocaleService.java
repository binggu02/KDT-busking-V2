package com.team3.busking.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.team3.busking.domain.City;
import com.team3.busking.domain.Place;
import com.team3.busking.domain.PlaceReservation;
import com.team3.busking.repository.CityRepository;
import com.team3.busking.repository.PlaceRepository;
import com.team3.busking.repository.ReservationRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class LocaleService {

    private final CityRepository cityRepository;
    private final PlaceRepository placeRepository;
    private final ReservationRepository reservationRepository;

    public LocaleService(CityRepository cityRepository, PlaceRepository placeRepository,
                         ReservationRepository reservationRepository) {
        this.cityRepository = cityRepository;
        this.placeRepository = placeRepository;
        this.reservationRepository = reservationRepository;
    }

    // -------------------------
    // 도시/장소 조회
    // -------------------------
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

    // -------------------------
    // 예약 생성
    // -------------------------
    @Transactional
    public Long createReservation(
            Long userId,
            Long placeId,
            String bandName,
            int bandCount,
            String phone,
            String email,
            String reservationDate, // "YYYY-MM-DD"
            String startTimeStr    // "HH:mm"
    ) {
        if (userId == null)
            throw new IllegalStateException("로그인이 필요합니다.");
        if (bandName == null || bandName.isBlank())
            throw new IllegalArgumentException("밴드명은 필수입니다.");
        if (bandCount < 1)
            throw new IllegalArgumentException("인원은 1 이상이어야 합니다.");
        if (reservationDate == null || reservationDate.isBlank())
            throw new IllegalArgumentException("예약 날짜는 필수입니다.");
        if (startTimeStr == null || startTimeStr.isBlank())
            throw new IllegalArgumentException("예약 시간은 필수입니다.");

        Place place = getPlace(placeId);
        LocalDate date = LocalDate.parse(reservationDate);
        LocalTime startTime = LocalTime.parse(startTimeStr);
        LocalTime endTime = startTime.plusHours(1); // 기본 1시간 예약 기준

        // ✅ 시간 겹침 체크
        boolean exists = reservationRepository.existsByPlaceAndOverlappingTime(
                placeId, date, startTime, endTime
        );
        if (exists) {
            throw new IllegalStateException("이미 예약된 시간입니다. 다른 시간을 선택해주세요.");
        }

        PlaceReservation reservation = new PlaceReservation();
        reservation.setUserId(userId);
        reservation.setPlace(place);
        reservation.setBandName(bandName);
        reservation.setBandCount(bandCount);
        reservation.setPhone(phone);
        reservation.setEmail(email);
        reservation.setReservationDate(date);
        reservation.setStartTime(startTime);
        reservation.setEndTime(endTime);
        reservation.setStatus(true); // 예약 상태: true

        return reservationRepository.save(reservation).getId();
    }

    // -------------------------
    // 예약 조회
    // -------------------------
    public PlaceReservation getReservation(Long reservationId) {
        return reservationRepository.findById(reservationId)
                .orElseThrow(() -> new IllegalArgumentException("예약 정보 없음: " + reservationId));
    }

    // ✅ 내 예약 내역 (마이페이지)
    public List<PlaceReservation> findMyReservations(Long userId) {
        return reservationRepository.findByUserIdOrderByReservationDateDescStartTimeDesc(userId);
    }
    
    @Transactional
    public void cancelReservation(Long reservationId, Long userId) {
        PlaceReservation reservation = reservationRepository.findById(reservationId)
                .orElseThrow(() -> new IllegalArgumentException("예약 정보가 존재하지 않습니다."));

        if (!reservation.getUserId().equals(userId)) {
            throw new IllegalStateException("본인의 예약만 취소할 수 있습니다.");
        }

        if (!reservation.getStatus()) { // 이미 취소된 상태면
            throw new IllegalStateException("이미 취소된 예약입니다.");
        }

        reservation.setStatus(false); // 취소 처리 (status = 0 / false)
        // @Transactional이므로 DB에 자동 반영됨
    }
}