package com.team3.busking.repository;

import java.util.Optional;

import org.springframework.stereotype.Repository;

import com.team3.busking.domain.Locale;

@Repository
public interface LocaleRepository {
	// 아이디로 찾기
		Optional<Locale> findById(String id);

}
