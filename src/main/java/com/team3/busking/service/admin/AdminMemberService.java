package com.team3.busking.service.admin;

import com.team3.busking.domain.Member;
import com.team3.busking.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminMemberService {

    private final MemberRepository memberRepository;

    @Transactional(readOnly = true)
    public java.util.List<Member> findAll() {
        return memberRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Member findById(Long id) {
        return memberRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("회원이 존재하지 않습니다. id=" + id));
    }

    public void updateMemberAll(
            Long id,
            String pw,
            String name,
            String nickname,
            String email,
            String phone,
            LocalDate birthDate,
            String gender
    ) {
        Member member = findById(id);

        // 비밀번호: 빈 값이면 변경 안함 (원하면 무조건 변경으로 바꿔도 됨)
        if (pw != null && !pw.isBlank()) {
            member.setPw(pw); // 🔥 프로젝트에 PasswordEncoder 있으면 여기서 인코딩해야 함
        }

        member.setName(name);
        member.setNickname(nickname);
        member.setEmail(email);
        member.setPhone(phone);
        member.setBirthDate(birthDate);

        // gender: "M" or "F" or null
        if (gender == null || gender.isBlank()) {
            member.setGender(null);
        } else {
            member.setGender(gender.trim().toUpperCase());
        }
    }

    public void deleteMember(Long id) {
        if (!memberRepository.existsById(id)) {
            throw new IllegalArgumentException("회원이 존재하지 않습니다. id=" + id);
        }
        memberRepository.deleteById(id);
    }
}
