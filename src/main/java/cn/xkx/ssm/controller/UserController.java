package cn.xkx.ssm.controller;

import cn.xkx.ssm.pojo.Message;
import cn.xkx.ssm.pojo.User;
import cn.xkx.ssm.service.ArticleService;
import cn.xkx.ssm.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

    /**
     * 注册
     *
     * @param username
     * @param password
     * @return
     */
    @RequestMapping("/register")
    public String regist(@RequestParam("username") String username, @RequestParam("password") String password) {
        //封装表单数据
        User user = new User();
        //默认用户头像路径
        user.setUserPhoto("static/img/qjjn.jpg");
        user.setUserName(username);
        user.setUserPassword(password);
        userService.regist(user);
        return "user/login";
    }

    /**
     * 验证用户名
     *
     * @param username
     * @return
     */
    @RequestMapping(value = "/checkUsername", method = RequestMethod.POST)
    @ResponseBody
    public Message checkUsername(@RequestParam("username") String username) {
        //先判断用户名是否是合法的表达式
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!username.matches(regx)) {
            return Message.fail().add("va_msg", "用户名必须是2-5位中文或者6-16位英文和数字的组合");
        }

        User user = userService.findUserByName(username);
        if (user == null) return Message.success();
        else return Message.fail().add("va_msg", "该用户名已经注册过了");
    }

    /**
     * 验证密码
     *
     * @param password
     * @return
     */
    @RequestMapping(value = "/checkPassword", method = RequestMethod.POST)
    @ResponseBody
    public Message checkPassword(@RequestParam("password") String password) {
        //先判断用户名是否是合法的表达式
        String regx = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$";
        if (!password.matches(regx)) {
            return Message.fail().add("va_msg", "密码必须是6-16位英文和数字的组合");
        } else return Message.success();
    }

    @RequestMapping("/login")
    public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password,
                              HttpSession session) {
        Subject currentUser = SecurityUtils.getSubject();
        // let's login the current user so we can check against roles and permissions:
        // 测试当前用户是否已经被认证，即是否已经登录
        // 调用Subject的isAuthenticated()
        ModelAndView modelAndView = new ModelAndView();
        if (!currentUser.isAuthenticated()) {
            //把用户名和密码封装为UsernamePasswordToken对象
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            //rememberme
            token.setRememberMe(true);
            try {
                // 执行登录.
                currentUser.login(token);
            }
            // ... catch more exceptions here (maybe custom ones specific to your application?
            //认证时所有异常的父类
            catch (AuthenticationException ae) {
                modelAndView.addObject("log_msg", "用户名或密码错误，请重新输入");
                modelAndView.setViewName("user/login");
                return modelAndView;
            }
        }
        User user = userService.findUserByName(username);
        session.setAttribute("userId",user.getUserId());
        session.setAttribute("username",username);
        session.setAttribute("user",userService.findUserByName(username));
        //modelAndView.addObject("articles",articleService.getAllArticle());
        modelAndView.setViewName("main/index");
        return modelAndView;
    }
}
