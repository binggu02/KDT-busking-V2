package com.team3.busking.repository;

import com.team3.busking.domain.Place;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PlaceRepository extends JpaRepository<Place, Long> {

    // 지역 코드로 "사용가능한 장소" 최신순
    List<Place> findByCity_CityCodeAndPlaceStatusTrueOrderByIdDesc(String cityCode);
}
