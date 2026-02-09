package com.team3.busking.domain;

import jakarta.persistence.*;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter 
@Setter
@Table(name = "gear")
public class Gear {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "gear_id")
    private Long gearId;

    @Column(name = "place_id")
    private Long placeId;

    @Column(name = "gear_name", nullable = false)
    private String gearName;

    @Column(name = "gear_description", columnDefinition = "TEXT")
    private String gearDescription;

    @Column(name = "gear_price", nullable = false)
    private int gearPrice;

    @Column(name = "gear_thumbnail")
    private String gearThumbnail;

    @Column(name = "created_at", insertable = false, updatable = false)
    private LocalDateTime createdAt;

    /* ===== getter / setter ===== */

//    public Long getGearId() { return gearId; }
//    public void setGearId(Long gearId) { this.gearId = gearId; }
//
//    public Long getPlaceId() { return placeId; }
//    public void setPlaceId(Long placeId) { this.placeId = placeId; }
//
//    public String getGearName() { return gearName; }
//    public void setGearName(String gearName) { this.gearName = gearName; }
//
//    public String getGearDescription() { return gearDescription; }
//    public void setGearDescription(String gearDescription) { this.gearDescription = gearDescription; }
//
//    public int getGearPrice() { return gearPrice; }
//    public void setGearPrice(int gearPrice) { this.gearPrice = gearPrice; }
//
//    public String getGearThumbnail() { return gearThumbnail; }
//    public void setGearThumbnail(String gearThumbnail) { this.gearThumbnail = gearThumbnail; }
//
//    public LocalDateTime getCreatedAt() { return createdAt; }
}
