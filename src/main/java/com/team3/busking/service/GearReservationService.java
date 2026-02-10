package com.team3.busking.service;

import com.team3.busking.domain.*;
import com.team3.busking.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class GearReservationService {

    private final GearRepository gearRepository;
    private final MemberRepository memberRepository;
    private final GearReservationRepository gearReservationRepository;

    @Transactional
    public void reserve(Long gearId, Long memberId, LocalDateTime start, LocalDateTime end) {
    	
    	if (start == null || end == null) {
            throw new IllegalStateException("예약 시작/종료 시간을 입력해주세요.");
        }
        if (!end.isAfter(start)) { // end <= start 전부 막음 (전날 포함)
            throw new IllegalStateException("종료 시간은 시작 시간보다 이후여야 합니다.");
        }
    	
        Gear gear = gearRepository.findByIdForUpdate(gearId)
                .orElseThrow(() -> new IllegalArgumentException("장비가 존재하지 않습니다."));

        if (gear.getGearQuantity() < 1) {
            throw new IllegalStateException("장비 수량이 부족합니다.");
        }

        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new IllegalArgumentException("회원이 존재하지 않습니다."));

        GearReservation r = new GearReservation();
        r.setGear(gear);
        r.setMember(member);
        r.setStartDatetime(start);
        r.setEndDatetime(end);
        r.setStatus("RESERVED");

        gearReservationRepository.save(r);

        // 수량 차감
        gear.setGearQuantity(gear.getGearQuantity() - 1);
        // save 안 해도 트랜잭션 종료 시 업데이트됨 (dirty checking)
        
       
    }
    @Transactional(readOnly = true)
    public List<GearReservation> findMyGearReservations(Long memberId) {
        return gearReservationRepository.findByMember_IdOrderByIdDesc(memberId);
    }
}
    

