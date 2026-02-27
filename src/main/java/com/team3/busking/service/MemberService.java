package com.team3.busking.service;

import com.team3.busking.domain.Member;
import com.team3.busking.repository.MemberRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional // 서비스 계층에 트랜잭션 처리를 적용합니다.
public class MemberService {

    private final MemberRepository memberRepository;

   
    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    // 1. 회원 가입
    public String register(Member member) {

        if (member.getMemberId() == null || member.getMemberId().isBlank()) {
            throw new IllegalArgumentException("아이디는 필수입니다.");
        }

        if (member.getName() == null || member.getName().isBlank()) {
            throw new IllegalArgumentException("이름은 필수입니다.");
        }

        validateDuplicateMember(member);
        memberRepository.save(member);

        return member.getMemberId();
    }
    
    // ================= 로그인 =================
    public Member login(String memberId, String pw) {

        Member member = memberRepository.findByMemberId(memberId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 ID입니다."));

        if (!member.getPw().equals(pw)) {
            throw new IllegalStateException("비밀번호를 잘못 입력하셨습니다.");
        }

        return member;
    }


    // ID 중복 검사 로직
    private void validateDuplicateMember(Member member) {
        if (memberRepository.existsByMemberId(member.getMemberId())) {
            throw new IllegalStateException("이미 존재하는 회원 ID입니다.");
        }
        
        
        if (member.getEmail() != null && !member.getEmail().isBlank()) {
            if (memberRepository.existsByEmail(member.getEmail())) {
                throw new IllegalStateException("이미 사용중인 이메일입니다.");
            }
        }
        
    }

    // 2. Read All - 전체 회원 목록 조회
    @Transactional(readOnly = true) // 읽기 전용으로 성능 최적화
    public List<Member> findAllMembers() {
        return memberRepository.findAll();
    }

    // 3. 특정 ID 회원 조회 (수정/상세 보기 시 필요)
    @Transactional(readOnly = true)
    public Member getMemberById(String id) {
        return memberRepository.findByMemberId(id).orElseThrow(() -> new IllegalArgumentException("유효하지 않은 회원 ID입니다. " + id));
    }

    // 4. 회원 정보 수정 (ID가 있으면 Update)
    @Transactional
    public void updateMember(Member member) {
        // JpaRepository의 save() 메서드는 ID가 존재하면 업데이트를 수행합니다.
        memberRepository.save(member);
    }
    
 // PK(Long)로 회원 조회
    public Member findById(Long id) {
        return memberRepository.findById(id)
                .orElse(null);
    }


    // 5. 회원 정보 삭제
    @Transactional
    public void deleteMember(Long id) {
        memberRepository.deleteById(id);
    }
    
   

	public Member getMemberById(Long userId) {
		// TODO Auto-generated method stub
		return null;
	}
    
	// ✅ 아이디 찾기 (DB 조회)
    @Transactional(readOnly = true)
    public String findMemberId(String name, String phone, String email) {
        return memberRepository.findMemberIdByNamePhoneEmail(name, phone, email)
                .orElseThrow(() -> new IllegalArgumentException("일치하는 회원이 없습니다."));
    }

    // ✅ 비밀번호 찾기 = 임시 비밀번호 발급 후 DB 업데이트
    public String resetPasswordToTemp(String memberId, String name, String phone, String email) {

        Member member = memberRepository
                .findByMemberIdAndNameAndPhoneAndEmail(memberId, name, phone, email)
                .orElseThrow(() -> new IllegalArgumentException("일치하는 회원이 없습니다."));

        String tempPw = generateTempPassword(8);

        // ⚠️ 지금 로그인 로직이 pw.equals 비교라서 "그대로 저장"해야 바로 로그인됨
        member.setPw(tempPw);
        memberRepository.save(member);

        return tempPw;
    }

    private String generateTempPassword(int length) {
        String chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int idx = (int)(Math.random() * chars.length());
            sb.append(chars.charAt(idx));
        }
        return sb.toString();
    }


    
}




//@Service
//@Transactional // JPA의 모든 데이터 변경은 트랜잭션 내에서 실행되어야 합니다.
//public class MemberService {
//
//    private MemberRepository memberRepository = null;
//
//    // 의존성 주입 (DI)
//    public MemberService(MemberRepository memberRepository) {
//        this.memberRepository = memberRepository;
//    }
//
//    /**
//     * 모든 회원 목록을 조회합니다.
//     */
//    @Transactional(readOnly = true) // 조회 시 성능 최적화
//    public List<Member> findAllMembers() {
//        return memberRepository.findAll();
//    }
//
//    /**
//     * 특정 ID의 회원을 조회합니다.
//     */
//    @Transactional(readOnly = true)
//    public Optional<Member> findMemberById(String id) {
//        return memberRepository.findById(id);
//    }
//    
//    /**
//     * 회원을 저장(등록)합니다.
//     */
//    public Member registerMember(Member member) {
//        // 실제 구현에서는 ID 중복 체크와 비밀번호 암호화 로직이 필요합니다.
//        // 여기서는 간단하게 저장만 진행합니다.
//        return memberRepository.save(member);
//    }
//}