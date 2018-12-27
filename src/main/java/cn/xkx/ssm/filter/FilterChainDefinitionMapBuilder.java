package cn.xkx.ssm.filter;

import java.util.LinkedHashMap;


public class FilterChainDefinitionMapBuilder {
    public LinkedHashMap<String, String> buildFilterChainDefinitionMap() {
        LinkedHashMap<String, String> map = new LinkedHashMap<>();
        map.put("/jsps/articles/add_Article.jsp","authc");
        map.put("/jsps/articles/look_Article.jsp","authc");
    /* map.put("/register.jsp", "anon");
        map.put("/login.jsp ", "anon");
        map.put("/shiro/login", "anon");
        map.put("/shiro/regist","anon");
        map.put("/shiro/logout", "logout");
        //必须通过认证才可以登录
        map.put("/user.jsp", "authc,roles[user]");
        map.put("/admin.jsp", "authc,roles[admin]");
        //可以通过记住我登录
        map.put("/list.jsp", "user");*/
        map.put("/**", "anon");
        return map;
    }


}
