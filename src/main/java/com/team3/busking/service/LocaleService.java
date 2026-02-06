package com.team3.busking.service;

import java.util.Optional;

import com.team3.busking.domain.Locale;
import com.team3.busking.repository.LocaleRepository;

public class LocaleService {

	private final LocaleRepository localeRepository;

	public LocaleService(LocaleRepository localeRepository) {
		this.localeRepository = localeRepository;
	}

	public Optional<Locale> findById(String id){
		return localeRepository.findById(id);
	}
}
