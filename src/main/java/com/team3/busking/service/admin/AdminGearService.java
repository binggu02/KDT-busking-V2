package com.team3.busking.service.admin;

import com.team3.busking.domain.Gear;
import com.team3.busking.repository.GearRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminGearService {

    private final GearRepository gearRepository;

    @Transactional(readOnly = true)
    public List<Gear> findAllGears() {
        return gearRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Gear getGear(Long id) {
        return gearRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("장비가 존재하지 않습니다. id=" + id));
    }

    public void updateGear(Long id,
                           int gearQuantity,
                           String gearName,
                           String gearDescription,
                           int gearPrice,
                           String gearThumbnail) {

        Gear gear = getGear(id);

        gear.setGearQuantity(gearQuantity);
        gear.setGearName(gearName);
        gear.setGearDescription(gearDescription);
        gear.setGearPrice(gearPrice);
        gear.setGearThumbnail(gearThumbnail);
        // JPA dirty checking
    }
    
    @Transactional
	public void deleteGear(Long id) {
		// TODO Auto-generated method stub
    	gearRepository.deleteById(id);
	}
    
    @Transactional
	public void createGear(String gearName, Integer gearQuantity, String gearDescription, Integer gearPrice,
			String gearThumbnail) {
		// TODO Auto-generated method stub
    	Gear gear = new Gear();
    	gear.setGearName(gearName);
        gear.setGearQuantity(gearQuantity);
        gear.setGearDescription(gearDescription);
        gear.setGearPrice(gearPrice);
        gear.setGearThumbnail(gearThumbnail);
		
        gearRepository.save(gear);
	}
}
