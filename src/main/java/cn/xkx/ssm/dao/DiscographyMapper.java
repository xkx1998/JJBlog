package cn.xkx.ssm.dao;

import cn.xkx.ssm.pojo.Discography;
import cn.xkx.ssm.pojo.DiscographyExample;
import java.util.List;

import cn.xkx.ssm.pojo.DiscographyQueryVo;
import org.apache.ibatis.annotations.Param;

public interface DiscographyMapper {
    long countByExample(DiscographyExample example);

    int deleteByExample(DiscographyExample example);

    int deleteByPrimaryKey(Long discographyId);

    int insert(Discography record);

    int insertSelective(Discography record);

    List<Discography> selectByExample(DiscographyExample example);

    Discography selectByPrimaryKey(Long discographyId);

    int updateByExampleSelective(@Param("record") Discography record, @Param("example") DiscographyExample example);

    int updateByExample(@Param("record") Discography record, @Param("example") DiscographyExample example);

    int updateByPrimaryKeySelective(Discography record);

    int updateByPrimaryKey(Discography record);

    //查询所有专辑关联查询歌曲
    List<DiscographyQueryVo> selectAllDiscographyAndSongs(Long discographyId);
}