package com.team3.busking.domain;


import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="locale") // ERD 보고 테이블명 작성
public class Locale {
	@Id
	private String id;
}
