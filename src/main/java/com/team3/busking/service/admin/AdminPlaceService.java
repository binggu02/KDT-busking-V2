package com.team3.busking.service.admin;

import com.team3.busking.domain.City;
import com.team3.busking.domain.Place;
import com.team3.busking.repository.CityRepository;
import com.team3.busking.repository.PlaceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminPlaceService {

    private final PlaceRepository placeRepository;
    private final CityRepository cityRepository;

    @Transactional(readOnly = true)
    public List<Place> findAllPlaces() {
        return placeRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Place getPlace(Long id) {
        return placeRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("장소가 존재하지 않습니다. id=" + id));
    }

    public void updatePlace(
            Long id,
            Long cityId,
            String placeName,
            String placeAddress,
            String placePhone,
            String placeDescription,
            String thumbnail
    ) {
        Place place = getPlace(id);

        // cityId가 넘어오면 도시 변경
        if (cityId != null) {
            City city = cityRepository.findById(cityId)
                    .orElseThrow(() -> new IllegalArgumentException("도시가 존재하지 않습니다. id=" + cityId));
            place.setCity(city);
        }

        place.setPlaceName(placeName);
        place.setPlaceAddress(placeAddress);
        place.setPlacePhone(placePhone);
        place.setPlaceDescription(placeDescription);
        place.setThumbnail(thumbnail);

        // 더티체킹으로 반영되지만 명시 저장해도 OK
        placeRepository.save(place);
    }

    @Transactional
	public void createPlace(Long cityId, String placeName, String placeAddress, String placePhone,
			String placeDescription, String thumbnail) {
		// TODO Auto-generated method stub
    	
    	Place place = new Place();
    	
    	if (cityId != null) {
            City city = cityRepository.findById(cityId)
                    .orElseThrow(() -> new IllegalArgumentException("도시가 존재하지 않습니다."));
            place.setCity(city);
        }

        place.setPlaceName(placeName);
        place.setPlaceAddress(placeAddress);
        place.setPlacePhone(placePhone);
        place.setPlaceDescription(placeDescription);
        place.setThumbnail(thumbnail);

        placeRepository.save(place);
    	
		
	}

    @Transactional
	public void deletePlace(Long id) {
		// TODO Auto-generated method stub
    	placeRepository.deleteById(id);
		
	}
}
