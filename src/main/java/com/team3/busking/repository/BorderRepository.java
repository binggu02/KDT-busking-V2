package com.team3.busking.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.team3.busking.domain.Border;



@Repository
public interface BorderRepository extends JpaRepository<Border, String>{
	@Override
	Optional<Border> findById(String id);
}
