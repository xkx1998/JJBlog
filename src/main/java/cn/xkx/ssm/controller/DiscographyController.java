package cn.xkx.ssm.controller;

import cn.xkx.ssm.pojo.Discography;
import cn.xkx.ssm.pojo.DiscographyQueryVo;
import cn.xkx.ssm.pojo.Message;
import cn.xkx.ssm.service.DiscographyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/discography")
public class DiscographyController {
    @Autowired
    private DiscographyService discographyService;

    @RequestMapping("/findAllAndSongs")
    @ResponseBody
    public Message findAllAndSongs(@RequestParam("discographyId") Long discographyId) {
        List<DiscographyQueryVo> list = discographyService.findAllDiscographyAndSongs(discographyId);
        return Message.success().add("list",list);
    }

    @RequestMapping("/findAll")
    @ResponseBody
    public Message findAll() {
        List<Discography> list = discographyService.findAll();
        return Message.success().add("list",list);
    }
}
