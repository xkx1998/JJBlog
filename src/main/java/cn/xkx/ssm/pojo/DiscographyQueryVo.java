package cn.xkx.ssm.pojo;

import java.util.Date;
import java.util.List;

public class DiscographyQueryVo {
    private Long discographyId;

    private String discographyName;

    private Date discographyDate;

    private String discographyPhoto;

    private String discographyDescripthion;

    private List<Song> songs;

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
        this.discographyName = discographyName;
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
        this.discographyPhoto = discographyPhoto;
    }

    public String getDiscographyDescripthion() {
        return discographyDescripthion;
    }

    public void setDiscographyDescripthion(String discographyDescripthion) {
        this.discographyDescripthion = discographyDescripthion;
    }

    public List<Song> getSongs() {
        return songs;
    }

    public void setSongs(List<Song> songs) {
        this.songs = songs;
    }
}
