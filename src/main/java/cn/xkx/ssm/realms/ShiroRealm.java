package cn.xkx.ssm.realms;

import cn.xkx.ssm.pojo.User;
import cn.xkx.ssm.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
            throws AuthenticationException {
        // 1.将AuthenticationToken转换为UsernamePasswordToken
        UsernamePasswordToken upToken = (UsernamePasswordToken) authenticationToken;

        // 2.UsernamePasswordToken中获取username
        String username = upToken.getUsername();
        System.out.println("username========="+username);
        // 3.调用数据库中的方法，从数据库中查询username对应的用户记录
        //System.out.println("从数据库中获取username: " + username + "所对应的用户信息");
        User user = userService.findUserByName(username);
        if(user == null) {
            throw new UnknownAccountException("用户不存在");
        }

        // 6.根据用户的情况，来构建AuthenticationInfo对象并返回,通常使用的实现类是SimpleAuthenticationInfo
        //以下信息是从数据库中获取
        //1).principal:认证的实体信息，可以是username，也可以是数据库表对应的用户的实体类对象
        Object principal = user.getUserName();

        //2).credentials:密码
        Object credentials = user.getUserPassword();

        //3).realmName:当前realm对象的name，请用父类的getName()方法即可
        String realmName = getName();
        //4).盐值
        ByteSource credentialsSalt = ByteSource.Util.bytes(user.getCredentialsSalt());

        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal, credentials,credentialsSalt, realmName);

        return info;
    }

    public static void main(String[] args) {
        RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();
        String hashAlgorithmName = "MD5";
        Object credentials = "123";
        Object salt = ByteSource.Util.bytes("xukexiang"+"6f626df23660a8418e383d3155f9fd42");
        int hashIterations = 2;
        Object result = new SimpleHash(hashAlgorithmName,credentials,salt,hashIterations).toHex();
        System.out.println(result);
    }

    //授权会被shiro授权的方法
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //1.从PrincipalCollection 中来获取登录用户的信息
        Object principal = principalCollection.getPrimaryPrincipal();

        //2. 利用登录的用户信息来确认当前用户的角色或权限(可能需要查询数据库)

        Set<String> roles = new HashSet<>();
        roles.add("user");
        if("admin".equals(principal)) {
            roles.add("admin");
        }
        //3.创建SimpleAuthorizationInfo,并设置roles属性，
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roles);
        //4.返回SimpleAuthorizationInfo对象
        return info;
    }
}