package com.team3.busking.service.admin;

import com.team3.busking.domain.PlaceReservation;
import com.team3.busking.repository.ReservationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminLocaleReservationService {

    private final ReservationRepository reservationRepository;

    @Transactional(readOnly = true)
    public List<PlaceReservation> findAll() {
        return reservationRepository.findAllWithPlace();
    }

    public void deleteById(Long id) {
        if (!reservationRepository.existsById(id)) {
            throw new IllegalArgumentException("삭제할 예약이 없습니다. id=" + id);
        }
        reservationRepository.deleteById(id);
    }
}
