package com.team3.busking.service;

import com.team3.busking.domain.*;
import com.team3.busking.domain.GearReservation.GearReservationStatus;
import com.team3.busking.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class GearReservationService {

    private final GearRepository gearRepository;
    private final MemberRepository memberRepository;
    private final GearReservationRepository gearReservationRepository;

    @Transactional
    public void reserve(Long gearId, Long memberId,
                        LocalDateTime start, LocalDateTime end) {

        // 1️⃣ 시간 검증
        if (start == null || end == null) {
            throw new IllegalArgumentException("예약 시작/종료 시간을 입력해주세요.");
        }

        if (!end.isAfter(start)) {
            throw new IllegalArgumentException("종료 시간은 시작 시간보다 이후여야 합니다.");
        }

        // 2️⃣ 장비 조회
        Gear gear = gearRepository.findById(gearId)
                .orElseThrow(() -> new IllegalArgumentException("장비가 존재하지 않습니다."));

        // 3️⃣ 수량 체크
        if (gear.getGearQuantity() < 1) {
            throw new IllegalArgumentException("장비 수량이 부족합니다.");
        }

        // 4️⃣ 시간 겹침 체크 (RESERVED 상태만)
        boolean exists =
                gearReservationRepository
                        .existsByGear_IdAndStatusAndStartDatetimeLessThanAndEndDatetimeGreaterThan(
                                gearId,
                                GearReservationStatus.RESERVED,
                                end,
                                start
                        );

        if (exists) {
            throw new IllegalArgumentException("이미 예약된 시간대입니다.");
        }

        // 5️⃣ 회원 조회
        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new IllegalArgumentException("회원이 존재하지 않습니다."));

        // 6️⃣ 예약 생성
        GearReservation reservation = new GearReservation();
        reservation.setGear(gear);
        reservation.setMember(member);
        reservation.setStartDatetime(start);
        reservation.setEndDatetime(end);
        reservation.setStatus(GearReservationStatus.RESERVED);

        gearReservationRepository.save(reservation);

        // 7️⃣ 수량 차감 (dirty checking)
        gear.setGearQuantity(gear.getGearQuantity() - 1);
    }

    
    
    @Transactional(readOnly = true)
    public List<GearReservation> findMyGearReservations(Long memberId) {
        return gearReservationRepository.findByMember_IdOrderByIdDesc(memberId);
    }
    
    @Transactional
    public void deleteReserve(Long id) {
    	gearReservationRepository.deleteById(id);
    }
    
    @Transactional
    public void returnStatus(Long id) {
    	GearReservation gr = gearReservationRepository.findById(id)
    			.orElseThrow(() -> new IllegalArgumentException("예약이 존재하지 않습니다."));
    	
    	gr.setStatus(GearReservationStatus.RETURNED);
    	
    }
    
}
    

