package cn.xkx.ssm.dao;

import cn.xkx.ssm.pojo.Article;
import cn.xkx.ssm.pojo.ArticleExample;

import java.util.List;

import cn.xkx.ssm.pojo.ArticleQueryVo;
import org.apache.ibatis.annotations.Param;

public interface ArticleMapper {
    long countByExample(ArticleExample example);

    int deleteByExample(ArticleExample example);

    int deleteByPrimaryKey(Long articleId);

    int insert(Article record);

    int insertSelective(Article record);

    List<Article> selectByExample(ArticleExample example);

    //查找所有文章和作者
    List<ArticleQueryVo> selectAll();

    //查找下一篇文章
    Article selectNextArticleById(Long articleId);

    //根据分类Id查找所有文章
    List<ArticleQueryVo> selectAllByCategoryId(Long articleId);

    //根据标签Id查找所有文章
    List<ArticleQueryVo> selectAllByLabelId(Long labelId);

    Article selectByPrimaryKey(Long articleId);

    int updateByExampleSelective(@Param("record") Article record, @Param("example") ArticleExample example);

    int updateByExample(@Param("record") Article record, @Param("example") ArticleExample example);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKey(Article record);

    void updateArticleCommentCount(Long articleId);

    void addArticleLike(Long articleId);

    Article selectLastArticleById(Long articleId);
}