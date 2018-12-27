package cn.xkx.ssm.pojo;

public class Song {
    private Long songId;

    private String songName;

    private Long discographyId;

    public Long getSongId() {
        return songId;
    }

    public void setSongId(Long songId) {
        this.songId = songId;
    }

    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName == null ? null : songName.trim();
    }

    public Long getDiscographyId() {
        return discographyId;
    }

    public void setDiscographyId(Long discographyId) {
        this.discographyId = discographyId;
    }
}