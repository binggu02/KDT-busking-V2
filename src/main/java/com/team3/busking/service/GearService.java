package com.team3.busking.service;

import com.team3.busking.domain.Gear;
import com.team3.busking.repository.GearRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GearService {

    private final GearRepository gearRepository;

    public GearService(GearRepository gearRepository) {
        this.gearRepository = gearRepository;
    }

    public List<Gear> findAll() {
        return gearRepository.findAll();
    }
}
