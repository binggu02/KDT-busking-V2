package com.team3.busking.domain;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "place")
public class Place {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "place_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "city_id", nullable = false)
    private City city;

    @Column(name = "place_name", nullable = false, length = 100)
    private String placeName;

    @Column(name = "place_address", nullable = false, length = 255)
    private String placeAddress;

    @Column(name = "place_phone", length = 50)
    private String placePhone;

    @Column(name = "place_description", columnDefinition = "TEXT")
    private String placeDescription;

    @Column(name = "place_status", nullable = false)
    private Boolean placeStatus = true;

    @Column(name = "thumbnail", length = 255)
    private String thumbnail;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    // ===== 기본 생성자 =====
    public Place() {
    }

    // ===== getter / setter =====

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public String getPlaceAddress() {
        return placeAddress;
    }

    public void setPlaceAddress(String placeAddress) {
        this.placeAddress = placeAddress;
    }

    public String getPlacePhone() {
        return placePhone;
    }

    public void setPlacePhone(String placePhone) {
        this.placePhone = placePhone;
    }

    public String getPlaceDescription() {
        return placeDescription;
    }

    public void setPlaceDescription(String placeDescription) {
        this.placeDescription = placeDescription;
    }

    public Boolean getPlaceStatus() {
        return placeStatus;
    }

    public void setPlaceStatus(Boolean placeStatus) {
        this.placeStatus = placeStatus;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
