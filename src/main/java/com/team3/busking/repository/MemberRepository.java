package com.team3.busking.repository;

import com.team3.busking.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {

    Optional<Member> findByMemberId(String memberId);

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

    // ✅ ID 찾기: member_id만 반환
    @Query("""
        select m.memberId
        from Member m
        where m.name = :name
          and m.phone = :phone
          and m.email = :email
    """)
    Optional<String> findMemberIdByNamePhoneEmail(@Param("name") String name,
                                                 @Param("phone") String phone,
                                                 @Param("email") String email);

    // ✅ PW 찾기: 회원이 맞는지만 확인 (Member 반환)
    Optional<Member> findByMemberIdAndNameAndPhoneAndEmail(String memberId,
                                                          String name,
                                                          String phone,
                                                          String email);

    boolean existsByMemberId(String memberId);
    boolean existsByEmail(String email);

    List<Member> findTop5ByOrderByIdDesc();
}