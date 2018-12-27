package cn.xkx.ssm.controller;

import cn.xkx.ssm.pojo.Article;
import cn.xkx.ssm.pojo.Comment;
import cn.xkx.ssm.pojo.CommentQueryVo;
import cn.xkx.ssm.pojo.Message;
import cn.xkx.ssm.service.ArticleService;
import cn.xkx.ssm.service.CommentService;
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
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;
    /**
     * 查找所有评论并分页
     *
     * @param pn
     * @param pageSize
     * @return
     */
    @RequestMapping("/getAllComment")
    @ResponseBody
    public Message getAllComment(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                                 @RequestParam(value = "pageSize", defaultValue = "3") Integer pageSize,
                                 @RequestParam(value = "articleId", required = true) Long articleId) {
        PageHelper.startPage(pn, pageSize);
        List<CommentQueryVo> list = commentService.getAllComment(articleId);
        PageInfo pageInfo = new PageInfo(list, 5);
        return Message.success().add("pageInfo", pageInfo);
    }

    /**
     * 删除评论
     * @param pn
     * @param commentId
     * @return
     */
    @RequestMapping("/deleteCommentById")
    @ResponseBody
    public Message deleteCommentById(@RequestParam(value = "pn",required = true) Integer pn,
                                     @RequestParam(value = "commentId") Long commentId,
                                     @RequestParam(value = "articleId") Long articleId){
        //删除评论
        commentService.deleteCommentById(commentId);

        //更新文章评论数
        articleService.updateArticleCommentCount(articleId);
        return getAllComment(pn,3,articleId);
    }

    /**
     * 点赞评论
     * @param pn
     * @param commentId
     * @param articleId
     * @return
     */
    @RequestMapping("/addCommentLike")
    @ResponseBody
    public Message addCommentLike(@RequestParam(value = "pn",required = true) Integer pn,
                                  @RequestParam(value = "commentId") Long commentId,
                                  @RequestParam(value = "articleId") Long articleId){
        //点赞
        commentService.addCommentLike(commentId);

        return getAllComment(pn,3,articleId);
    }

    /**
     * 添加评论
     * @param request
     * @param articleId
     * @return
     */
    @RequestMapping("/addComment")
    @ResponseBody
    public ModelAndView addComment(HttpServletRequest request, @RequestParam(value = "articleId") Long articleId) {
       ModelAndView modelAndView = new ModelAndView();
        //封装comment对象
        String comment_content = request.getParameter("comment_cotent");
        Comment comment = new Comment();
        comment.setArticleId(articleId);
        comment.setUserId((Long) request.getSession().getAttribute("userId"));
        comment.setCommentContent(comment_content);

        //查询文章的评论数
        Long cnt = commentService.getCommentCount(articleId);

        //设置楼层
        comment.setCommentStair(cnt+1);

        //更新评论
        commentService.insertComment(comment);
        //更新article的评论数
        articleService.updateArticleCommentCount(articleId);

        //根据Id查找文章
        Article article = articleService.getOneArtcile(articleId);
        //查询下一篇文章
        Article nextArticle = articleService.findNextArticle(article.getArticleId());
        //根据userId查找作者
        String article_username = userService.findUserById(article.getUserId()).getUserName();
        String userName = (String)request.getSession().getAttribute("username");
        modelAndView.addObject("article_username", article_username);
        modelAndView.addObject("article", article);
        modelAndView.addObject("nextArticle", nextArticle);
        modelAndView.addObject("userName",userName);
        modelAndView.setViewName("articles/look_article_detail");
        return modelAndView;
    }


}
