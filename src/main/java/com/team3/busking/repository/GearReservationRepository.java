package com.team3.busking.repository;

import com.team3.busking.domain.Gear;

import org.springframework.data.jpa.repository.JpaRepository;

public interface GearReservationRepository extends JpaRepository<Gear, Long> {
}
