package cn.xkx.ssm.service;

import cn.xkx.ssm.dao.DiscographyMapper;
import cn.xkx.ssm.pojo.Discography;
import cn.xkx.ssm.pojo.DiscographyQueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiscographyService {

    @Autowired
    private DiscographyMapper discographyMapper;

    public List<DiscographyQueryVo> findAllDiscographyAndSongs(Long discographyId) {
        return discographyMapper.selectAllDiscographyAndSongs(discographyId);
    }

    public List<Discography> findAll() {
        return discographyMapper.selectByExample(null);
    }
}
