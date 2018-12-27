package cn.xkx.ssm.controller;

import cn.xkx.ssm.pojo.Article;
import cn.xkx.ssm.pojo.ArticleQueryVo;
import cn.xkx.ssm.pojo.Message;
import cn.xkx.ssm.pojo.User;
import cn.xkx.ssm.service.ArticleService;
import cn.xkx.ssm.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;

    /**
     * 添加文章
     *
     * @param title
     * @param content
     * @param labelId
     * @param categoryId
     * @param session
     * @return
     */
    @RequestMapping("/add")
    public ModelAndView addArticle(@RequestParam("title") String title, @RequestParam("editorValue") String content
            , @RequestParam("labelId") Long labelId, @RequestParam("categoryId") Long categoryId,
                                   HttpSession session) {
        //封装article
        Article article = new Article();
        article.setArticleTitle(title);
        article.setArticleContent(content);
        article.setCategoryId(categoryId);
        article.setLabelId(labelId);

        //获得用户ID
        String username = (String) session.getAttribute("username");
        User user = userService.findUserByName(username);
        Long userId = user.getUserId();

        //设置article作者id
        article.setUserId(userId);

        articleService.addArticle(article);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("article_msg", "上传成功,待管理员审核通过...");
        modelAndView.setViewName("articles/add_Article");
        return modelAndView;
    }

    /**
     * 返回文章列表和分页信息
     * 分页用pageHeler
     *
     * @param pn
     * @return
     */
    @RequestMapping("/getAllArticle")
    @ResponseBody
    public Message getAllArticle(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                                 @RequestParam(value = "pageSize", defaultValue = "3") Integer pageSize,
                                 @RequestParam(value = "categoryId", required = false) Long categoryId,
                                 @RequestParam(value = "labelId", required = false) Long labelId) {
        List<ArticleQueryVo> list = new ArrayList<>();
        if (categoryId == null && labelId == null) {
            //在查询之前调用,传入页码和页的大小
            PageHelper.startPage(pn, pageSize);
            list = articleService.getAllArticle();
        } else if (categoryId != null) {
            PageHelper.startPage(pn,pageSize);
            list = articleService.getAllArticleByCategoryId(categoryId);
        } else {
            PageHelper.startPage(pn, pageSize);
            list = articleService.getAllArticleByLabelId(labelId);
        }
        //使用PageInfo包装查询后的结果，只需要将pageInfo交给页面
        //封装分页信息,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list, 5);
        return Message.success().add("pageInfo", pageInfo);

    }

    /**
     * 1、查询文章信息
     * 2、增加文章浏览量
     * 3、查询下一篇文章
     *
     * @param articleId
     * @return
     */
    @RequestMapping("/getOneArticle")
    public ModelAndView getOneArticle(@RequestParam(value = "articleId") Long articleId, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();

        //根据Id查找文章
        Article article = articleService.getOneArtcile(articleId);

        //文章的浏览量+1
        article.setArticleViews(article.getArticleViews() + 1);
        articleService.addArticleView(article);

        //查询上一篇文章
        Article lastArticle = articleService.findLastArticle(article.getArticleId());

        //查询下一篇文章
        Article nextArticle = articleService.findNextArticle(article.getArticleId());
        //根据userId查找作者
        String article_username = userService.findUserById(article.getUserId()).getUserName();
        modelAndView.addObject("article_username", article_username);
        modelAndView.addObject("article", article);
        modelAndView.addObject("nextArticle", nextArticle);
        modelAndView.addObject("lastArticle",lastArticle);
        modelAndView.setViewName("articles/look_article_detail");
        return modelAndView;
    }

    /**
     * 文章点赞
     * @param articleId
     * @param request
     * @return
     */
    @RequestMapping("/addArticleLike")
    public ModelAndView addArticleLike(@RequestParam(value = "articleId") Long articleId,HttpServletRequest request ) {
        ModelAndView modelAndView = new ModelAndView();
        //点赞
        articleService.addArticleLike(articleId);

        //根据Id查找文章
        Article article = articleService.getOneArtcile(articleId);
        //查询下一篇文章
        Article nextArticle = articleService.findNextArticle(article.getArticleId());

        //根据userId查找作者
        String article_username = userService.findUserById(article.getUserId()).getUserName();
        modelAndView.addObject("article_username", article_username);
        modelAndView.addObject("article", article);
        modelAndView.addObject("nextArticle", nextArticle);
        modelAndView.setViewName("articles/look_article_detail");
        return modelAndView;
    }
}
