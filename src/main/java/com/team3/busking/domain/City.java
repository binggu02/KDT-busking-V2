package com.team3.busking.domain;

import jakarta.persistence.*;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "city")
public class City {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "city_id")
  private Long id;

  @Column(name = "city_code", nullable = false, unique = true, length = 30)
  private String cityCode;

  @Column(name = "city_name", nullable = false, length = 50)
  private String cityName;

  public City() {}


}