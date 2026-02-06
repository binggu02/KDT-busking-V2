package com.team3.busking.repository;

import org.springframework.data.jpa.repository.JpaRepository;



import com.team3.busking.domain.Member;


public interface MemberRepository extends JpaRepository<Member, Long> {

    Member findByMemberId(String memberId);

    boolean existsByMemberId(String memberId);
}