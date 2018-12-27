package cn.xkx.ssm.service;

import cn.xkx.ssm.dao.UserMapper;
import cn.xkx.ssm.pojo.User;
import cn.xkx.ssm.tool.PasswordHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public User findUserByName(String username) {
        return userMapper.selectByName(username);
    }

    public void regist(User user) {
        new PasswordHelper().encryPassword(user);
        userMapper.insertSelective(user);
    }

    public User findUserById(Long userId) {
        return userMapper.selectByPrimaryKey(userId);
    }
}
