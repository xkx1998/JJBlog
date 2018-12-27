package cn.xkx.ssm.dao;

import cn.xkx.ssm.pojo.Label;
import cn.xkx.ssm.pojo.LabelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LabelMapper {
    long countByExample(LabelExample example);

    int deleteByExample(LabelExample example);

    int deleteByPrimaryKey(Long labelId);

    int insert(Label record);

    int insertSelective(Label record);

    List<Label> selectByExampleWithBLOBs(LabelExample example);

    List<Label> selectByExample(LabelExample example);

    List<Label> selectAll();
    Label selectByPrimaryKey(Long labelId);

    int updateByExampleSelective(@Param("record") Label record, @Param("example") LabelExample example);

    int updateByExampleWithBLOBs(@Param("record") Label record, @Param("example") LabelExample example);

    int updateByExample(@Param("record") Label record, @Param("example") LabelExample example);

    int updateByPrimaryKeySelective(Label record);

    int updateByPrimaryKeyWithBLOBs(Label record);

    int updateByPrimaryKey(Label record);
}