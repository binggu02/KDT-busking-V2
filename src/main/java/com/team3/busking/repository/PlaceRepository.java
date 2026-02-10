package com.team3.busking.repository;

import com.team3.busking.domain.Place;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PlaceRepository extends JpaRepository<Place, Long> {

  // cityCode로 장소 리스트
  List<Place> findByCity_CityCodeAndPlaceStatusTrueOrderByIdDesc(String cityCode);

  // cityId로도 쓰고 싶으면
  List<Place> findByCity_IdAndPlaceStatusTrueOrderByIdDesc(Long cityId);
}
