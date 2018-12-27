package cn.xkx.ssm.dao;

import cn.xkx.ssm.pojo.Category;
import cn.xkx.ssm.pojo.CategoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CategoryMapper {
    long countByExample(CategoryExample example);

    int deleteByExample(CategoryExample example);

    int deleteByPrimaryKey(Long categoryId);

    int insert(Category record);

    int insertSelective(Category record);

    List<Category> selectByExampleWithBLOBs(CategoryExample example);

    List<Category> selectByExample(CategoryExample example);

    List<Category> selectAll();

    Category selectByPrimaryKey(Long categoryId);

    int updateByExampleSelective(@Param("record") Category record, @Param("example") CategoryExample example);

    int updateByExampleWithBLOBs(@Param("record") Category record, @Param("example") CategoryExample example);

    int updateByExample(@Param("record") Category record, @Param("example") CategoryExample example);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKeyWithBLOBs(Category record);

    int updateByPrimaryKey(Category record);
}