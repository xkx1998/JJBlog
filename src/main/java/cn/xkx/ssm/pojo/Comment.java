package cn.xkx.ssm.pojo;

import java.util.Date;

public class Comment {
    private Long commentId;

    private Long userId;

    private Long articleId;

    private Long commentLikeCount;

    private Date commentDate;

    private String commentContent;

    private Long commentStair;

    private Long parentCommendId;

    public Long getCommentId() {
        return commentId;
    }

    public void setCommentId(Long commentId) {
        this.commentId = commentId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public Long getCommentLikeCount() {
        return commentLikeCount;
    }

    public void setCommentLikeCount(Long commentLikeCount) {
        this.commentLikeCount = commentLikeCount;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }

    public Long getCommentStair() {
        return commentStair;
    }

    public void setCommentStair(Long commentStair) {
        this.commentStair = commentStair;
    }

    public Long getParentCommendId() {
        return parentCommendId;
    }

    public void setParentCommendId(Long parentCommendId) {
        this.parentCommendId = parentCommendId;
    }
}