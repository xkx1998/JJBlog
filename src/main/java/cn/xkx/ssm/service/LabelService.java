package cn.xkx.ssm.service;

import cn.xkx.ssm.dao.LabelMapper;
import cn.xkx.ssm.pojo.Label;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LabelService {
    @Autowired
    private LabelMapper labelMapper;

    public List<Label> findAllLabel(){
        return labelMapper.selectAll();
    }
}
