package cn.xkx.ssm.service;

import cn.xkx.ssm.dao.CategoryMapper;
import cn.xkx.ssm.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;

    public List<Category> findAllCategory(){
        return categoryMapper.selectAll();
    }
}
