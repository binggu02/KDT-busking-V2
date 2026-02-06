package com.team3.busking.domain;

import jakarta.persistence.*;

@Entity
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

  public Long getId() {
    return id;
  }
  public void setId(Long id) {
    this.id = id;
  }

  public String getCityCode() {
    return cityCode;
  }
  public void setCityCode(String cityCode) {
    this.cityCode = cityCode;
  }

  public String getCityName() {
    return cityName;
  }
  public void setCityName(String cityName) {
    this.cityName = cityName;
  }
}