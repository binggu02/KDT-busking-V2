package com.team3.busking.service;

import com.team3.busking.domain.Gear;
import com.team3.busking.repository.GearRepository;

import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class GearService {

    private final GearRepository gearRepository;

    public List<Gear> findAll() {
        return gearRepository.findAll();
    }

    public Gear findById(Long id) {
        return gearRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("장비가 존재하지 않습니다."));
    }
}