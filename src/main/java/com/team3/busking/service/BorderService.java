package com.team3.busking.service;


import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.busking.domain.Border;
import com.team3.busking.repository.BorderRepository;

@Service
@Transactional
public class BorderService {
	private final BorderRepository borderRepository;

	public BorderService(BorderRepository borderRepository) {
		this.borderRepository = borderRepository;
	}

	public Optional<Border> findById(String id){
		return borderRepository.findById(id);
	}
}
