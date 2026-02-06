package com.team3.busking.repository;

import java.util.Optional;

import org.springframework.stereotype.Repository;

import com.team3.busking.domain.City;



@Repository
public interface LocaleRepository extends CityRepository{
	// 아이디로 찾기
		Optional<City> findById(String id);

}
