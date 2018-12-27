package cn.xkx.ssm.controller;

import cn.xkx.ssm.pojo.Label;
import cn.xkx.ssm.pojo.Message;
import cn.xkx.ssm.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/label")
public class LabelController {
    @Autowired
    private LabelService labelService;

    @RequestMapping("/getAllLabel")
    @ResponseBody
    public Message findAllLabel(){
        List<Label> list = labelService.findAllLabel();
        return Message.success().add("labels",list);
    }
}
