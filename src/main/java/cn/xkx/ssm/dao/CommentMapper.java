package cn.xkx.ssm.dao;

import cn.xkx.ssm.pojo.Comment;
import cn.xkx.ssm.pojo.CommentExample;
import java.util.List;

import cn.xkx.ssm.pojo.CommentQueryVo;
import org.apache.ibatis.annotations.Param;

public interface CommentMapper {
    long countByExample(CommentExample example);

    int deleteByExample(CommentExample example);

    int deleteByPrimaryKey(Long commentId);

    int insert(Comment record);

    int insertSelective(Comment record);

    List<Comment> selectByExample(CommentExample example);

    Comment selectByPrimaryKey(Long commentId);

    List<CommentQueryVo> selectAllComment(Long articleId);

    int updateByExampleSelective(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByExample(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);

    Long getCommentCount(Long articleId);

    void addCommentLike(Long commentId);
}