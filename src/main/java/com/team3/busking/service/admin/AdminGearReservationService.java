package com.team3.busking.service.admin;

import com.team3.busking.domain.GearReservation;
import com.team3.busking.repository.GearReservationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminGearReservationService {

    private final GearReservationRepository gearReservationRepository;

    @Transactional(readOnly = true)
    public List<GearReservation> findAll() {
        return gearReservationRepository.findAllWithGearAndMember();
    }

    public void deleteById(Long id) {
        gearReservationRepository.deleteById(id);
    }
}
