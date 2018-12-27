package cn.xkx.ssm.service;

import cn.xkx.ssm.dao.CommentMapper;
import cn.xkx.ssm.pojo.Comment;
import cn.xkx.ssm.pojo.CommentQueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentMapper commentMapper;

    public List<CommentQueryVo> getAllComment(Long articleId) {
        return commentMapper.selectAllComment(articleId);
    }

    public Long getCommentCount(Long articleId) {
        return commentMapper.getCommentCount(articleId);
    }

    public void insertComment(Comment comment) {
        commentMapper.insertSelective(comment);
    }

    public void deleteCommentById(Long commentId) {
        commentMapper.deleteByPrimaryKey(commentId);
    }

    public void addCommentLike(Long commentId) {
        commentMapper.addCommentLike(commentId);
    }
}
