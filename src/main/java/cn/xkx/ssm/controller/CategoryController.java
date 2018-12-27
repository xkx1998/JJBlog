package cn.xkx.ssm.controller;

import cn.xkx.ssm.pojo.Category;
import cn.xkx.ssm.pojo.Message;
import cn.xkx.ssm.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value="/getAllCategory",method = RequestMethod.GET)
    @ResponseBody
    public Message findAllCategory() {
        List<Category> categories = categoryService.findAllCategory();
        return Message.success().add("categories",categories);
    }
}
