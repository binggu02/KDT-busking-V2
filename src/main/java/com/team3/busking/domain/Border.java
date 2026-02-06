package com.team3.busking.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="border") // ERD 보고 테이블명 작성
public class Border {
	@Id
	private String id;
}
