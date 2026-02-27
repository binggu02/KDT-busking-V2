package com.team3.busking.repository;

import com.team3.busking.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {

    // 기존: 아이디로 회원 조회 (로그인/조회 등에 사용)
    Optional<Member> findByMemberId(String memberId);

    // ✅ 추가: 로그인 시 roles까지 같이 가져오기 (관리자 판별용)
    @Query("""
        select distinct m
        from Member m
        left join fetch m.roles mr
        left join fetch mr.role r
        where m.memberId = :memberId
          and m.pw = :pw
    """)
    Optional<Member> loginWithRoles(@Param("memberId") String memberId,
                                    @Param("pw") String pw);

    // 아이디 찾기
    Optional<String> findMemberIdByNameAndPhoneAndEmail(String name, String phone, String email);

    // 비밀번호 찾기
    Optional<String> findByNameAndMemberIdAndPhoneAndEmail(String name, String memberId, String phone, String email);

    // 중복 체크
    boolean existsByMemberId(String memberId);
    
    List<Member> findTop5ByOrderByIdDesc();

	boolean existsByEmail(String email);
	
	Optional<Member> findById(Long id);
    
}
