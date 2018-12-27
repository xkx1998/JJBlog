package cn.xkx.ssm.pojo;

import java.util.Date;

public class Discography {
    private Long discographyId;

    private String discographyName;

    private Date discographyDate;

    private String discographyPhoto;

    private String discographyDescripthion;

    public Long getDiscographyId() {
        return discographyId;
    }

    public void setDiscographyId(Long discographyId) {
        this.discographyId = discographyId;
    }

    public String getDiscographyName() {
        return discographyName;
    }

    public void setDiscographyName(String discographyName) {
        this.discographyName = discographyName == null ? null : discographyName.trim();
    }

    public Date getDiscographyDate() {
        return discographyDate;
    }

    public void setDiscographyDate(Date discographyDate) {
        this.discographyDate = discographyDate;
    }

    public String getDiscographyPhoto() {
        return discographyPhoto;
    }

    public void setDiscographyPhoto(String discographyPhoto) {
        this.discographyPhoto = discographyPhoto == null ? null : discographyPhoto.trim();
    }

    public String getDiscographyDescripthion() {
        return discographyDescripthion;
    }

    public void setDiscographyDescripthion(String discographyDescripthion) {
        this.discographyDescripthion = discographyDescripthion == null ? null : discographyDescripthion.trim();
    }
}