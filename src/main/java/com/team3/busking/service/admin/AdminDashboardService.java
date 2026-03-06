package com.team3.busking.service.admin;

import com.team3.busking.domain.Board;

import com.team3.busking.domain.GearReservation;
import com.team3.busking.domain.Member;
import com.team3.busking.domain.PlaceReservation;
import com.team3.busking.repository.BoardRepository;
import com.team3.busking.repository.GearReservationRepository;
import com.team3.busking.repository.MemberRepository;
import com.team3.busking.repository.PlaceReservationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AdminDashboardService {

    private final BoardRepository boardRepository;
    private final PlaceReservationRepository reservationRepository;      // PlaceReservation repo
    private final GearReservationRepository gearReservationRepository;
    private final MemberRepository memberRepository;

    // ✅ 카운트
    public long memberCount() {
        return memberRepository.count();
    }

    public long placeReservationCount() {
        return reservationRepository.count();
    }

    public long gearReservationCount() {
        return gearReservationRepository.count();
    }

    public long boardCount() {
        return boardRepository.count();
    }

    // ✅ 최근 리스트 (repo에 있는 fetch join 메서드 활용 후 5개만 자르기)
    public List<PlaceReservation> recentPlaceReservations(int size) {
        List<PlaceReservation> all = reservationRepository.findAllWithPlace(); // place까지 fetch join
        return all.subList(0, Math.min(size, all.size()));
    }
    
    
    // ✅ 최근 리스트 (repo에 있는 fetch join 메서드 활용 후 5개만 자르기)
    public List<PlaceReservation> recentPlaceReservations() {
        List<PlaceReservation> all = reservationRepository.findAllWithPlace(); // place까지 fetch join
        return all;
    }

    public List<GearReservation> recentGearReservations(int size) {
        List<GearReservation> all = gearReservationRepository.findAllWithGearAndMember(); // gear/member fetch join
        return all.subList(0, Math.min(size, all.size()));
    }
    
    public List<GearReservation> recentGearReservations() {
        List<GearReservation> all = gearReservationRepository.findAllWithGearAndMember(); // gear/member fetch join
        return all;
    }

    public List<Member> recentMembers(int size) {
        // Member는 fetch join 필요 없고(roles 안 씀), 최근 5명 메서드로 충분
        // size를 고정 5로 쓰고 싶으면 그대로 사용해도 됨
        if (size == 5) return memberRepository.findTop5ByOrderByIdDesc();
        List<Member> all = memberRepository.findAll();
        // all은 정렬이 보장되지 않아서, 가능하면 size=5만 쓰는 걸 추천
        return memberRepository.findTop5ByOrderByIdDesc();
    }
    
    public List<Member> recentMembers() {
        // Member는 fetch join 필요 없고(roles 안 씀), 최근 5명 메서드로 충분
        // size를 고정 5로 쓰고 싶으면 그대로 사용해도 됨
        List<Member> all = memberRepository.findAll();
        // all은 정렬이 보장되지 않아서, 가능하면 size=5만 쓰는 걸 추천
        return all;
    }

    public List<Board> recentBoards(int size) {
        // BoardRepository에 "최근 N개" 메서드가 없어서 findAll 후 잘라냄.
        // (가능하면 findTop5ByOrderByBoardIdDesc 같은 메서드 추가 추천)
        List<Board> all = boardRepository.findAll();
        // 정렬 보장 X → 아래 개선 메서드(권장)를 추가하는 게 가장 안전
        return all.subList(0, Math.min(size, all.size()));
    }
    
    public List<Board> recentBoards() {
        // BoardRepository에 "최근 N개" 메서드가 없어서 findAll 후 잘라냄.
        // (가능하면 findTop5ByOrderByBoardIdDesc 같은 메서드 추가 추천)
        List<Board> all = boardRepository.findAll();
        // 정렬 보장 X → 아래 개선 메서드(권장)를 추가하는 게 가장 안전
        return all;
    }
}
