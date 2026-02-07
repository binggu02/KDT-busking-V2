package com.team3.busking.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;



import com.team3.busking.domain.Member;


public interface MemberRepository extends JpaRepository<Member, Long> {

    Optional<Member> findByMemberId(String memberId);
    
    // 아이디 찾기 
    Optional<String> findMemberIdByNameAndPhoneAndEmail(String name, String phone, String email);

    // 비밀번호 찾기 메소드 추가 feat.병현
    Optional<String> findpwByNameAndMemberIdAndPhoneAndEmail(String name, String memberId, String phone, String email);
    
    boolean existsByMemberId(String memberId);
}