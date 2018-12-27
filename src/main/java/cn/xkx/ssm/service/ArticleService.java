package cn.xkx.ssm.service;

import cn.xkx.ssm.dao.ArticleMapper;
import cn.xkx.ssm.dao.UserMapper;
import cn.xkx.ssm.pojo.Article;
import cn.xkx.ssm.pojo.ArticleQueryVo;
import cn.xkx.ssm.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private UserMapper userMapper;

    public void addArticle(Article article) {
        articleMapper.insertSelective(article);
    }

    public List<ArticleQueryVo> getAllArticle() {
        return articleMapper.selectAll();
    }

    public Article getOneArtcile(Long articleId) {
        return articleMapper.selectByPrimaryKey(articleId);
    }

    //文章浏览量+1
    public void addArticleView(Article article) {
        articleMapper.updateByPrimaryKeySelective(article);
    }

    /**
     * 查找下一篇文章
     *
     * @param articleId
     * @return
     */
    public Article findNextArticle(Long articleId) {
        return articleMapper.selectNextArticleById(articleId);
    }

    /**
     * 根据分类Id查找文章
     *
     * @param categoryId
     * @return
     */
    public List<ArticleQueryVo> getAllArticleByCategoryId(Long categoryId) {
        return articleMapper.selectAllByCategoryId(categoryId);
    }

    /**
     * 根据标签Id查找文章
     *
     * @param labelId
     * @return
     */
    public List<ArticleQueryVo> getAllArticleByLabelId(Long labelId) {
        return articleMapper.selectAllByLabelId(labelId);
    }

    /**
     * 更新文章评论数
     * @param articleId
     */
    public void updateArticleCommentCount(Long articleId){
        articleMapper.updateArticleCommentCount(articleId);
    }

    /**
     * 点赞
     * @param articleId
     */
    public void addArticleLike(Long articleId) {
        articleMapper.addArticleLike(articleId);
    }

    /**
     * 查找上一篇
     * @param articleId
     * @return
     */
    public Article findLastArticle(Long articleId) {
        return articleMapper.selectLastArticleById(articleId);
    }
}
