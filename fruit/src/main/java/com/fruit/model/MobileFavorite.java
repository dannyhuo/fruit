package com.fruit.model;

import java.math.BigDecimal;
import java.util.Date;

public class MobileFavorite {
    private BigDecimal id;

    private Long objectId;

    private String objectType;

    private Date createdTime;

    private String objectImageUrl;

    private String objectName;

    private String isValid;

    private Long userId;

    private String dataFrom;

    private String bak2;

    private String currentVersion;

    private BigDecimal snapshotSellPrice;

    private BigDecimal marketSellPrice;

    private String branchtype;

    private Long originId;

    private Short collectionFrom;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public Long getObjectId() {
        return objectId;
    }

    public void setObjectId(Long objectId) {
        this.objectId = objectId;
    }

    public String getObjectType() {
        return objectType;
    }

    public void setObjectType(String objectType) {
        this.objectType = objectType == null ? null : objectType.trim();
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getObjectImageUrl() {
        return objectImageUrl;
    }

    public void setObjectImageUrl(String objectImageUrl) {
        this.objectImageUrl = objectImageUrl == null ? null : objectImageUrl.trim();
    }

    public String getObjectName() {
        return objectName;
    }

    public void setObjectName(String objectName) {
        this.objectName = objectName == null ? null : objectName.trim();
    }

    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid == null ? null : isValid.trim();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getDataFrom() {
        return dataFrom;
    }

    public void setDataFrom(String dataFrom) {
        this.dataFrom = dataFrom == null ? null : dataFrom.trim();
    }

    public String getBak2() {
        return bak2;
    }

    public void setBak2(String bak2) {
        this.bak2 = bak2 == null ? null : bak2.trim();
    }

    public String getCurrentVersion() {
        return currentVersion;
    }

    public void setCurrentVersion(String currentVersion) {
        this.currentVersion = currentVersion == null ? null : currentVersion.trim();
    }

    public BigDecimal getSnapshotSellPrice() {
        return snapshotSellPrice;
    }

    public void setSnapshotSellPrice(BigDecimal snapshotSellPrice) {
        this.snapshotSellPrice = snapshotSellPrice;
    }

    public BigDecimal getMarketSellPrice() {
        return marketSellPrice;
    }

    public void setMarketSellPrice(BigDecimal marketSellPrice) {
        this.marketSellPrice = marketSellPrice;
    }

    public String getBranchtype() {
        return branchtype;
    }

    public void setBranchtype(String branchtype) {
        this.branchtype = branchtype == null ? null : branchtype.trim();
    }

    public Long getOriginId() {
        return originId;
    }

    public void setOriginId(Long originId) {
        this.originId = originId;
    }

    public Short getCollectionFrom() {
        return collectionFrom;
    }

    public void setCollectionFrom(Short collectionFrom) {
        this.collectionFrom = collectionFrom;
    }
}