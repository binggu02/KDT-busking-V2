package com.team3.busking.service;

import com.team3.busking.domain.Gear;

import com.team3.busking.domain.GearReservation;
import com.team3.busking.domain.Member;
import com.team3.busking.repository.GearRepository;
import com.team3.busking.repository.GearReservationRepository;
import com.team3.busking.repository.MemberRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDateTime;

@Service
@Transactional
public class GearReservationService {

    private final GearReservationRepository reservationRepository;
    private final GearRepository gearRepository;
    private final MemberRepository memberRepository;

    public GearReservationService(
            GearReservationRepository reservationRepository,
            GearRepository gearRepository,
            MemberRepository memberRepository
    ) {
        this.reservationRepository = reservationRepository;
        this.gearRepository = gearRepository;
        this.memberRepository = memberRepository;
    }





    // 에러로 인한 주석처리 feat. 병현
    @Transactional
    public void reserve(
            Long gearId,
            Long Id,
            LocalDateTime start,
            LocalDateTime end
    ) {
        if (!start.isBefore(end)) {
            throw new IllegalArgumentException("종료 시간은 시작 시간 이후여야 합니다.");
        }

        if (start.isBefore(LocalDateTime.now())) {
            throw new IllegalArgumentException("과거 시간은 예약할 수 없습니다.");
        }

        // 예약 확인 메소드인데 무슨 로직인지 이해 못함 feat.병현
        long overlap = gearRepository.countOverlap(gearId, start, end);
        if (overlap > 0) {
            throw new IllegalStateException("이미 해당 시간에 예약된 장비입니다.");
        }

        Gear gear = gearRepository.findByGearId(gearId)
                .orElseThrow(() -> new IllegalArgumentException("장비가 존재하지 않습니다."));

        Member member = memberRepository.findById(Id)
                .orElseThrow(() -> new IllegalArgumentException("회원이 존재하지 않습니다."));

        GearReservation reservation = new GearReservation();
        reservation.setGear(gear);
        reservation.setMember(member);
        reservation.setStartDatetime(start);
        reservation.setEndDatetime(end);
        reservation.setStatus("RESERVED");
        // 현재 에러 나는 이유가 gearId 값이 없어서 에러남 set
        reservationRepository.save(reservation);
    }
}
